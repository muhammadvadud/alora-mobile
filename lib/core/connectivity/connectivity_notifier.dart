import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../env.dart';
import '../storage/offline_queue.dart';
import '../network/dio_client.dart';
import 'offline_flush_notifier.dart';

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
    final wasOffline = !state;
    try {
      final dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 3),
          receiveTimeout: const Duration(seconds: 3),
        ),
      );

      final healthUrl = Env.apiBaseUrl.replaceFirst(RegExp(r'/api/v1/?$'), '/health/');

      final response = await dio.head(healthUrl);
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 400) {
        state = true;
        if (wasOffline) {
          _flushQueue();
        }
      } else {
        state = false;
      }
    } catch (_) {
      try {
        final dio = Dio(
          BaseOptions(
            connectTimeout: const Duration(seconds: 3),
            receiveTimeout: const Duration(seconds: 3),
          ),
        );
        final response = await dio.get('${Env.apiBaseUrl}auth/me/');
        if (response.statusCode != null && response.statusCode! >= 200) {
          state = true;
          if (wasOffline) _flushQueue();
          return;
        }
      } catch (_) {}
      state = false;
    }
  }

  void _flushQueue() async {
    final dio = ref.read(dioProvider);
    final results = await OfflineQueue.flush(dio);
    final failedMessages = results
        .where((res) => !res.success && res.errorMessage != null)
        .map((res) => res.errorMessage!)
        .toList();
    if (failedMessages.isNotEmpty) {
      final messages = ref.read(offlineFlushMessagesProvider.notifier);
      for (final message in failedMessages) {
        messages.add(message);
      }
    }
  }
}
