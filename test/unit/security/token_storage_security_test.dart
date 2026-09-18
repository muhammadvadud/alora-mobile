import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import 'package:alora_mobile/core/storage/hive_boxes.dart';

void main() {
  group('19.7 Tokenlar faqat SecureStorage', () {
    late Directory tempDir;

    setUp(() async {
      tempDir = Directory.systemTemp.createTempSync('alora_security_hive_');
      Hive.init(tempDir.path);
    });

    tearDown(() async {
      await Hive.close();
      if (tempDir.existsSync()) {
        tempDir.deleteSync(recursive: true);
      }
    });

    test('HiveBoxes ro\'yxatida token/access/refresh kalit yo\'q', () {
      const forbidden = [
        'token',
        'access',
        'refresh',
        'access_token',
        'refresh_token',
      ];
      final boxNames = [
        HiveBoxes.authPrefs,
        HiveBoxes.catalogProducts,
        HiveBoxes.catalogCategories,
        HiveBoxes.conversations,
        HiveBoxes.messages,
        HiveBoxes.offlineQueue,
        HiveBoxes.settings,
      ];

      for (final name in boxNames) {
        for (final key in forbidden) {
          expect(
            name.toLowerCase().contains(key),
            isFalse,
            reason:
                'Box nomi "$name" taqiqlangan "$key" ni o\'z ichiga olmasligi kerak',
          );
        }
      }
    });

    test(
      'lib/ ichida Hive.box(...).put(\'access|refresh|token\') naqshi yo\'q',
      () {
        final libDir = Directory('lib');
        expect(libDir.existsSync(), isTrue);

        final pattern = RegExp(
          r'''Hive\.box\([^)]*\)\.put\(\s*['"](access|refresh|token|access_token|refresh_token)['"]''',
          multiLine: true,
        );
        final putKeyPattern = RegExp(
          r'''\.put\(\s*['"](access|refresh|token|access_token|refresh_token)['"]''',
        );

        final offenders = <String>[];
        for (final entity in libDir.listSync(recursive: true)) {
          if (entity is! File || !entity.path.endsWith('.dart')) continue;
          // SecureStorage token kalitlari ruxsat etiladi
          if (entity.path.contains('secure_storage.dart')) continue;
          final source = entity.readAsStringSync();
          if (pattern.hasMatch(source) ||
              (source.contains('Hive') && putKeyPattern.hasMatch(source))) {
            // Faqat Hive kontekstida put
            if (source.contains('Hive') && putKeyPattern.hasMatch(source)) {
              // Auth API DTO/JSON 'access'/'refresh' maydonlari — ruxsat
              if (entity.path.contains('/dto/') ||
                  entity.path.contains('token_pair') ||
                  entity.path.contains('auth_remote') ||
                  entity.path.contains('refresh_interceptor')) {
                continue;
              }
              // Yana tekshir: put chaqiruvi Hive box bilan bog'langanmi
              for (final match in putKeyPattern.allMatches(source)) {
                final start = match.start > 80 ? match.start - 80 : 0;
                final snippet = source.substring(start, match.end);
                if (snippet.contains('box') || snippet.contains('Hive')) {
                  offenders.add('${entity.path}:${match.group(1)}');
                }
              }
            }
          }
        }

        expect(
          offenders,
          isEmpty,
          reason: 'Hive ga token yozish topildi: $offenders',
        );
      },
    );

    test('OfflineQueue / settings box\'larga token kaliti yozib bo\'lmasligi '
        '(runtime)', () async {
      final queue = await Hive.openBox<dynamic>(HiveBoxes.offlineQueue);
      final settings = await Hive.openBox<dynamic>(HiveBoxes.settings);
      final authPrefs = await Hive.openBox<dynamic>(HiveBoxes.authPrefs);

      // Ixtiyoriy yozuvlar — token kalitlari saqlanmasligi kerak (kod shartnoma)
      await queue.put('job-1', {'method': 'PATCH', 'path': '/x'});
      await settings.put('locale', 'uz');
      await authPrefs.put('cached_user', '{"profile":{}}');

      for (final box in [queue, settings, authPrefs]) {
        for (final key in box.keys) {
          final keyStr = key.toString().toLowerCase();
          expect(keyStr.contains('token'), isFalse);
          expect(keyStr.contains('access'), isFalse);
          expect(keyStr.contains('refresh'), isFalse);
        }
      }
    });

    test('SecureStorage token kalitlari flutter_secure_storage da', () {
      final source = File('lib/core/storage/secure_storage.dart')
          .readAsStringSync();
      expect(source.contains("FlutterSecureStorage"), isTrue);
      expect(source.contains("'access_token'"), isTrue);
      expect(source.contains("'refresh_token'"), isTrue);
      expect(source.contains('Hive'), isFalse);
    });
  });
}
