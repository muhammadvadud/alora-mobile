/// Barcha backend yo'llari konstantalari
///
/// Yo'llar doim '/' bilan tugashi kerak, boshida '/' bo'lmasligi kerak.
class ApiPaths {
  ApiPaths._();

  // Auth
  static const String login = 'auth/login/';
  static const String refresh = 'auth/refresh/';
  static const String logout = 'auth/logout/';
  static const String me = 'auth/me/';

  // Suhbat
  static const String conversations = 'conversations/';
  static String conversation(String id) => 'conversations/$id/';
  static String conversationReset(String id) => 'conversations/$id/reset/';
  static String conversationTranscript(String id) => 'conversations/$id/transcript/';
  static String conversationMessages(String id) => 'conversations/$id/messages/';

  // Ovoz
  static String voiceSocket(String id) => 'ws/voice/$id/';

  // Katalog
  static const String categories = 'catalog/categories/';
  static const String products = 'catalog/products/';
  static String product(String id) => 'catalog/products/$id/';
  static String variant(String id) => 'catalog/variants/$id/';

  // Katalog (manager)
  static const String variantsBulkPrice = 'catalog/variants/bulk-price/';
  static String productImages(String id) => 'catalog/products/$id/images/';
  static String catalogImage(String id) => 'catalog/images/$id/';
  static const String fasons = 'catalog/fasons/';
  static String fason(String id) => 'catalog/fasons/$id/';

  // Buyurtma
  static const String orders = 'orders/';
  static String order(String id) => 'orders/$id/';
  static String orderConfirm(String id) => 'orders/$id/confirm/';
  static String orderStatus(String id) => 'orders/$id/status/';
  static const String orderStatuses = 'orders/statuses/';
  static String orderPdf(String id) => 'orders/$id/pdf/';

  // Hisob
  static const String calcPreview = 'pricing/calc/preview/';

  // Narx qoidalari
  static const String calcRules = 'pricing/calc-rules/';
  static String calcRule(String key) => 'pricing/calc-rules/$key/';
  static const String services = 'pricing/services/';
  static const String discountTiers = 'pricing/discount-tiers/';
  static String discountTier(String id) => 'pricing/discount-tiers/$id/';
  static const String discountPolicy = 'pricing/discount-policy/';
  static const String orderDefaults = 'pricing/order-defaults/';
  static const String modelPricings = 'pricing/model-pricings/';
  static String modelPricing(String id) => 'pricing/model-pricings/$id/';

  // Bilimlar
  static const String knowledgeRules = 'knowledge/rules/';
  static String knowledgeRule(String id) => 'knowledge/rules/$id/';

  // Jamoa
  static const String employees = 'team/employees/';
  static String employee(String id) => 'team/employees/$id/';
  static String employeeLimit(String id) => 'team/employees/$id/limit/';
  static String employeeConversations(String id) => 'team/employees/$id/conversations/';

  // Statistika
  static const String usageSummary = 'usage/summary/';
  static const String usageByUser = 'usage/by-user/';
  static const String usageConversations = 'usage/conversations/';
  static const String analyticsConversion = 'analytics/conversion/';

  // Sozlamalar
  static const String settingsPrompt = 'settings/prompt/';
  static String settingsPromptRollback(String id) => 'settings/prompt/$id/rollback/';
}
