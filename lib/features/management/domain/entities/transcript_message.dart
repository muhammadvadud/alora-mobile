import 'dart:convert';

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
    if (names.isEmpty && isTechnicalPayload) names.add('Natija');
    return names;
  }

  bool get isTechnicalPayload {
    if (role == 'tool') return true;
    final value = content.trim();
    if (!value.startsWith('{') || !value.endsWith('}')) return false;
    try {
      final decoded = jsonDecode(value);
      return decoded is Map &&
          (decoded.containsKey('state') ||
              decoded.containsKey('next_question') ||
              decoded.containsKey('products') ||
              decoded.containsKey('totals'));
    } on FormatException {
      return false;
    }
  }

  String get displayContent => isTechnicalPayload ? '' : content;
}
