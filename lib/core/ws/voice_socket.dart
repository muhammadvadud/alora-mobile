import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:web_socket_channel/web_socket_channel.dart';

import '../utils/app_logger.dart';
import '../env.dart';
import '../network/api_paths.dart';
import '../storage/secure_storage.dart';
import '../error/failure.dart';

class VoiceSocket {
  final SecureStorage secureStorage;
  WebSocketChannel? _channel;
  StreamSubscription<dynamic>? _subscription;

  final _audioController = StreamController<Uint8List>.broadcast();
  final _eventController = StreamController<Map<String, dynamic>>.broadcast();
  final _failureController = StreamController<Failure>.broadcast();

  bool _isReconnecting = false;
  String? _lastId;
  String? _lastLocale;

  Stream<Uint8List> get audioStream => _audioController.stream;
  Stream<Map<String, dynamic>> get eventStream => _eventController.stream;
  Stream<Failure> get failureStream => _failureController.stream;

  VoiceSocket(this.secureStorage);

  Future<void> connect(String conversationId, String locale) async {
    _lastId = conversationId;
    _lastLocale = locale;
    await _connectInternal();
  }

  Future<void> _connectInternal({bool isRetry = false}) async {
    final conversationId = _lastId;
    if (conversationId == null) return;
    try {
      final token = await secureStorage.getAccessToken();
      final url =
          '${Env.wsBaseUrl}/${ApiPaths.voiceSocket(conversationId)}'
          '?locale=$_lastLocale&token=$token';

      _channel = WebSocketChannel.connect(Uri.parse(url));

      _subscription = _channel!.stream.listen(
        (message) {
          if (message is Uint8List || message is List<int>) {
            _audioController.add(
              message is Uint8List
                  ? message
                  : Uint8List.fromList(message as List<int>),
            );
          } else if (message is String) {
            try {
              final json = jsonDecode(message) as Map<String, dynamic>;
              _eventController.add(json);

              if (json['kind'] == 'error') {
                _failureController.add(const Failure.server());
              }
            } catch (e) {
              logger.e('Voice WS parse error: $message');
            }
          }
        },
        onError: (e) {
          logger.e('Voice WS error: $e');
          _handleDisconnect(isRetry);
        },
        onDone: () {
          final closeCode = _channel?.closeCode;
          if (closeCode == 1008) {
            _failureController.add(const Failure.auth());
          } else if (closeCode == 1011) {
            _failureController.add(const Failure.server());
          } else if (closeCode != 1000 && closeCode != null) {
            _handleDisconnect(isRetry);
          }
        },
      );
    } catch (e) {
      _handleDisconnect(isRetry);
    }
  }

  void _handleDisconnect(bool isRetry) {
    if (!isRetry && !_isReconnecting && _lastId != null) {
      _isReconnecting = true;
      Future.delayed(const Duration(seconds: 1), () {
        _isReconnecting = false;
        _connectInternal(isRetry: true);
      });
    } else {
      _failureController.add(const Failure.network());
    }
  }

  void sendAudio(Uint8List bytes) {
    _channel?.sink.add(bytes);
  }

  void sendEnd() {
    _channel?.sink.add(jsonEncode({'kind': 'end'}));
  }

  void disconnect() {
    _subscription?.cancel();
    _channel?.sink.close();
    _channel = null;
  }

  void dispose() {
    disconnect();
    _audioController.close();
    _eventController.close();
    _failureController.close();
  }
}
