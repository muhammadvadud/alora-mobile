import '../domain/entities/profile_limit.dart';

/// Profil sarf ma'lumotlari: kunlik limit blo'gi + bugungi sarf.
class ProfileSpendData {
  /// `auth/me/` limit blo'gi; `null` — limit o'rnatilmagan.
  final ProfileLimit? limit;

  /// Bugungi sarf (so'm). Faqat manager/admin uchun; xodim uchun `null`.
  final int? todayCost;

  const ProfileSpendData({this.limit, this.todayCost});
}