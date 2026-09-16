/// Suhbat rejimi (backend ConversationMode choices)
enum ConversationMode {
  seller,
  customer,
  unknown;

  static ConversationMode fromName(String? value) {
    for (final mode in ConversationMode.values) {
      if (mode.name == value) return mode;
    }
    return ConversationMode.unknown;
  }
}
