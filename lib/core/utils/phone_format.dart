/// Telefon raqamini formatlaydi, masalan: 998901234567 -> +998 90 123 45 67
String formatPhone(String phone) {
  final clean = phone.replaceAll(RegExp(r'\D'), '');
  if (clean.length == 12 && clean.startsWith('998')) {
    return '+998 ${clean.substring(3, 5)} ${clean.substring(5, 8)} ${clean.substring(8, 10)} ${clean.substring(10, 12)}';
  }
  // Agar boshqa formatda bo'lsa, shunchaki o'zini qaytaramiz (yoki kerakli formatni qollaymiz)
  if (clean.length > 9) {
    return '+$clean';
  }
  return phone;
}
