/// Suhbat transkriptidagi bitta xabar (`conversations/{id}/transcript/`).
class TranscriptMessage {
  final String role;
  final String content;
  final List<dynamic> toolCalls;
  final dynamic toolResult;
  final DateTime? createdAt;

  const TranscriptMessage({
    required this.role,
    required this.content,
    this.toolCalls = const [],
    this.toolResult,
    this.createdAt,
  });

  bool get isAssistant => role == 'assistant';

  /// Transkript xabaridagi asbob (tool) nomlarini aniqlaydi.
  /// `tool_calls` ro'yxatdan (obyektlar key qatorida `name` maydoni bilan)
  /// nomlarni chiqarib beradi.
  List<String> get toolNames {
    final names = <String>[];
    for (final call in toolCalls) {
      if (call is Map) {
        final name = call['name'] ?? call['tool_name'];
        if (name is String && name.isNotEmpty) names.add(name);
      }
    }
    return names;
  }
}
