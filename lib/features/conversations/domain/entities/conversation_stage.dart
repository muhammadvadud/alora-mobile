/// Suhbat bosqichi (backend ConversationStage choices)
enum ConversationStage {
  need,
  recommend,
  measure,
  calc,
  variants,
  order,
  unknown;

  static ConversationStage fromName(String? value) {
    for (final stage in ConversationStage.values) {
      if (stage.name == value) return stage;
    }
    return ConversationStage.unknown;
  }
}
