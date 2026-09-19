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

/// Kiritilgan raqamni backend kutadigan E.164 ko'rinishga keltiradi:
/// `+998 90 123 45 67`, `998901234567`, `90 123 45 67` → `+998901234567`.
/// Bo'shliq/tire/qavs olib tashlanadi; 9 xonali bo'lsa `998` qo'shiladi.
String normalizePhone(String input) {
  final digits = input.replaceAll(RegExp(r'\D'), '');
  if (digits.isEmpty) return '';
  if (digits.length == 9) return '+998$digits';
  return '+$digits';
}
