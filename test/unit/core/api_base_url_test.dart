import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/core/env.dart';
import 'package:alora_mobile/core/network/api_paths.dart';

void main() {
  test("Env.apiBaseUrl doim '/' bilan tugaydi — '/api/v1auth/login/' xatosi bo'lmasin", () {
    // Testda define bo'lmasa bo'sh qoladi (Dio relative URL bilan ishlaydi)
    if (Env.apiBaseUrl.isNotEmpty) expect(Env.apiBaseUrl, endsWith('/'));
    expect(Env.apiBaseUrl + ApiPaths.login, isNot(contains('v1auth')));
  });

  test("ApiPaths yo'llari boshida '/' siz, oxirida '/' bilan (§8.1)", () {
    for (final p in [ApiPaths.login, ApiPaths.me, ApiPaths.conversations, ApiPaths.products]) {
      expect(p, isNot(startsWith('/')));
      expect(p, endsWith('/'));
    }
  });
}
