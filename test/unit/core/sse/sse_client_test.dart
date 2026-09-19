import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/sse/sse_client.dart';
import 'package:alora_mobile/core/sse/sse_event.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late SseClient sseClient;

  setUp(() {
    mockDio = MockDio();
    sseClient = SseClient(mockDio);

    registerFallbackValue(Options());
  });

  test(
    'SSE stream to\'g\'ri ishlaydi (har xil kind, buzilgan frame, chunklarga bo\'linish)',
    () async {
      final stream = Stream.fromIterable([
        utf8.encode('data: {"kind":"start"}\n\n'),
        utf8.encode('data: {"kind":"thinking"}\n\n'),
        utf8.encode('data: {"kind":"content", "content":"A"}\n\n'),
        utf8.encode('data: {"kind":"content"'), // chunk 1 (broken across chunks)
        utf8.encode(', "content":"B"}\n\n'), // chunk 2
        utf8.encode('data: {"kind":"unknown"}\n\n'), // noma'lum event
        utf8.encode('data: broken json\n\n'), // buzilgan json, o'tkazib yuboriladi
        utf8.encode('data: {"kind":"done"}\n\n'),
      ]);

      when(
        () => mockDio.post<ResponseBody>(
          any(),
          data: any(named: 'data'),
          cancelToken: any(named: 'cancelToken'),
          options: any(named: 'options'),
        ),
      ).thenAnswer(
        (_) async => Response<ResponseBody>(
          requestOptions: RequestOptions(path: ''),
          data: ResponseBody(stream, 200),
        ),
      );

      final events = await sseClient.connect('/chat').toList();

      expect(events.length, 6);
      events[0].maybeWhen(start: () => null, orElse: () => fail('start kutilgan'));
      events[1].maybeWhen(thinking: () => null, orElse: () => fail('thinking kutilgan'));
      events[2].maybeWhen(content: (c) => expect(c, 'A'), orElse: () => fail('content kutilgan'));
      events[3].maybeWhen(content: (c) => expect(c, 'B'), orElse: () => fail('content kutilgan'));
      events[4].maybeWhen(unknown: () => null, orElse: () => fail('unknown kutilgan'));
      events[5].maybeWhen(done: (u, p) => null, orElse: () => fail('done kutilgan'));
    },
  );

  test('SSE uzilishda qayta urinadi', () async {
    int callCount = 0;

    when(
      () => mockDio.post<ResponseBody>(
        any(),
        data: any(named: 'data'),
        cancelToken: any(named: 'cancelToken'),
        options: any(named: 'options'),
      ),
    ).thenAnswer((_) async {
      callCount++;
      if (callCount == 1) {
        throw DioException(requestOptions: RequestOptions(path: ''));
      }
      return Response<ResponseBody>(
        requestOptions: RequestOptions(path: ''),
        data: ResponseBody(Stream.fromIterable([utf8.encode('data: {"kind":"done"}\n\n')]), 200),
      );
    });

    final events = await sseClient.connect('/chat').toList();

    expect(callCount, 2);
    expect(events.length, 1);
    events[0].maybeWhen(done: (u, p) => null, orElse: () => fail('done kutilgan'));
  });

  test('SSE uziladi agar cancelToken chaqirilsa', () async {
    final cancelToken = CancelToken();

    when(
      () => mockDio.post<ResponseBody>(
        any(),
        data: any(named: 'data'),
        cancelToken: any(named: 'cancelToken'),
        options: any(named: 'options'),
      ),
    ).thenAnswer((_) async {
      return Response<ResponseBody>(
        requestOptions: RequestOptions(path: ''),
        data: ResponseBody(Stream.fromIterable([utf8.encode('data: {"kind":"start"}\n\n')]), 200),
      );
    });

    final events = <SseEvent>[];

    // Yuborish va darhol to'xtatish
    final sub = sseClient.connect('/chat', cancelToken: cancelToken).listen((event) {
      events.add(event);
      cancelToken.cancel();
    });

    await Future.delayed(const Duration(milliseconds: 100));
    await sub.cancel();

    expect(events.length, 1);
  });

  test('SSE 3 martadan keyin error qaytaradi', () async {
    when(
      () => mockDio.post<ResponseBody>(
        any(),
        data: any(named: 'data'),
        cancelToken: any(named: 'cancelToken'),
        options: any(named: 'options'),
      ),
    ).thenAnswer((_) async {
      throw DioException(requestOptions: RequestOptions(path: ''));
    });

    // Tarmoq xatosi 3 marta qayta uriniladi, so'ng tiplangan Failure throw
    // qilinadi (xom DioException matni UI'ga chiqmaydi, §8.3).
    await expectLater(sseClient.connect('/chat').toList(), throwsA(const Failure.network()));
    verify(
      () => mockDio.post<ResponseBody>(
        any(),
        data: any(named: 'data'),
        cancelToken: any(named: 'cancelToken'),
        options: any(named: 'options'),
      ),
    ).called(4);
  });

  test('429 limit xatosi qayta urinilmaydi — darhol Failure.limit', () async {
    when(
      () => mockDio.post<ResponseBody>(
        any(),
        data: any(named: 'data'),
        cancelToken: any(named: 'cancelToken'),
        options: any(named: 'options'),
      ),
    ).thenAnswer((_) async {
      throw DioException(
        requestOptions: RequestOptions(path: ''),
        error: const Failure.limit('Limit tugadi'),
      );
    });

    await expectLater(
      sseClient.connect('/chat').toList(),
      throwsA(const Failure.limit('Limit tugadi')),
    );
    verify(
      () => mockDio.post<ResponseBody>(
        any(),
        data: any(named: 'data'),
        cancelToken: any(named: 'cancelToken'),
        options: any(named: 'options'),
      ),
    ).called(1);
  });

  test('done event usage va products bilan qaytadi', () async {
    final stream = Stream.fromIterable([
      utf8.encode('data: {"kind":"done", "usage":{"tokens":123}, "products":[{"id":"p1"}]}\n\n'),
    ]);

    when(
      () => mockDio.post<ResponseBody>(
        any(),
        data: any(named: 'data'),
        cancelToken: any(named: 'cancelToken'),
        options: any(named: 'options'),
      ),
    ).thenAnswer(
      (_) async => Response<ResponseBody>(
        requestOptions: RequestOptions(path: ''),
        data: ResponseBody(stream, 200),
      ),
    );

    final events = await sseClient.connect('/chat').toList();

    expect(events.length, 1);
    events[0].maybeWhen(
      done: (usage, products) {
        expect(usage, isNotNull);
        expect(usage!['tokens'], 123);
        expect(products, isNotNull);
        expect(products!.length, 1);
      },
      orElse: () => fail('done kutilgan'),
    );
  });

  test('done event usage/products null bo\'lishi mumkin', () async {
    final stream = Stream.fromIterable([utf8.encode('data: {"kind":"done"}\n\n')]);

    when(
      () => mockDio.post<ResponseBody>(
        any(),
        data: any(named: 'data'),
        cancelToken: any(named: 'cancelToken'),
        options: any(named: 'options'),
      ),
    ).thenAnswer(
      (_) async => Response<ResponseBody>(
        requestOptions: RequestOptions(path: ''),
        data: ResponseBody(stream, 200),
      ),
    );

    final events = await sseClient.connect('/chat').toList();

    expect(events.length, 1);
    events[0].maybeWhen(
      done: (usage, products) {
        expect(usage, isNull);
        expect(products, isNull);
      },
      orElse: () => fail('done kutilgan'),
    );
  });

  test('tool_call, tool_args, tool_result eventlari parse qilinadi', () async {
    final stream = Stream.fromIterable([
      utf8.encode('data: {"kind":"tool_call", "tool":"product_search"}\n\n'),
      utf8.encode('data: {"kind":"tool_args", "tool":"product_search", "args":"qizil mato"}\n\n'),
      utf8.encode('data: {"kind":"tool_result", "tool":"product_search", "result":"[]"}\n\n'),
      utf8.encode('data: {"kind":"done"}\n\n'),
    ]);

    when(
      () => mockDio.post<ResponseBody>(
        any(),
        data: any(named: 'data'),
        cancelToken: any(named: 'cancelToken'),
        options: any(named: 'options'),
      ),
    ).thenAnswer(
      (_) async => Response<ResponseBody>(
        requestOptions: RequestOptions(path: ''),
        data: ResponseBody(stream, 200),
      ),
    );

    final events = await sseClient.connect('/chat').toList();

    expect(events.length, 4);
    events[0].maybeWhen(
      toolCall: (tool) => expect(tool, 'product_search'),
      orElse: () => fail('tool_call kutilgan'),
    );
    events[1].maybeWhen(
      toolArgs: (tool, args) {
        expect(tool, 'product_search');
        expect(args, isNotEmpty);
      },
      orElse: () => fail('tool_args kutilgan'),
    );
    events[2].maybeWhen(
      toolResult: (tool, result) {
        expect(tool, 'product_search');
        expect(result, '[]');
      },
      orElse: () => fail('tool_result kutilgan'),
    );
  });
}
