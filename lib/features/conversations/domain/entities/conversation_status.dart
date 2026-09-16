/// Suhbat holati (backend ConversationStatus choices)
enum ConversationStatus {
  active,
  archived,
  unknown;

  static ConversationStatus fromName(String? value) {
    for (final status in ConversationStatus.values) {
      if (status.name == value) return status;
    }
    return ConversationStatus.unknown;
  }
}
