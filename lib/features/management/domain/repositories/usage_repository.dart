import '../../domain/entities/conversion_stats.dart';
import '../../domain/entities/usage_conversation.dart';
import '../../domain/entities/usage_period.dart';
import '../../domain/entities/usage_summary.dart';
import '../../domain/entities/user_usage.dart';

/// Usage statistikasi uchun repository interfeysi.
abstract class UsageRepository {
  /// Tanlangan davr uchun xulosa. `userId` berilsa faqat o'sha foydalanuvchi.
  Future<UsageSummary> summary({required UsagePeriod period, String? userId});

  /// Xodimlar bo'yicha reyting.
  Future<List<UserUsage>> byUser({required UsagePeriod period});

  /// Suhbat → buyurtma konversiyasi.
  Future<ConversionStats> conversion();

  /// Eng qimmat suhbatlar.
  Future<List<UsageConversation>> conversations();
}
