// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'conversations_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Suhbatlar ro'yxatini boshqaruvchi notifier.
/// Sahifalash, 300 ms debounce qidiruv, filtr, arxivlash, yangi suhbat.

@ProviderFor(ConversationsNotifier)
final conversationsProvider = ConversationsNotifierProvider._();

/// Suhbatlar ro'yxatini boshqaruvchi notifier.
/// Sahifalash, 300 ms debounce qidiruv, filtr, arxivlash, yangi suhbat.
final class ConversationsNotifierProvider
    extends $NotifierProvider<ConversationsNotifier, ConversationsState> {
  /// Suhbatlar ro'yxatini boshqaruvchi notifier.
  /// Sahifalash, 300 ms debounce qidiruv, filtr, arxivlash, yangi suhbat.
  ConversationsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'conversationsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$conversationsNotifierHash();

  @$internal
  @override
  ConversationsNotifier create() => ConversationsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConversationsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConversationsState>(value),
    );
  }
}

String _$conversationsNotifierHash() => r'54b0f4f6fdfaf15bace1ab6cf8f3738b7d4d98af';

/// Suhbatlar ro'yxatini boshqaruvchi notifier.
/// Sahifalash, 300 ms debounce qidiruv, filtr, arxivlash, yangi suhbat.

abstract class _$ConversationsNotifier extends $Notifier<ConversationsState> {
  ConversationsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ConversationsState, ConversationsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ConversationsState, ConversationsState>,
              ConversationsState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
