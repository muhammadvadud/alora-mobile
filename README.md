# Alora Mobile

Alora loyihasining mobil ilovasi (Android va iOS) xodimlar va mijozlar uchun mo'ljallangan. U buyurtmalar boshqaruvi, chat orqali AI yordamchisi va mahsulotlar katalogini o'zida jamlaydi. Ilova Riverpod va Clean Architecture prinsiplariga asoslangan holda qurilgan.

## Talablar

- Flutter 3.47.4
- Dart 3.13.3
- JDK 17
- Android SDK 36 yoki 37

## O'rnatish

Loyihani klonlagandan so'ng, qaramliklarni o'rnating va generatsiya kodlarini yarating:

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter gen-l10n
```

### Lefthook o'rnatish

Git hooklar ishlashi uchun lefthook ni o'rnating:

```bash
lefthook install
```

## Muhitlar

Loyiha uch xil muhitda ishlashi mumkin. Tegishli muhit fayli ishga tushirishda ko'rsatiladi:

- **dev**: `--dart-define-from-file=env/dev.json` (API_BASE_URL: `http://10.0.2.2/api/v1` - nginx 80-port)
- **staging**: `--dart-define-from-file=env/staging.json`
- **prod**: `--dart-define-from-file=env/prod.json`

## Ishga tushirish va tekshirish buyruqlari

```bash
# Ilovani ishga tushirish (dev muhiti)
flutter run --dart-define-from-file=env/dev.json

# Testlarni yurgizish
flutter test

# Kodni analiz qilish
dart analyze --fatal-infos

# Kodni formatlash
dart format --set-exit-if-changed -o none lib test

# Custom lint yurgizish
dart run custom_lint
```

## Papka tuzilmasi

Loyiha feature-first va Clean Architecture prinsiplariga asoslangan. To'liq struktura va qoidalar haqida [rules.md §2](rules.md) da o'qishingiz mumkin.
Qisqacha ko'rinishi:
- `lib/app/`: Router, theme, l10n.
- `lib/core/`: Network, sse, ws, storage kabi umumiy logikalar.
- `lib/features/`: auth, chat, catalog, orders kabi alohida bo'limlar (data, domain, application, presentation qatlamlari).
- `lib/shared/`: Umumiy widgetlar, modellar, extensionlar.

## Hujjatlar

Loyihaga oid hujjatlar:
- [rules.md](rules.md) - Ishlab chiqish qoidalari (majburiy)
- [tasks.md](tasks.md) - Vazifalar ro'yxati
- [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) - Loyiha arxitekturasi
- [docs/API-CONTRACT.md](docs/API-CONTRACT.md) - API bilan integratsiya shartnomasi
- [docs/DESIGN-TOKENS.md](docs/DESIGN-TOKENS.md) - UI tokenlari
- [docs/PERF.md](docs/PERF.md) - Ilova samaradorligi ko'rsatkichlari

## Release Build

Ilovani Play Store ga chiqarish uchun qadamlar:
1. `android/key.properties.example` faylidan nusxa olib, `android/key.properties` faylini yarating.
2. O'z kalit ma'lumotlaringizni `android/key.properties` ichiga yozing va `.jks` faylini joylashtiring.
3. Release APK qurish:
   ```bash
   flutter build apk --release --split-per-abi --target-platform android-arm64 --dart-define-from-file=env/prod.json $(tool/version_defines.sh)
   # tool/version_defines.sh pubspec `version` dan APP_VERSION/BUILD_NUMBER beradi (Profil → "Ilova haqida")
   # Flutter 3.47.4 da `--analyze-size` integration_test plagini bilan xato beradi — CI hajmni fayldan o'lchaydi
   ```
   (yoki aab formati uchun `flutter build appbundle`).
