import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/core/utils/date_format.dart';

void main() {
  test('formatDate to\'g\'ri formatlaydi', () {
    final date = DateTime(DateTime.now().year, 9, 12);
    final pastDate = DateTime(2023, 9, 12);

    expect(formatDate(date, overrideLocale: 'uz'), '12-sentabr');
    expect(formatDate(date, overrideLocale: 'uz_Cyrl'), '12-сентябрь');
    expect(formatDate(date, overrideLocale: 'ru'), '12 сентября');

    expect(formatDate(pastDate, overrideLocale: 'uz'), '12-sentabr 2023');
    expect(formatDate(pastDate, overrideLocale: 'uz_Cyrl'), '12-сентябрь 2023');
    expect(formatDate(pastDate, overrideLocale: 'ru'), '12 сентября 2023');

    // short names
    expect(formatDate(date, overrideLocale: 'uz', short: true), '12-sent');
    expect(formatDate(date, overrideLocale: 'uz_Cyrl', short: true), '12-сент');
    expect(formatDate(date, overrideLocale: 'ru', short: true), '12 сент');

    final date10 = DateTime(DateTime.now().year, 10, 12);
    expect(formatDate(date10, overrideLocale: 'uz', short: true), '12-okt');
    expect(
      formatDate(date10, overrideLocale: 'uz_Cyrl', short: true),
      '12-окт',
    );

    final date11 = DateTime(DateTime.now().year, 11, 12);
    expect(formatDate(date11, overrideLocale: 'uz', short: true), '12-noy');
    expect(
      formatDate(date11, overrideLocale: 'uz_Cyrl', short: true),
      '12-ноя',
    );

    final date12 = DateTime(DateTime.now().year, 12, 12);
    expect(formatDate(date12, overrideLocale: 'uz', short: true), '12-dek');
    expect(
      formatDate(date12, overrideLocale: 'uz_Cyrl', short: true),
      '12-дек',
    );

    final date1 = DateTime(DateTime.now().year, 1, 12);
    expect(formatDate(date1, overrideLocale: 'uz', short: true), '12-yan');
  });

  test('formatRelativeDate nisbiy sanalarni formatlaydi', () {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day, 10, 30);
    final yesterday = today.subtract(const Duration(days: 1));
    final lastWeek = today.subtract(const Duration(days: 3));
    final longAgo = today.subtract(const Duration(days: 10));

    expect(formatRelativeDate(today, overrideLocale: 'uz'), 'Bugun');
    expect(formatRelativeDate(today, overrideLocale: 'uz_Cyrl'), 'Бугун');
    expect(formatRelativeDate(today, overrideLocale: 'ru'), 'Сегодня');

    expect(formatRelativeDate(yesterday, overrideLocale: 'uz'), 'Kecha');
    expect(formatRelativeDate(yesterday, overrideLocale: 'uz_Cyrl'), 'Кеча');
    expect(formatRelativeDate(yesterday, overrideLocale: 'ru'), 'Вчера');

    expect(formatRelativeDate(lastWeek, overrideLocale: 'uz'), 'Bu hafta');

    expect(
      formatRelativeDate(longAgo, overrideLocale: 'uz'),
      formatDate(longAgo, overrideLocale: 'uz'),
    );
  });
}
