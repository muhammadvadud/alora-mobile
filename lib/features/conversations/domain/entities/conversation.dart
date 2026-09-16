import 'conversation_mode.dart';
import 'conversation_stage.dart';
import 'conversation_status.dart';

/// Suhbat domain modeli (UI uchun qulay shakl)
class Conversation {
  final String id;
  final String title;
  final ConversationStage stage;
  final ConversationMode mode;
  final ConversationStatus status;
  final DateTime? lastMessageAt;
  final int? totalAmount;
  final String? lastMessagePreview;
  final String? orderId;

  const Conversation({
    required this.id,
    required this.title,
    required this.stage,
    required this.mode,
    required this.status,
    this.lastMessageAt,
    this.totalAmount,
    this.lastMessagePreview,
    this.orderId,
  });

  bool get hasOrder => orderId != null;
}
