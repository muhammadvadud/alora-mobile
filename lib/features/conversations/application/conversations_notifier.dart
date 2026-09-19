import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/utils/app_logger.dart';
import 'package:alora_mobile/core/utils/debounce.dart';

import '../domain/entities/conversation.dart';
import 'conversations_state.dart';
import 'providers.dart';

part 'conversations_notifier.g.dart';

/// Suhbatlar ro'yxatini boshqaruvchi notifier.
/// Sahifalash, 300 ms debounce qidiruv, filtr, arxivlash, yangi suhbat.
@Riverpod(keepAlive: true)
class ConversationsNotifier extends _$ConversationsNotifier {
  Debouncer? _debouncer;

  @override
  ConversationsState build() {
    _debouncer = Debouncer(delay: const Duration(milliseconds: 300));
    ref.onDispose(() => _debouncer?.cancel());
    unawaited(_loadInitial());
    return const ConversationsState.initial();
  }

  /// Dastlabki yuklash
  Future<void> _loadInitial() async {
    state = const ConversationsState.loading();
    await _fetch(search: '');
  }

  /// Xatodan keyin qayta yuklash
  Future<void> retry() async {
    final (query, filter) = state.maybeWhen(
      error: (_, searchQuery, filterType) => (searchQuery, filterType),
      orElse: () => ('', ConversationFilterType.all),
    );
    state = ConversationsState.loading(searchQuery: query, filterType: filter);
    await _fetch(search: query, filterType: filter);
  }

  ConversationFilterType get _currentFilter => state.maybeWhen(
    loaded: (_, _, _, _, filterType) => filterType,
    empty: (_, filterType) => filterType,
    error: (_, _, filterType) => filterType,
    orElse: () => ConversationFilterType.all,
  );

  /// Qidiruv (300 ms debounce bilan)
  void search(String query) {
    _debouncer?.run(() {
      unawaited(_fetch(search: query));
    });
  }

  /// Filtrni almashtirish (client-side, ro'yxat holati saqlanadi)
  void setFilter(ConversationFilterType type) {
    state = state.maybeWhen(
      loaded: (items, nextCursor, isLoadingMore, searchQuery, _) => ConversationsState.loaded(
        items: items,
        nextCursor: nextCursor,
        isLoadingMore: isLoadingMore,
        searchQuery: searchQuery,
        filterType: type,
      ),
      empty: (searchQuery, _) =>
          ConversationsState.empty(searchQuery: searchQuery, filterType: type),
      error: (failure, searchQuery, _) =>
          ConversationsState.error(failure: failure, searchQuery: searchQuery, filterType: type),
      orElse: () => state,
    );
  }

  /// Keyingi sahifani yuklash
  Future<void> loadMore() async {
    final loaded = state.maybeWhen(
      loaded: (items, nextCursor, isLoadingMore, searchQuery, filterType) =>
          (items, nextCursor, isLoadingMore, searchQuery, filterType),
      orElse: () => null,
    );
    if (loaded == null) return;
    final (items, nextCursor, isLoadingMore, searchQuery, filterType) = loaded;
    if (isLoadingMore || nextCursor == null) return;

    state = ConversationsState.loaded(
      items: items,
      nextCursor: nextCursor,
      isLoadingMore: true,
      searchQuery: searchQuery,
      filterType: filterType,
    );
    await _fetchMore(cursor: nextCursor);
  }

  /// Yangi suhbat yaratish va uning ID'sini qaytarish.
  /// Muvaffaqiyatsiz bo'lsa null.
  Future<String?> create() async {
    final repository = ref.read(conversationsRepositoryProvider);
    try {
      final conversation = await repository.create();
      final loaded = state.maybeWhen(
        loaded: (items, nextCursor, isLoadingMore, searchQuery, filterType) =>
            (items, nextCursor, isLoadingMore, searchQuery, filterType),
        orElse: () => null,
      );
      if (loaded != null) {
        final (items, nextCursor, isLoadingMore, searchQuery, filterType) = loaded;
        state = ConversationsState.loaded(
          items: [conversation, ...items],
          nextCursor: nextCursor,
          isLoadingMore: isLoadingMore,
          searchQuery: searchQuery,
          filterType: filterType,
        );
      }
      return conversation.id;
    } on Failure catch (error) {
      logger.e('Yangi suhbat yaratishda xato', error: error);
      return null;
    }
  }

