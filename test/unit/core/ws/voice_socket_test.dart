import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/storage/secure_storage.dart';
import 'package:alora_mobile/core/ws/voice_socket.dart';

class _MockSecureStorage extends Mock implements SecureStorage {}

void main() {
  group('VoiceSocket.buildUri va buildProtocols', () {
    test('locale query sifatida kodlanadi (§8.6), token URI dan olib tashlangan', () {
      final uri = VoiceSocket.buildUri(
        conversationId: 'c1',
        locale: 'ru',
        baseUrl: 'wss://api.alora.uz',
      );
      expect(uri.scheme, 'wss');
      expect(uri.host, 'api.alora.uz');
      expect(uri.path, '/ws/voice/c1/');
      expect(uri.queryParameters['locale'], 'ru');
      expect(uri.queryParameters.containsKey('token'), isFalse);
    });

    test('token subprotocol sifatida beriladi', () {
      final protocols = VoiceSocket.buildProtocols('a.b/c+d=');
      expect(protocols, ['bearer', 'a.b/c+d=']);
    });
  });

  group('VoiceSocket', () {
    late _MockSecureStorage storage;

    setUp(() {
      storage = _MockSecureStorage();
    });

    test('token yo\'q bo\'lsa ulanmaydi va Failure.auth beradi', () async {
      when(() => storage.getAccessToken()).thenAnswer((_) async => null);
      final socket = VoiceSocket(storage);
      final failures = <Failure>[];
      final sub = socket.failureStream.listen(failures.add);

      await socket.connect('c1', 'uz');
      await Future<void>.delayed(Duration.zero);

      expect(failures, [const Failure.auth()]);
      await sub.cancel();
      socket.dispose();
    });

    test('dispose dan keyin reconnect ishga tushmaydi (yopiq stream\'ga yozilmaydi)', () async {
      when(() => storage.getAccessToken()).thenAnswer((_) async => 't');
      final socket = VoiceSocket(storage);
      final sub = socket.failureStream.listen((_) {});

      // Ulanishi mumkin bo'lmagan manzil — onError/onDone → reconnect timer
      await socket.connect('c1', 'uz');
      socket.dispose();
      await sub.cancel();

      // Timer 1 s — dispose'dan keyin hech qanday xato tashlanmasligi kerak
      await Future<void>.delayed(const Duration(milliseconds: 1200));
    });
  });
}
