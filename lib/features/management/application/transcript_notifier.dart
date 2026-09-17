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
    return repository.transcript(conversationId);
  }
}
