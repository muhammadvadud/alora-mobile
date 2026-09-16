import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../env.dart';

part 'connectivity_notifier.g.dart';

@Riverpod(keepAlive: true)
class ConnectivityNotifier extends _$ConnectivityNotifier {
  late StreamSubscription<List<ConnectivityResult>> _subscription;

  @override
  bool build() {
    _subscription = Connectivity().onConnectivityChanged.listen((results) {
      if (results.contains(ConnectivityResult.none)) {
        state = false;
      } else {
        _checkPing();
      }
    });

    // Boshlang'ich holatni tekshirish
    Future.microtask(() async {
      final results = await Connectivity().checkConnectivity();
      if (results.contains(ConnectivityResult.none)) {
        state = false;
      } else {
        await _checkPing();
      }
    });

    ref.onDispose(() {
      _subscription.cancel();
    });

    return true; // Default holatda internet bor deb hisoblaymiz, tez orada yangilanadi
  }

  Future<void> _checkPing() async {
    try {
      final dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 3),
          receiveTimeout: const Duration(seconds: 3),
        ),
      );

      final healthUrl = Env.apiBaseUrl.replaceFirst(
        RegExp(r'/api/v1/?$'),
        '/health/',
      );

      final response = await dio.get(healthUrl);
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        state = true;
      } else {
        state = false;
      }
    } catch (_) {
      state = false;
    }
  }
}
