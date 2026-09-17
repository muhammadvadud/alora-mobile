import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/entities/usage_period.dart';

part 'management_period_notifier.g.dart';

/// Boshqaruv sahifasidagi davr o'tkazgich holati (Bugun/Hafta/Oy).
@Riverpod(keepAlive: true)
class ManagementPeriodNotifier extends _$ManagementPeriodNotifier {
  @override
  UsagePeriod build() => UsagePeriod.day;

  void setPeriod(UsagePeriod period) {
    state = period;
  }
}
