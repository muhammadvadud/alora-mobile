import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alora_mobile/features/management/application/management_period_notifier.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_period.dart';

void main() {
  test('boshlang\'ich davr day bo\'ladi', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    expect(container.read(managementPeriodProvider), UsagePeriod.day);
  });

  test('setPeriod davrni o\'zgartiradi', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final notifier = container.read(managementPeriodProvider.notifier);

    notifier.setPeriod(UsagePeriod.week);
    expect(container.read(managementPeriodProvider), UsagePeriod.week);

    notifier.setPeriod(UsagePeriod.month);
    expect(container.read(managementPeriodProvider), UsagePeriod.month);
  });

  test('UsagePeriod query parametrlari to\'g\'ri', () {
    expect(UsagePeriod.day.query, 'day');
    expect(UsagePeriod.week.query, 'week');
    expect(UsagePeriod.month.query, 'month');

    expect(UsagePeriod.fromName('day'), UsagePeriod.day);
    expect(UsagePeriod.fromName('week'), UsagePeriod.week);
    expect(UsagePeriod.fromName('month'), UsagePeriod.month);
    expect(UsagePeriod.fromName('noma\'lum'), UsagePeriod.unknown);
  });
}
