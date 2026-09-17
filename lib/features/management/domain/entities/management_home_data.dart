import 'conversion_stats.dart';
import 'usage_summary.dart';
import 'user_usage.dart';

/// Boshqaruv bosh sahifasi (S-19) uchun yig'ma ma'lumotlar.
class ManagementHomeData {
  final UsageSummary usage;
  final ConversionStats conversion;
  final List<UserUsage> ranking;

  const ManagementHomeData({
    required this.usage,
    required this.conversion,
    this.ranking = const [],
  });
}
