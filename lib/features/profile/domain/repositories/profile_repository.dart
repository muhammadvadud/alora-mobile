import '../../domain/entities/profile_limit.dart';

/// Profil ma'lumotlari uchun repository interfeysi.
abstract class ProfileRepository {
  /// `auth/me/` limit blo'gi; `null` agar limit o'rnatilmagan bo'lsa.
  Future<ProfileLimit?> getLimit();

  /// Joriy foydalanuvchining bugungi sarfi (so'mda). Faqat manager/admin
  /// uchun mavjud; boshqa rollarda [getTodayCost] chaqirilmasligi kerak.
  Future<int> getTodayCost(String userId);
}
