import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/entities/transcript_message.dart';
import 'providers.dart';

part 'transcript_notifier.g.dart';

/// Suhbat transkripti (manager uchun o'qish rejimi).
@riverpod
class TranscriptNotifier extends _$TranscriptNotifier {
  @override
  Future<List<TranscriptMessage>> build(String conversationId) async {
    final repository = ref.watch(teamRepositoryProvider);
    final messages = await repository.transcript(conversationId);
    return messages
        .where((message) => message.content.trim().isNotEmpty || message.toolNames.isNotEmpty)
        .toList();
  }
}
