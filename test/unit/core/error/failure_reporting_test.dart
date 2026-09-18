import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import 'package:alora_mobile/core/error/error_reporter.dart';
import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/error/failure_reporting.dart';

class MockErrorReporter extends Mock implements ErrorReporter {}

void main() {
  setUpAll(() {
    registerFallbackValue(const Failure.network());
  });

  ProviderContainer containerWith(MockErrorReporter reporter) =>
      ProviderContainer(
        overrides: [errorReporterProvider.overrideWithValue(reporter)],
      );

  void run(ProviderContainer container, Failure failure) {
    final testProvider = Provider((ref) => reportFailure(ref, failure));
    container.read(testProvider);
  }

  test('NetworkFailure → faqat breadcrumb, exception yuborilmaydi', () {
    final reporter = MockErrorReporter();
    when(() => reporter.breadcrumb(any())).thenReturn(null);
    const failure = Failure.network();

    run(containerWith(reporter), failure);

    verify(() => reporter.breadcrumb(failure)).called(1);
    verifyNever(() => reporter.captureException(any()));
  });

  test('ServerFailure → breadcrumb + captureException', () {
    final reporter = MockErrorReporter();
    when(() => reporter.breadcrumb(any())).thenReturn(null);
    when(() => reporter.captureException(any())).thenReturn(null);
    const failure = Failure.server();

    run(containerWith(reporter), failure);

    verify(() => reporter.breadcrumb(failure)).called(1);
    verify(() => reporter.captureException(failure)).called(1);
  });

  test('UnknownFailure → breadcrumb + captureException', () {
    final reporter = MockErrorReporter();
    when(() => reporter.breadcrumb(any())).thenReturn(null);
    when(() => reporter.captureException(any())).thenReturn(null);
    const failure = Failure.unknown('x');

    run(containerWith(reporter), failure);

    verify(() => reporter.captureException(failure)).called(1);
  });
}
