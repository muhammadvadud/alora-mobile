/// Ilova uchun marshrutlar konstantalari.
///
/// Har bir sahifa yo'li shu yerda; string litterallari ekranda yozilmaydi.
class AppRoutes {
  AppRoutes._();

  static const String login = '/login';
  static const String chat = '/chat';
  static const String chatNew = '$chat/new';
  static const String orders = '/orders';
  static const String catalog = '/catalog';
  static const String management = '/management';
  static const String profile = '/profile';
  static const String forbidden = '/forbidden';
  static const String devGallery = '/dev/gallery';

  static const String managementProducts = '/management/products';
  static const String managementPricing = '/management/pricing';
  static const String managementKnowledge = '/management/knowledge';
  static const String managementEmployees = '/management/employees';
  static const String managementSettingsPrompt = '/management/settings/prompt';
  static const String managementSettingsModels = '/management/settings/models';

  static String managementProductEdit(String id) => '$managementProducts/$id/edit';
  static const String managementProductNew = '$managementProducts/new';

  static String managementEmployee(String id) => '$managementEmployees/$id';
  static String managementEmployeeConversations(String id) =>
      '$managementEmployees/$id/conversations';
  static String managementConversationTranscript(String employeeId, String conversationId) =>
      '$managementEmployees/$employeeId/conversations/$conversationId';

  static String chatConversation(String id) => '$chat/$id';
  static const String orderNew = '$orders/new';
  static String order(String id) => '$orders/$id';
  static String catalogProduct(String id) => '$catalog/products/$id';
}
