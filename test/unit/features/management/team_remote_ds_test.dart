import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/network/api_paths.dart';
import 'package:alora_mobile/features/management/data/datasources/team_remote_ds.dart';
import 'package:alora_mobile/shared/models/role.dart';

/// 400 -> Failure.validation, 403 -> Failure.permission, 5xx -> Failure.server
/// ga aylantiruvchi real ErrorMapper interceptor'ini taqlid qiladi.
class _ValidationErrorInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final status = err.response?.statusCode;
    if (status == 400) {
      final data = err.response?.data;
      final fieldErrors = <String, String>{};
      if (data is Map<String, dynamic> && data['field_errors'] is Map) {
        (data['field_errors'] as Map).forEach((key, value) {
          fieldErrors[key.toString()] = value.toString();
        });
      }
      final detail = data is Map<String, dynamic> ? data['detail']?.toString() ?? '' : '';
      handler.next(
        DioException(
          requestOptions: err.requestOptions,
          response: err.response,
          error: Failure.validation(detail, fieldErrors),
          type: err.type,
        ),
      );
      return;
    }
    handler.next(err);
  }
}

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late TeamRemoteDataSource dataSource;
  Map<String, dynamic>? lastBody;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://api.example.com'));
    // Body'ni tutib olish uchun request interceptor.
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (options.data is Map<String, dynamic>) {
            lastBody = options.data as Map<String, dynamic>;
          }
          handler.next(options);
        },
      ),
    );
    adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    dataSource = TeamRemoteDataSource(dio);
  });

  test('employees ro\'yxatini qaytaradi', () async {
    adapter.onGet(
      ApiPaths.employees,
      (server) => server.reply(200, [
        {
          'id': 'employee-1',
          'phone': '+998901112233',
          'full_name': 'Akmal Karimov',
          'role': 'employee',
          'is_active': true,
          'today_tokens': 10,
          'today_messages': 5,
          'today_conversations': 2,
        },
      ]),
    );

    final dtos = await dataSource.employees();

    expect(dtos.single.id, 'employee-1');
    expect(dtos.single.role, 'employee');
    expect(dtos.single.todayMessages, 5);
  });

  test('employee tafsilotini qaytaradi', () async {
    adapter.onGet(
      ApiPaths.employee('employee-1'),
      (server) => server.reply(200, {
        'id': 'employee-1',
        'phone': '+998901112233',
        'full_name': 'Akmal Karimov',
        'role': 'manager',
        'is_active': false,
      }),
    );

    final dto = await dataSource.employee('employee-1');

    expect(dto.role, 'manager');
    expect(dto.isActive, isFalse);
  });

  test('createEmployee POST body bilan yuboradi', () async {
    adapter.onPost(
      ApiPaths.employees,
      (server) => server.reply(200, {
        'id': 'employee-new',
        'phone': '+998901112233',
        'full_name': 'Akmal Karimov',
        'role': 'employee',
        'is_active': true,
      }),
    );

    await dataSource.createEmployee(
      body: {
        'phone': '+998901112233',
        'full_name': 'Akmal Karimov',
        'password': 'secret123',
        'role': Role.employee.name,
        'is_active': true,
      },
    );

    expect(lastBody, {
      'phone': '+998901112233',
      'full_name': 'Akmal Karimov',
      'password': 'secret123',
      'role': 'employee',
      'is_active': true,
    });
  });

  test('setEmployeeLimit {} qavs ichidagi body bilan POST yuboradi', () async {
    adapter.onPost(
      ApiPaths.employeeLimit('employee-1'),
      (server) => server.reply(200, {
        'id': 'limit-1',
        'user_id': 'employee-1',
        'period': 'daily',
        'is_unlimited': false,
        'on_exceed': 'warn',
        'is_active': true,
      }),
    );

    final dto = await dataSource.setEmployeeLimit(id: 'employee-1', body: {'is_unlimited': true});

    expect(lastBody, {'is_unlimited': true});
    expect(dto.isUnlimited, isFalse);
  });

  test('updateEmployee PATCH body bilan yuboradi', () async {
    adapter.onPatch(
      ApiPaths.employee('employee-1'),
      (server) => server.reply(200, {
        'id': 'employee-1',
        'phone': '+998901112233',
        'full_name': 'Yangi Ism',
        'role': 'manager',
        'is_active': true,
      }),
    );

    await dataSource.updateEmployee(
      id: 'employee-1',
      body: {'full_name': 'Yangi Ism', 'role': 'manager'},
    );

    expect(lastBody, {'full_name': 'Yangi Ism', 'role': 'manager'});
  });

  test('employeeConversations ro\'yxatini qaytaradi', () async {
    adapter.onGet(
      ApiPaths.employeeConversations('employee-1'),
      (server) => server.reply(200, [
        {
          'id': 'conv-1',
          'title': 'Suhbat 1',
          'status': 'active',
          'stage': 'need',
          'mode': 'text',
          'last_message_at': '2026-09-16T10:00:00Z',
        },
      ]),
    );

    final dtos = await dataSource.employeeConversations('employee-1');

    expect(dtos.single.id, 'conv-1');
    expect(dtos.single.title, 'Suhbat 1');
  });

  test('transcript: conversations/{id}/transcript yo\'lidan keladi', () async {
    adapter.onGet(
      ApiPaths.conversationTranscript('conv-1'),
      (server) => server.reply(200, [
        {'role': 'assistant', 'content': 'Salom!'},
      ]),
    );

    final dtos = await dataSource.transcript('conv-1');

    expect(dtos.single.role, 'assistant');
    expect(dtos.single.content, 'Salom!');
  });

  test('400 validation_error Failure.validation ga aylantiriladi', () async {
    dio.interceptors.add(_ValidationErrorInterceptor());
    adapter.onPost(
      ApiPaths.employees,
      (server) => server.reply(400, {
        'detail': 'Telefon raqami noto\'g\'ri',
        'field_errors': {'phone': 'Telefon raqamini to\'liq kiriting'},
      }),
    );

    try {
      await dataSource.createEmployee(body: {});
      fail('xato qaytarishi kerak edi');
    } on Failure catch (failure) {
      expect(
        failure.maybeWhen(
          validation: (detail, fieldErrors) =>
              detail == 'Telefon raqami noto\'g\'ri' &&
              fieldErrors['phone'] == 'Telefon raqamini to\'liq kiriting',
          orElse: () => false,
        ),
        isTrue,
      );
    }
  });
}
