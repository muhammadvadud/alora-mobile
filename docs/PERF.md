# Alora Mobile — ishlash o'lchovlari (PERF.md)

> `rules.md` §13 talablari bo'yicha. O'lchov sanasi: 2026-09-18. Flutter 3.47.4, Android SDK 36/37.

## APK hajmi (19.6)

| Build | Hajm | Talab | Holat |
|---|---|---|---|
| `app-arm64-v8a-release.apk` (`--split-per-abi`, R8 minify + shrinkResources, `env/prod.json`) | **26.0 MB** | ≤ 40 MB | ✅ |
| `app-debug.apk` (split'siz, barcha ABI) | 169.6 MB | — | faqat dev |

Buyruq:
```
flutter build apk --release --split-per-abi --target-platform android-arm64 --dart-define-from-file=env/prod.json
```
Eslatma: `--analyze-size` bayrog'i Flutter 3.47.4 da dev-bog'liqlik `integration_test` plagini bilan
`GeneratedPluginRegistrant` xatosini beradi (Flutter bug) — hajm tahlili uchun `flutter build apk --release
--analyze-size` ni `integration_test` ni vaqtincha pubspec'dan olib turib ishga tushirish mumkin.
R8 uchun `android/app/proguard-rules.pro` da Play Core `-dontwarn` qoidalari.

## Sovuq ishga tushish, chat 60 FPS, streaming rebuild (19.5)

Hozircha **o'lchanmagan** — real qurilma/emulator yo'q (emulator 12 GB bo'sh disk talab qiladi).
O'lchash tartibi:
```
flutter run --profile --dart-define-from-file=env/dev.json
# DevTools → Performance: Timeline "AppStartup" (maqsad ≤ 2 s)
# Chat ekranida 100+ xabar bilan scroll → "Frame rendering" ≤ 16 ms (60 FPS)
# Streaming: ChatNotifier throttle testi (test/unit/features/chat) — rebuild ≤ 20/s
```
Natijalar shu jadvalga yoziladi:

| Ko'rsatkich | Chegara | O'lchov | Qurilma |
|---|---|---|---|
| Sovuq start | ≤ 2 s | — | — |
| Chat scroll (100+ xabar) | 60 FPS | — | — |
| Streaming rebuild | ≤ 20/s | testda tasdiqlangan (50 ms throttle, 100 chunk → ≤3 commit, bo'lak yo'qolmaydi) | flutter test |
| Ovoz: birinchi audio | ≤ 3 s | — (backend streaming blokeri, rules §8.6) | — |

## Test qoplamasi (19.1) — 2026-09-19

`flutter test --coverage` (unit+widget+golden+integration), `*.g.dart`/`*.freezed.dart`/l10n chiqarib tashlangan:

| Soha | Qoplama | Talab |
|---|---|---|
| Umumiy | **72.4%** | ≥ 70% ✅ |
| `core/utils` | 98.9% | ≥ 90% ✅ |
| `core/network/interceptors` | 93.8% | ≥ 90% ✅ |
| `core/sse` | 94.5% | ≥ 90% ✅ |
| `features/chat/application` | 90.4% | ≥ 90% ✅ |
