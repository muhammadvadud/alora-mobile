import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:alora_mobile/core/error/error_reporter.dart';
import 'package:alora_mobile/core/error/failure.dart';

class MockSentryHub extends Mock implements SentryHubLike {}

class MockScope extends Mock implements Scope {}

class FakeBreadcrumb extends Fake implements Breadcrumb {}

class FakeSentryUser extends Fake implements SentryUser {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeBreadcrumb());
    registerFallbackValue(FakeSentryUser());
  });

  group('SentryErrorReporter', () {
    late MockSentryHub hub;
    late SentryErrorReporter reporter;

    setUp(() {
      hub = MockSentryHub();
      reporter = SentryErrorReporter(hub);
    });

    test('network failure xabari category: failure, level: warning bilan yuboriladi', () {
      reporter.breadcrumb(const Failure.network());

      final captured =
          verify(() => hub.addBreadcrumb(captureAny())).captured.single
              as Breadcrumb;
      expect(captured.category, 'failure');
      expect(captured.message, 'NetworkFailure');
      expect(captured.level, SentryLevel.warning);
      expect(captured.data, anyOf(isNull, isEmpty));
    });

    test(
      'server va serviceUnavailable xatolari level: error bilan yuboriladi',
      () {
        reporter.breadcrumb(const Failure.server());
        final captured1 =
            verify(() => hub.addBreadcrumb(captureAny())).captured.last
                as Breadcrumb;
        expect(captured1.level, SentryLevel.error);

        reporter.breadcrumb(const Failure.serviceUnavailable());
        final captured2 =
            verify(() => hub.addBreadcrumb(captureAny())).captured.last
                as Breadcrumb;
        expect(captured2.level, SentryLevel.error);
      },
    );

    test('breadcrumb data qismida phone, token, detail YO\'Q bo\'ladi', () {
      reporter.breadcrumb(
        const Failure.validation('Batafsil xato', {
          'phone': 'Xato',
          'token': 'Yaroqsiz',
        }),
      );

      final captured =
          verify(() => hub.addBreadcrumb(captureAny())).captured.single
              as Breadcrumb;
      expect(captured.data, anyOf(isNull, isEmpty));
    });

    test('setUser telefon yubormaydi, id va role yuboradi', () {
      final mockScope = MockScope();
      when(() => mockScope.setUser(any())).thenAnswer((_) async {});

      when(() => hub.configureScope(any())).thenAnswer((inv) {
        final callback = inv.positionalArguments[0] as void Function(Scope);
        callback(mockScope);
      });

      reporter.setUser(id: '123', role: 'manager');

      final capturedUser =
          verify(() => mockScope.setUser(captureAny())).captured.single
              as SentryUser?;
      expect(capturedUser, isNotNull);
      expect(capturedUser!.id, '123');
      expect(capturedUser.data?['role'], 'manager');
    });

    test('clearUser scope dan user ni o\'chiradi', () {
      final mockScope = MockScope();
      when(() => mockScope.setUser(any())).thenAnswer((_) async {});

      when(() => hub.configureScope(any())).thenAnswer((inv) {
        final callback = inv.positionalArguments[0] as void Function(Scope);
        callback(mockScope);
      });

      reporter.clearUser();

      verify(() => mockScope.setUser(null)).called(1);
    });
  });

  group('NoopErrorReporter', () {
    test('Hech qanday amal bajarmaydi', () {
      final reporter = NoopErrorReporter();
      expect(
        () => reporter.breadcrumb(const Failure.network()),
        returnsNormally,
      );
      expect(() => reporter.setUser(id: '1', role: 'admin'), returnsNormally);
      expect(() => reporter.clearUser(), returnsNormally);
      expect(() => reporter.captureException(Exception()), returnsNormally);
    });
  });
}
