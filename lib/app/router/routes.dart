/// Ilova uchun marshrutlar konstantalari.
///
/// Har bir sahifa yo'li shu yerda; string litterallari ekranda yozilmaydi.
class AppRoutes {
  AppRoutes._();

  static const String login = '/login';
  static const String chat = '/chat';
  static const String orders = '/orders';
  static const String catalog = '/catalog';
  static const String management = '/management';
  static const String profile = '/profile';
  static const String forbidden = '/forbidden';
  static const String devGallery = '/dev/gallery';

  static String chatConversation(String id) => '$chat/$id';
  static String order(String id) => '$orders/$id';
  static String catalogProduct(String id) => '$catalog/products/$id';
}
