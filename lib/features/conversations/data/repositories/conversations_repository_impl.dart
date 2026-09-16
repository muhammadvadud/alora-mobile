import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/utils/app_logger.dart';

import '../../domain/entities/conversation.dart';
import '../../domain/repositories/conversations_repository.dart';
import '../datasources/conversations_local_ds.dart';
import '../datasources/conversations_remote_ds.dart';
import '../mappers/conversation_mapper.dart';

/// ConversationsRepository'ning haqiqiy amalga oshirishi.
/// Tarmoqdan olish + Hive kesh (stale-while-revalidate).
class ConversationsRepositoryImpl implements ConversationsRepository {
  ConversationsRepositoryImpl(this._remote, this._local);

  final ConversationsRemoteDataSource _remote;
  final ConversationsLocalDataSource _local;

  @override
  Future<(List<Conversation> items, String? nextCursor)> list({
    String? cursor,
    String? search,
  }) async {
    try {
      final paginated = await _remote.list(cursor: cursor, search: search);
      // Birinchi sahifadan yangilanganlar — keshga saqlash
      if (cursor == null) {
        await _local.cache(paginated.results);
      }
      final entities = paginated.results.map((dto) => dto.toEntity()).toList();
      return (entities, paginated.next);
    } on Failure catch (error) {
      // Tarmoq xatosi va birinchi sahifa bo'lsa — keshdan olish
      final isNetwork = error.maybeWhen(
        network: () => true,
        orElse: () => false,
      );
      if (isNetwork && cursor == null) {
        final cached = await _local.getCached();
        if (cached.isNotEmpty) {
          logger.i('Keshdan ${cached.length} ta suhbat yuklandi');
          return (cached, null);
        }
      }
      rethrow;
    }
  }

  @override
  Future<Conversation> create() async {
    final dto = await _remote.create();
    return dto.toEntity();
  }

  @override
  Future<void> archive(String id) async {
    await _remote.archive(id);
    // Keshdan ham o'chirish
    await _local.remove(id);
  }

  @override
  Future<String> transcript(String id) async {
    return _remote.transcript(id);
  }

  @override
  Future<List<Conversation>> getCached() => _local.getCached();
}