  /// Suhbatni arxivlash (optimistic — avval ro'yxatdan olib tashlanadi)
  Future<void> archive(String id) async {
    final repository = ref.read(conversationsRepositoryProvider);
    final loaded = state.maybeWhen(
      loaded: (items, nextCursor, isLoadingMore, searchQuery, filterType) =>
          (items, nextCursor, isLoadingMore, searchQuery, filterType),
      orElse: () => null,
    );
    if (loaded != null) {
      final (items, nextCursor, isLoadingMore, searchQuery, filterType) = loaded;
      final updated = items.where((conversation) => conversation.id != id).toList();
      if (updated.isEmpty) {
        state = ConversationsState.empty(searchQuery: searchQuery, filterType: filterType);
      } else {
        state = ConversationsState.loaded(
          items: updated,
          nextCursor: nextCursor,
          isLoadingMore: isLoadingMore,
          searchQuery: searchQuery,
          filterType: filterType,
        );
      }
    }
    try {
      await repository.archive(id);
    } on Failure catch (error) {
      logger.e('Suhbatni arxivlashda xato', error: error);
      // Optimistik tarzda olib tashlangan ro'yxatni tiklash
      await _fetch(search: _currentSearch);
    }
  }

  String get _currentSearch => state.maybeWhen(
    loaded: (_, _, _, searchQuery, _) => searchQuery,
    empty: (searchQuery, _) => searchQuery,
    error: (_, searchQuery, _) => searchQuery,
    orElse: () => '',
  );

  Future<void> _fetch({required String search, ConversationFilterType? filterType}) async {
    final repository = ref.read(conversationsRepositoryProvider);
    final effectiveFilter = filterType ?? _currentFilter;
    try {
      final (items, nextCursor) = await repository.list(search: search);
      _setLoaded(
        items: items,
        nextCursor: nextCursor,
        searchQuery: search,
        filterType: effectiveFilter,
      );
    } on Failure catch (error) {
      state = ConversationsState.error(
        failure: error,
        searchQuery: search,
        filterType: effectiveFilter,
      );
    }
  }

  Future<void> _fetchMore({required String cursor}) async {
    final repository = ref.read(conversationsRepositoryProvider);
    try {
      final (newItems, nextCursor) = await repository.list(cursor: cursor);
      final loaded = state.maybeWhen(
        loaded: (items, nextCursor, isLoadingMore, searchQuery, filterType) =>
            (items, nextCursor, isLoadingMore, searchQuery, filterType),
        orElse: () => null,
      );
      if (loaded == null) return;
      final (currentItems, _, _, searchQuery, filterType) = loaded;
      state = ConversationsState.loaded(
        items: [...currentItems, ...newItems],
        nextCursor: nextCursor,
        isLoadingMore: false,
        searchQuery: searchQuery,
        filterType: filterType,
      );
    } on Failure catch (error) {
      final loaded = state.maybeWhen(
        loaded: (items, nextCursor, isLoadingMore, searchQuery, filterType) =>
            (items, nextCursor, isLoadingMore, searchQuery, filterType),
        orElse: () => null,
      );
      if (loaded != null) {
        final (items, nextCursor, _, searchQuery, filterType) = loaded;
        state = ConversationsState.loaded(
          items: items,
          nextCursor: nextCursor,
          isLoadingMore: false,
          searchQuery: searchQuery,
          filterType: filterType,
        );
      }
      logger.e("Keyingi sahifani yuklashda xato", error: error);
    }
  }

  void _setLoaded({
    required List<Conversation> items,
    required String? nextCursor,
    required String searchQuery,
    required ConversationFilterType filterType,
  }) {
    if (items.isEmpty) {
      state = ConversationsState.empty(searchQuery: searchQuery, filterType: filterType);
    } else {
      state = ConversationsState.loaded(
        items: items,
        nextCursor: nextCursor,
        isLoadingMore: false,
        searchQuery: searchQuery,
        filterType: filterType,
      );
    }
  }
}
