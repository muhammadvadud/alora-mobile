import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
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

  test('SSE stream to\'g\'ri ishlaydi (har xil kind, buzilgan frame, chunklarga bo\'linish)', () async {
    final stream = Stream.fromIterable([
      utf8.encode('data: {"kind":"start"}\n\n'),
      utf8.encode('data: {"kind":"thinking"}\n\n'),
      utf8.encode('data: {"kind":"content", "content":"A"}\n\n'),
      utf8.encode('data: {"kind":"content"'), // chunk 1 (broken across chunks)
      utf8.encode(', "content":"B"}\n\n'), // chunk 2
      utf8.encode('data: {"kind":"unknown"}\n\n'), // noma'lum event
      utf8.encode(
        'data: broken json\n\n',
      ), // buzilgan json, o'tkazib yuboriladi
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
    events[0].maybeWhen(
      start: () => null,
      orElse: () => fail('start kutilgan'),
    );
    events[1].maybeWhen(
      thinking: () => null,
      orElse: () => fail('thinking kutilgan'),
    );
    events[2].maybeWhen(
      content: (c) => expect(c, 'A'),
      orElse: () => fail('content kutilgan'),
    );
    events[3].maybeWhen(
      content: (c) => expect(c, 'B'),
      orElse: () => fail('content kutilgan'),
    );
    events[4].maybeWhen(
      unknown: () => null,
      orElse: () => fail('unknown kutilgan'),
    );
    events[5].maybeWhen(
      done: (u, p) => null,
      orElse: () => fail('done kutilgan'),
    );
  });

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
        data: ResponseBody(
          Stream.fromIterable([utf8.encode('data: {"kind":"done"}\n\n')]),
          200,
        ),
      );
    });

    final events = await sseClient.connect('/chat').toList();

    expect(callCount, 2);
    expect(events.length, 1);
    events[0].maybeWhen(
      done: (u, p) => null,
      orElse: () => fail('done kutilgan'),
    );
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
        data: ResponseBody(
          Stream.fromIterable([utf8.encode('data: {"kind":"start"}\n\n')]),
          200,
        ),
      );
    });

    final events = <SseEvent>[];

    // Yuborish va darhol to'xtatish
    final sub = sseClient.connect('/chat', cancelToken: cancelToken).listen((
      event,
    ) {
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

    final events = await sseClient.connect('/chat').toList();
    expect(events.length, 1);
    events[0].maybeWhen(
      error: (e) => expect(e, isNotNull),
      orElse: () => fail('error kutilgan'),
    );
  });
}
