# Alora Mobile — Ish rejasi (tasks.md)

> Manba: `plan/03-MOBILE-TZ.md` · `plan/04-MOBILE-DESIGN-TZ.md` · dizayn: `docs/design/Alora-Mobil.dc.html` · Qoidalar: `rules.md`
> Belgilar: `[ ]` boshlanmagan · `[~]` jarayonda · `[x]` tugallangan (test o'tgan, `rules.md` §16)
> Har bir ish tugagach shu fayl **o'sha ishning commit'i ichida** yangilanadi.
> **Har agent ishni `rules.md` ni to'liq o'qishdan boshlaydi** (§0.2). Ekran ID'lari (`S-xx`) `rules.md` §6 jadvaliga mos.

**Umumiy holat:** 101 / 249 bajarildi (43 jarayonda) (2026-09-16)

---

## Bosqich 0 — Poydevor (infratuzilma)

- [x] 0.1 Flutter SDK (stable 3.47.4) o'rnatish, `flutter doctor` toza (Android SDK 36, JDK 17; iOS — Mac mavjud bo'lsa) — `rules.md` §19.4
- [x] 0.2 `flutter create alora_mobile --org uz.alora --platforms android,ios`; ortiqcha fayllar (`test/widget_test.dart`, `web/`) olib tashlanadi
- [x] 0.3 `.gitignore`, `README.md`, `.editorconfig`, `LICENSE`; `git init`, `main` branch
- [x] 0.4 `pubspec.yaml` — `rules.md` §17 ro'yxatidagi paketlar, versiyalar qadalgan (`^` bilan minor); `flutter pub get` xatosiz
- [x] 0.5 `analysis_options.yaml` — `flutter_lints` + `riverpod_lint` + `custom_lint` + §14.1 qat'iy qoidalar; `dart analyze` 0 issue
- [x] 0.6 `build.yaml` — freezed/json_serializable/riverpod_generator sozlamalari; `dart run build_runner build` ishlaydi
- [x] 0.7 `l10n.yaml` + `app/l10n/app_uz.arb` (asosiy), `app_uz_Cyrl.arb`, `app_ru.arb`; `flutter gen-l10n` ishlaydi; `untranslated-messages-file` CI'da tekshiriladi
- [x] 0.8 Muhit: `--dart-define-from-file` (`env/dev.json`, `env/staging.json`, `env/prod.json`) — `API_BASE_URL`, `WS_BASE_URL`, `SENTRY_DSN`, `ENV`; `.env.example` namuna; `core/env.dart`
- [x] 0.9 Papka tuzilmasi `rules.md` §2 bo'yicha yaratiladi (bo'sh `README.md` bilan har feature'da emas — faqat kerakli papkalar)
- [x] 0.10 `main.dart` + `bootstrap.dart`: `ProviderScope`, `runZonedGuarded`, `FlutterError.onError`, Hive init, Sentry (prod)
- [x] 0.11 `core/utils/app_logger.dart` (`logger`), prod'da `warning`+; `print` lint bilan taqiq
- [x] 0.12 Shriftlar: IBM Plex Sans (400/500/600/700, Latin Ext + Cyrillic), Spectral (500), IBM Plex Mono (500) `assets/fonts/` ga; `pubspec` da ro'yxat
- [x] 0.13 Ikonkalar: `lucide_icons_flutter` (outline 1.5) yoki `assets/icons/*.svg`; `AppIcons` klassi
- [x] 0.14 `flutter_launcher_icons` + `flutter_native_splash` (fon `#F2F3F0`, logotip matn "Alora" Spectral)
- [x] 0.15 Android: `minSdk 26`, `targetSdk` joriy, `INTERNET`, `RECORD_AUDIO`, `CAMERA`, `POST_NOTIFICATIONS` ruxsatlari manifestda; iOS: `Info.plist` — `NSMicrophoneUsageDescription`, `NSCameraUsageDescription`, `NSPhotoLibraryUsageDescription` (o'zbekcha sabab matni)
- [x] 0.16 CI (GitHub Actions): `flutter pub get` → `build_runner` → `gen-l10n` → `dart format --set-exit-if-changed` → `dart analyze` → `flutter test --coverage` → coverage gate ≥70% → `flutter build apk --split-per-abi --analyze-size` (≤ 40 MB tekshiruvi)
- [x] 0.17 `pre-commit` (yoki `lefthook`): format, analyze, `build_runner` tekshiruvi
- [x] 0.18 `plan/` papkasi: TZ fayllarining nusxasi yoki symlink (`../../plan`) — agentlar o'qishi uchun
- [x] 0.19 Testlar: `bootstrap` xatosiz ishga tushadi (smoke test), `env` o'qiladi

## Bosqich 1 — Dizayn tizimi (`app/theme` + `shared/widgets`)

> Dizayn artboard: `3f` (Komponentlar kutubxonasi). Har komponent widget-test + golden bilan.

- [x] 1.1 `AppColors` — §7.1 yorug' va qorong'i palitra, `ThemeExtension<AppColors>`; `context.colors` extension
- [x] 1.2 `AppTypography` — §7.2 tokenlar, `tabularFigures` raqamlar uchun; `context.text` extension
- [x] 1.3 `AppRadius`, `AppSpacing` — §7.3
- [x] 1.4 `StatusColors` — §7.5 (8 status + 3 to'lov belgisi)
- [x] 1.5 `AppTheme.light` / `AppTheme.dark` — `ThemeData` (`useMaterial3: true`, `ColorScheme` qo'lda §7.1 dan, `fromSeed` **yo'q**), `InputDecorationTheme`, `ChipTheme`, `BottomSheetTheme`, `SnackBarTheme`, `DialogTheme`, `NavigationBarTheme`
- [x] 1.6 Mavzu rejimi provider (`Tizim/Yorug'/Qorong'i`), Hive'da saqlanadi (`keepAlive`)
- [x] 1.7 `AppButton` — primary / secondary / text / destructive; `isLoading`, `isEnabled`; balandlik 46; bosilgan holat `accentPressed`
- [x] 1.8 `AppChip`, `AppCountChip` (`Qoralama 3`), tanlangan/tanlanmagan/kategoriya holatlari
- [x] 1.9 `ToolChip` — 3 holat: `running` (spinner + "…"), `done` (nuqta + matn + chevron), `error`; bosilsa `onTap`
- [x] 1.10 `TypingLine` — 120×2 chiziq animatsiyasi (1.4 s)
- [x] 1.11 `StatusPill`, `PaymentChip`
- [x] 1.12 `AppTextField` — text/password (ko'rsatish tugmasi)/number/search/multiline; normal/fokus/xato/disabled; `errorText`
- [x] 1.13 `PhoneField` — `+998 90 123 45 67` maskasi, validatsiya
- [x] 1.14 `MoneyText`, `UnitText` (`so'm/m²`, `so'm/dona`, `so'm/m`), `ColorDot`, `LetterAvatar`
- [x] 1.15 `AppCard` (border-only, tanlangan holat 1.5px + halo), `SectionLabel` (overline brass)
- [x] 1.16 `AppBottomSheet` (tutqich, sarlavha, kontent, amal), `AppDialog` (tasdiqlash), `AppSnackbar` (success/error + amal)
- [x] 1.17 `LimitProgressBar` (accent → brass 80% → danger 100%), `SkeletonBox`, `SkeletonList`
- [x] 1.18 `EmptyState` (chizma + sarlavha + matn + tugma), `ErrorState(onRetry)`, `OfflineBanner`, `LimitExceededView`
- [x] 1.19 `AppTabBar` — 4/5 tab, faol `accent` + to'lgan ikonka, badge (`brass`); safe area
- [x] 1.20 `RoleGate` — `minRole` bo'yicha bolani ko'rsatish/yashirish
- [x] 1.21 `ProductCard` — karusel (eni 180) va grid rejimi; rasm 4:5 yoki 1:1 (`price_unit` ga qarab); rang doirasi; narx + birlik
- [x] 1.22 `Waveform` — mikrofon amplitudasi bo'yicha 24 ustunli animatsiya; AI gapirganda boshqa rang
- [x] 1.23 Komponentlar ko'rgazma ekrani `lib/core/dev/component_gallery.dart` (faqat `ENV=dev`, prod build'ga kirmaydi)
- [x] 1.24 Widget testlar: har komponentning barcha holatlari
- [x] 1.25 Golden: komponentlar kutubxonasi (yorug' + qorong'i)

## Bosqich 2 — `core` (network, storage, error, utils)

- [x] 2.1 `core/error/failure.dart` — sealed `Failure` (§8.3), `failure_l10n.dart`
- [x] 2.2 `core/network/api_paths.dart` — §8.1 barcha yo'llar (test: har konstanta `/` bilan tugaydi, bosh `/` yo'q)
- [x] 2.3 `DioClient` — base URL env'dan, `connectTimeout` 10 s, `receiveTimeout` 30 s (SSE'da o'chiriladi), JSON content-type
- [x] 2.4 `AuthInterceptor` — Bearer qo'shish; `login/`, `refresh/` bundan mustasno
- [x] 2.5 `RefreshInterceptor` — 401 → bitta refresh (mutex), navbatdagi so'rovlar qayta yuboriladi; refresh 401 → logout hodisasi
- [x] 2.6 `RetryInterceptor` — faqat idempotent (GET) va tarmoq xatosi; 3 marta, exponential backoff
- [x] 2.7 `ErrorMapperInterceptor` — `DioException` → `Failure` (§8.3 jadvali, `errors` maydonlari `ValidationFailure.fieldErrors` ga)
- [x] 2.8 `LoggingInterceptor` — dev'da; token/parol/telefon maskalanadi
- [x] 2.9 `SecureStorage` — access/refresh token, PIN; `flutter_secure_storage` (Android `encryptedSharedPreferences`)
- [x] 2.10 `HiveBoxes` — box nomlari, `schemaVersion`, versiya o'zgarsa tozalash; adapterlar ro'yxati
- [x] 2.11 `OfflineQueue` — FIFO, `attempts`, konflikt siyosati (§11)
- [x] 2.12 `ConnectivityNotifier` — `connectivity_plus` + haqiqiy ping; `isOnline` stream
- [x] 2.13 `Paginated<T>` model + `CursorPagingController` (keyingi sahifa, `hasMore`, `isLoadingMore`)
- [x] 2.14 `money_format.dart` (`2 748 000 so'm`, narrow NBSP), `phone_format.dart`, `date_format.dart` (`12-sentabr`, `Bugun/Kecha/Bu hafta`), `debounce.dart`
- [x] 2.15 `SseClient` — POST → stream, `\n\n` frame ajratish, `data:` parse, `CancelToken`, uzilishda 3 marta qayta urinish (1/2/4 s)
- [x] 2.16 `SseEvent` sealed — `start / thinking / content / toolCall / toolArgs / toolResult / done(usage, products) / error / unknown`
- [x] 2.17 `VoiceSocket` — WebSocket ochish/yopish, `?locale=`, auth (`?token=` — backend tasdiqlagach), binary (audio) va text (`kind`) frame'lar (§8.6), 1008/1011 yopilish kodlari → `Failure`, reconnect (1 marta)
- [x] 2.18 Unit testlar: SSE parser (har `kind`, buzilgan frame, ikki frame bir chunk'da, frame ikki chunk'ga bo'lingan, uzilish), `Failure` mapper (har HTTP kod), refresh mutex (3 parallel → 1 refresh), retry faqat GET, formatlar (kirill oy nomlari ham), `OfflineQueue`, `Paginated` parse
- [x] 2.19 Coverage `core/sse`, `core/network/interceptors`, `core/utils` ≥ 90%

## Bosqich 3 — `features/auth` (S-01)

> Dizayn: `1a`.

- [x] 3.1 DTO: `LoginRequestDto`, `TokenPairDto` (`access, refresh`), `AuthMeDto` (`profile{id, phone, full_name, role, tenant, device_id}, limit?` — `rules.md` §8.2 shakli); entity `User`, `Role` enum (`employee/manager/admin/unknown`), `LimitStatus`
- [x] 3.2 `AuthRemoteDataSource` — login, refresh, logout, me
- [x] 3.3 `AuthRepository` + `AuthRepositoryImpl` (token secure storage'ga, `me` Hive keshga)
- [x] 3.4 `AuthNotifier` (`keepAlive`) — `unknown → unauthenticated → authenticated(user)`; ishga tushganda token bor bo'lsa `me` chaqiradi, xato bo'lsa refresh, u ham bo'lmasa `unauthenticated`
- [x] 3.5 `LoginScreen` — logotip (Spectral "Alora"), taglayn, `PhoneField`, parol (ko'rsatish), "Kirish" (to'liq eni, spinner), "Parolni unutdingizmi? Manager bilan bog'laning"; ro'yxatdan o'tish **yo'q**
- [x] 3.6 Holatlar: bo'sh, yuklanmoqda, xato (maydon ostida `authentication_failed` matni), bloklangan foydalanuvchi matni
- [x] 3.7 Logout: `POST auth/logout/` (refresh yuboriladi) → tokenlar tozalanadi → Hive foydalanuvchi keshi tozalanadi → `/login`
- [x] 3.8 Testlar: notifier holat o'tishlari, login xato → maydon xatosi, token muddati → refresh → me; widget: login ekrani 3 holat; golden S-01 (yorug'/qorong'i)

## Bosqich 4 — Router, shell, rol

- [x] 4.1 `AppRoutes` konstantalari; `GoRouter` + `StatefulShellRoute.indexedStack` (5 branch)
- [x] 4.2 `redirect`: auth, `/login` ↔ `/chat`, `employee` → `/forbidden`, mijoz rejimi qulfi (§4.3)
- [x] 4.3 `ForbiddenScreen` (403) — "Ruxsat yo'q" + orqaga
- [x] 4.4 `AppTabBar` shell'ga ulanadi; `Boshqaruv` tab'i faqat `manager/admin` (branch mavjud, lekin employee ko'rmaydi va kira olmaydi)
- [~] 4.5 Buyurtmalar tab badge — tasdiqlanmagan qoralamalar soni (`orders?status=draft` count, 5 daq kesh)
- [x] 4.6 Deep-link: `/chat/:id`, `/orders/:id`, `/catalog/products/:id`
- [x] 4.7 Planshet: `width ≥ 840` → chat ikki panelli layout (`LayoutBuilder`), boshqa ekranlar `maxWidth 720` markazda
- [x] 4.8 Testlar: redirect jadvali (rol × yo'l), shell tab soni rolga qarab 4/5, deep-link parse

## Bosqich 5 — `features/conversations` (S-10)

> Dizayn: `2b`, `5a` (chap panel).

- [x] 5.1 DTO/entity: `Conversation` (`id, title, stage, mode, status, last_message_at, total_amount?`, `last_message_preview`), `Stage` enum (`need/recommend/measure/calc/variants/order/unknown`)
- [x] 5.2 `ConversationsRemoteDataSource` — list (cursor, `search`, filtr), create, archive (DELETE), transcript
- [x] 5.3 `ConversationsLocalDataSource` — Hive (oxirgi 20), stale-while-revalidate
- [x] 5.4 `ConversationsRepository` + Impl
- [x] 5.5 `ConversationsNotifier` — sahifalash, qidiruv (300 ms debounce), filtr (bosqich, buyurtmaga aylanganlar)
- [x] 5.6 `ConversationsScreen` — sana bo'yicha guruh (`Bugun/Kecha/Bu hafta/oldingi`), satr: sarlavha, oxirgi xabar, summa (bo'lsa), bosqich nuqtasi + matn; qidiruv maydoni; filtr chip'lari; swipe — arxivlash
- [x] 5.7 Bo'sh holat, skeleton, oflayn kesh ko'rinishi
- [x] 5.8 Yangi suhbat: `POST conversations/` → `/chat/:id`
- [x] 5.9 Planshet chap paneli (`ConversationsPane`) — faol suhbat ajratilgan
- [x] 5.10 Testlar: guruhlash (sana chegaralari, kirill), qidiruv debounce, kesh → tarmoq almashuvi; golden S-10

## Bosqich 6 — `features/chat` — matnli oqim (S-02, S-03, S-04) ★

> Dizayn: `1b`, `1c`, `1d`, `1j`, `5a`. Loyihaning eng katta feature'i; `rules.md` §3.3–3.4, §8.5.

- [~] 6.1 Domain: `Message` (`id, role, content, createdAt, status: sending/streaming/done/error, richBlocks[]`), `RichBlock` sealed (`toolChip`, `products`, `quote`, `options`, `orderDraft`, `warning`), `ToolChipState`
- [~] 6.2 DTO: `MessageDto` (tarix uchun `GET messages/`), `SendMessageRequest` (`content`, `locale`, `context{customer_mode, stage}`), `ProductRefDto`, `UsageDto`
- [~] 6.3 `ChatRemoteDataSource` — tarix (cursor), `sendMessage` → `Stream<SseEvent>`, `reset`
- [~] 6.4 `ChatLocalDataSource` — oxirgi 50 xabar Hive'da (oflayn ko'rish + uzilgan javob saqlash)
- [~] 6.5 `ChatRepository` + Impl — tool natijasini `RichBlock` ga parse (`product_search`, `curtain_calculate`, `price_quote`, `order_draft`); parse xatosi → chip "Natija"
- [~] 6.6 `ChatNotifier` (`family` by conversationId) — `ChatState(messages, isStreaming, activeStream, error, quickReplies, stage)`; event → holat o'tishlari; 50 ms throttle; bitta faol stream
- [~] 6.7 Uzilish: qisman matn saqlanadi, `retry` (oxirgi user xabari qayta yuboriladi), `continue`
- [~] 6.8 `ChatScreen` skeleti — AppBar (orqaga / sarlavha pill + bosqich / ⋮ menyu), xabarlar ro'yxati (`ListView.builder`, `reverse: true`, `RepaintBoundary`), input paneli
- [~] 6.9 S-02 bo'sh holat — "Mijoz nima izlayapti?", boshlash chip'lari (`Mehmonxona`, `Yotoqxona`, `Kelin-kuyov xonasi`, `Oshxona`, `Bolalar xonasi`, `Ofis`) → bosilsa xabar yuboriladi
- [~] 6.10 `UserBubble` (o'ngda, `surfaceMuted`, bubble radius), `AssistantMessage` (chapda, fon yo'q, markdown-lite: **qalin** faqat)
- [~] 6.11 `ThinkingBlock` — kulrang, kichik, yig'iladigan ("O'ylayapti…")
- [~] 6.12 Tool chip oqimi: `tool_call` → chip spinner ("Mahsulot qidirilmoqda…" — tool nomi → o'zbekcha lug'at `tool_labels`), `tool_result` → ✓ + natija matni ("5 ta mahsulot topildi"); bosilsa bottom sheet — argumentlar va natija (debug/ishonch)
- [~] 6.13 `TypingLine` — `start` dan birinchi `content` gacha
- [~] 6.14 `ProductCarousel` (S-04) — gorizontal `ProductCard` ro'yxati; "Batafsil" → `/catalog/products/:id`, "Tanlash" → chatga "Velvet Milano, grafit — tanlandi" xabari
- [~] 6.15 Quick replies — AI savol berganda (`done` event `quick_replies` yoki `tool_result` ichidan) chip'lar; bosilsa yuboriladi; yuborilgach yo'qoladi
- [~] 6.16 Kontekst chip'lari (`Boshqa ranglar`, `Arzonroq`, `Uchta variant`) — mahsulot/hisobdan keyin
- [~] 6.17 Input paneli — "+" (menyu: rasm biriktirish 4-bosqich, mahsulotni kontekstga qo'shish), matn maydoni (ko'p qatorli, max 6), mikrofon (→ S-08), yuborish (`accent` doira; bo'sh yoki streaming — disabled)
- [~] 6.18 Chat menyusi (⋮): yangi suhbat, kontekstni tozalash (`reset`, tasdiq dialogi), mijoz rejimi, PDF taklif (4-bosqich), ulashish (4-bosqich)
- [~] 6.19 Xato holatlari: `error` event → qizil banner + "Qayta urinish"; 503 → "AI xizmati vaqtincha ishlamayapti"; 429 → `LimitExceededView`; oflayn → `OfflineBanner` + input disabled
- [~] 6.20 Haptik: `done` da `HapticFeedback.lightImpact`
- [~] 6.21 Avto-scroll: streaming paytida pastga; foydalanuvchi yuqoriga scroll qilgan bo'lsa — "↓ Yangi xabar" tugmasi
- [~] 6.22 Planshet (5a): chapda `ConversationsPane` (320), o'ngda chat; AppBar'da mijoz ismi va "Mijoz rejimi" tugmasi
- [~] 6.23 Qorong'i mavzu (1j) tekshiruvi — barcha chat widgetlari tokenlardan
- [~] 6.24 Testlar: notifier — har event ketma-ketligi (`start→content×n→tool_call→tool_result→done`), throttle (100 chunk → ≤ 3 rebuild/50 ms), uzilish → qisman matn, retry; widget: bo'sh holat chip'lari, tool chip 3 holat, karusel, quick replies; golden S-02, S-03 (yorug'/qorong'i/planshet), S-04
- [~] 6.25 Coverage `features/chat/application` ≥ 90%

## Bosqich 7 — `features/chat` — boy kartochkalar (S-05, S-06, S-07) ★

> Dizayn: `1e`, `1f`, `1g`, `5b`, `5c`. Hisob kartochkasi **3 guruhli** (TZ ustun, `rules.md` §9.8).

- [~] 7.1 `Quote` entity — `fabrics[]`, `accessories[]`, `services[]`, `wasteWarnings[]`, `formula`, `subtotal/discount/delivery/total`, `measurement(room, cornice, height, coef)`
- [~] 7.2 `curtain_calculate` / `price_quote` natijasini `Quote` ga mapper (backend `calc/preview/` javob shakli bilan bir xil; `tests/fixtures/calc_cases.json` dan 3 misol fixture)
- [~] 7.3 `QuoteCard` (S-05) — sarlavha `HISOB · MEHMONXONA` (overline), ostida o'lchov satri; 3 guruh `SectionLabel` bilan: **MATOLAR** (rol tegi + rang doirasi + nom · m² · summa; ikkinchi qator: `4.2 m × 2.6 m · K 2.5 · 180 000/m²`), **BEZAKLAR** (nom · miqdor+birlik · summa), **XIZMATLAR**; raqamlar tabular ustunda
- [~] 7.4 "Yana N ta bo'lak" — 6 tadan ortiq qator bo'lsa dastlab 4 tasi
- [~] 7.5 JAMI bloki (1px chiziq, 22px summa + `so'm`), chegirma/yetkazish qatorlari (bo'lsa)
- [~] 7.6 "Qanday hisoblandi?" — ochiladigan blok: formula matni, koeffitsient izohi (`accent` "Yopish/Ko'rish")
- [~] 7.7 Chiqindi ogohlantirish bloki — ikonka + matn (`Kant bo'lagida chiqindi 22% — 280 sm eni bo'lgan mato arzonroq tushadi`), emoji yo'q
- [~] 7.8 Qator bosilsa — `PartEditSheet` (bottom sheet): mato almashtirish (katalogdan tanlash), eni, balandligi, koeffitsient → chatga "Kant bo'lagini X ga o'zgartir" xabari sifatida yuboriladi (ilova hisoblamaydi, §0.8)
- [~] 7.9 Kartochka ostida tugmalar: "Bo'lak qo'shish" · "Variantlarni ko'rish"; chip'lar `Uchta variant` · `Chegirma qo'sh` · `Buyurtma qil`
- [~] 7.10 `PricingOption` entity (`tier: cheap/mid/premium`, `title`, `total`, `lines[]`, `difference`), `OptionsCard` (S-06) — gorizontal `PageView` (viewportFraction 0.86), o'rtachasi default tanlangan (1.5px `accent` + halo), har birida "Tanlash"; tanlash → chatga xabar
- [~] 7.11 S-06 planshet (5b): 3 ustun yonma-yon, mijozga ko'rsatish uchun katta summa
- [~] 7.12 `OrderDraft` entity (`customerName?, phone?, address?, measurements[], total, prepayment?, deadline?, missingFields[]`), `OrderDraftCard` (S-07) — to'ldirilgan maydonlar; yetishmayotganlari `brass`/`danger` belgili (`Telefon raqami kerak`); "Tahrirlash" (→ S-14 forma, draft bilan) · "Buyurtma yaratish" (→ `POST orders/` → `/orders/:id`)
- [~] 7.13 `WarningBlock` (umumiy) — AI ogohlantirishlari (narx yangilanmayotgan bo'lishi mumkin va h.k.)
- [~] 7.14 Testlar: `Quote` mapper (3 fixture, 10 bo'lakli parda), guruhlar ko'rinishi, "yana N ta", JAMI backend `total` bilan mos (yig'indi testi), `OptionsCard` tanlov, `OrderDraftCard` yetishmayotgan maydonlar; golden S-05, S-06 (yorug'/qorong'i/planshet), S-07

## Bosqich 8 — `features/catalog` (S-16, S-17, S-18)

> Dizayn: `2d`, `4c`, `2e`.

- [x] 8.1 DTO/entity: `Category`, `Product` (AI atributlari bilan: `fabric_type, pattern, style, transparency, composition, care, recommended_rooms, recommended_coef, default_width_m, segment`), `ProductVariant` (`sku, color_name, color_hex, width_m, price, price_unit, old_price, cost_price?`), `ProductImage` (`thumbnail_url, image_url, is_primary`); enum'lar `unknown` bilan
- [x] 8.2 `CatalogRemoteDataSource` — categories, products (filtr + cursor + search), product detail, variant detail
- [x] 8.3 `CatalogLocalDataSource` — Hive stale-while-revalidate, TTL 24 soat
- [x] 8.4 `CatalogRepository` + Impl
- [x] 8.5 `CatalogFilter` model (`type: fabric/accessory`, `style, room, pattern, transparency, segment, priceRange`) + `CatalogNotifier` (sahifalash, filtr, qidiruv debounce)
- [x] 8.6 `CatalogScreen` (S-16) — qidiruv + filtr tugmasi (faol filtrlar soni badge), kategoriya chip'lari (gorizontal), 2 ustunli grid `ProductCard` (rasm 4:5 / 1:1, nom, narx+birlik, rang doiralari)
- [x] 8.7 `CatalogFilterSheet` (S-17) — tur, uslub, xona, naqsh, shaffoflik, segment, narx slayderi; "Tozalash" · "Ko'rsatish (N ta)" (N — server count yoki birinchi sahifa)
- [x] 8.8 `ProductScreen` (S-18) — rasm galereyasi (`PageView` + nuqtalar), nom, kategoriya, narx (katta) + birlik, rang variantlari (aylana chip'lar; tanlanganda narx va rasm o'zgaradi), xususiyatlar jadvali, pastda "AI'dan so'rash" (asosiy) · "Hisobga qo'shish"
- [x] 8.9 "AI'dan so'rash" → faol/yangi suhbatga `Shu mato (Velvet Milano, grafit) mehmonxonaga to'g'ri keladimi?` matni bilan o'tish
- [x] 8.10 "Hisobga qo'shish" → faol suhbatga "Hisobga qo'sh: {variant}" xabari
- [x] 8.11 Ombor/qoldiq belgilari **chizilmaydi** (v1 da yo'q) — testda `stock` so'zi UI'da yo'qligi tekshiriladi
- [x] 8.12 Skeleton grid, bo'sh natija ("Hech narsa topilmadi" + "Filtrni tozalash"), oflayn kesh
- [x] 8.13 Testlar: filtr → query param mapper, kesh/tarmoq, rang tanlash narxni o'zgartiradi; golden S-16, S-18

## Bosqich 9 — `features/orders` (S-11 … S-15)

> Dizayn: `1h`, `1i`, `2c`, `4b`, `3e`, `5d`, `5e`.

- [ ] 9.1 DTO/entity: `Order` (`number, status, payment_status, customer_*, subtotal, discount_percent/amount/source, delivery_amount, total, prepayment_percent/prepayment/balance, deadline_date, note, measurements[], items[], confirmed_at, user`), `OrderMeasurement` (`room_name, cornice_length_m, height_m, coefficient, parts[], accessories[]`), `OrderCurtainPart`, `OrderAccessory`, `OrderItem`, `OrderStatus` enum (§7.5, `unknown`), `PaymentStatus`, `StatusTransition` (`GET orders/statuses/`)
- [ ] 9.2 `OrdersRemoteDataSource` — list (status/sana/xodim filtr, search, cursor), detail, create, patch, confirm, changeStatus, statuses, pdf (bytes)
- [ ] 9.3 `OrdersRepository` + Impl; `statuses` 1 soat kesh
- [ ] 9.4 `OrdersListNotifier` (filtr chip, qidiruv), `OrderDetailNotifier` (family), `OrderFormNotifier`
- [ ] 9.5 `OrdersScreen` (S-11) — qidiruv (raqam/ism/telefon), status filtr chip'lari sonli (`Qoralama 3`), `OrderCard`: chap chetida status chizig'i, raqam `mono`, status pill, mijoz · telefon, xonalar · deraza soni, summa + to'lov chip'i, muddat (≤3 kun `brass`, o'tgan `danger`, yo'q — "Muddat qo'yilmagan"); draft'da inline "Tasdiqlash"
- [ ] 9.6 Swipe: chapga — "Status o'zgartirish" (S-13), o'ngga — "Qo'ng'iroq qilish" (`url_launcher tel:`)
- [ ] 9.7 S-15 bo'sh holat — chizma, "Hali buyurtma yo'q", "Chatda hisob qilib, buyurtma yarating" + "Yangi suhbat"
- [ ] 9.8 `OrderDetailScreen` (S-12) — 1) sarlavha: raqam, katta status pill, sana, sotuvchi; 2) `StatusTimeline` (vertikal 7 qadam, o'tilganlar `accent` + sana, joriy ajratilgan, keyingilar kulrang; `cancelled` alohida); 3) mijoz (telefon → qo'ng'iroq, manzil → xarita `geo:`); 4) har xona kartochkasi: nom, karniz, balandlik, mato bo'laklari (rol, mato, rang, m², summa); 5) pozitsiyalar (xizmatlar); 5b) bezaklar; 6) moliya bloki: jami · chegirma (% + manba `bosqichli/qo'lda`) · yetkazish · **JAMI** · avans (%) · **qoldiq**; 7) izoh; 8) yopishqoq panel — statusga qarab asosiy amal (`Tasdiqlash / Tikuvga topshirish / Tayyor deb belgilash / Topshirildi`) + ⋮ (PDF, ulashish, bekor qilish)
- [ ] 9.9 `StatusChangeSheet` (S-13) — radio ro'yxat (faqat `statuses` dagi ruxsat etilgan o'tishlar faol), izoh, sana (kerak bo'lsa), "Saqlash" → `POST status/`
- [ ] 9.10 Bekor qilish — `AppDialog` ("Buyurtmani bekor qilasizmi?", destruktiv) → `status/ cancelled`
- [ ] 9.11 `OrderFormScreen` (S-14) — bo'limlar: Mijoz (ism, `PhoneField`, manzil) → O'lchovlar (xona qo'shish: nom, karniz, balandlik, koeffitsient) → har xonada Bo'laklar (rol, mato tanlash — katalog picker sheet, eni, balandligi, K) va Bezaklar (mahsulot, miqdor) → Xizmatlar → Moliya (chegirma % — avtomatik taklif placeholder, avans % — `50% (default)` placeholder, yetkazish) → Muddat → izoh; yopishqoq "Saqlash"
- [ ] 9.12 Chegirma chegarasi: `discount-policy` dan olinadi; oshsa maydon ostida `Sizga 5% gacha ruxsat berilgan` (lokal) + server `ValidationFailure` ham shu maydonga
- [ ] 9.13 Forma → `POST orders/` (yangi) yoki `PATCH orders/{id}/` (faqat o'zgargan maydonlar, `dirty` tracking); AI draft'idan ochilganda maydonlar to'ldirilgan
- [ ] 9.14 Tasdiqlash: `POST confirm/` → detail yangilanadi → snackbar "Buyurtma tasdiqlandi"; tab badge yangilanadi
- [ ] 9.15 Qorong'i mavzu (5d, 5e) tekshiruvi
- [ ] 9.16 Testlar: status → rang/matn jadvali (8), ruxsat etilgan o'tishlar server'dan (ilova hisoblamaydi), muddat rangi (3 holat), chegirma chegarasi (employee/manager), forma `dirty` → PATCH body faqat o'zgargan maydon, timeline ko'rinishi; golden S-11, S-12 (yorug'/qorong'i), S-13, S-14, S-15

## Bosqich 10 — `features/profile` (S-25)

> Dizayn: `2f`.

- [ ] 10.1 `ProfileScreen` — ism, telefon, rol chip'i, bugungi sarf + limit (`LimitProgressBar`; `∞` cheksiz bo'lsa), til (O'zbek lotin / Кирилл / Русский), mavzu (Tizim/Yorug'/Qorong'i), "Chiqish"
- [ ] 10.2 `LocaleNotifier` (`keepAlive`, Hive) — tanlov darhol qo'llanadi
- [ ] 10.3 Sarf ma'lumoti `auth/me/` dan (`limit` bloki); 5 daqiqada yangilanadi
- [ ] 10.4 Testlar: til almashinuvi ARB matnini o'zgartiradi (uz→ru), mavzu saqlanadi; golden S-25

## Bosqich 11 — `features/management` — statistika va xodimlar (S-19, S-20, S-21)

> Dizayn: `3a`, `3b`, `4d`. Faqat `manager/admin`; `RoleGate` + router.

- [ ] 11.1 DTO/entity: `UsageSummary` (`period, conversations, orders, conversion, cost_uzs, tokens, daily[]`), `UserUsage` (reyting satri), `Employee` (`id, full_name, phone, role, is_active, last_login_at, today_cost, limit: UsageLimit`), `UsageLimit` (`period, is_unlimited, max_tokens, max_cost_uzs, max_messages, on_exceed`)
- [ ] 11.2 `UsageRemoteDataSource` — summary, by-user, conversations (eng qimmat), conversion
- [ ] 11.3 `TeamRemoteDataSource` — employees list/create/patch, limit, employee conversations
- [ ] 11.4 Repository'lar + notifier'lar (`period` toggle, sahifalash)
- [ ] 11.5 `ManagementHomeScreen` (S-19) — davr toggle (`Bugun/Hafta/Oy`), 4 kartochka (Suhbatlar · Buyurtmalar · Konversiya % · Sarf so'm), `fl_chart` chiziqli grafik (bitta chiziz, nozik grid, oxirgi nuqta ajratilgan, `accent`), xodimlar reytingi jadvali (Xodim · Suhbat · Sarf · Buyurtma), bo'limlarga kirish ro'yxati (Xodimlar, Mahsulotlar, Narx qoidalari, Bilimlar, Sozlamalar[admin])
- [ ] 11.6 `EmployeesScreen` (S-20) — satr: `LetterAvatar`, ism, rol chip'i, oxirgi faollik, bugungi sarf, `LimitProgressBar` (yoki `∞`); qidiruv; "Xodim qo'shish"
- [ ] 11.7 `EmployeeCreateSheet` — telefon, ism, boshlang'ich parol (ko'rsatish), rol → `POST team/employees/`; maydon xatolari
- [ ] 11.8 `EmployeeScreen` (S-21) — profil tahriri (ism, rol), bloklash toggle (tasdiq), "Suhbatlarini ko'rish" → xodim suhbatlari ro'yxati (5-bosqich ekrani qayta ishlatiladi, `transcript` o'qish rejimi)
- [ ] 11.9 Limit bloki — eng ustida "Cheksiz" toggle; yoqilsa maydonlar disabled; o'chirilgan: davr (kunlik/oylik), token limiti, summa limiti, xabar limiti, limit tugaganda (ogohlantirish/bloklash) → `POST limit/`
- [ ] 11.10 `TranscriptScreen` — manager uchun o'qish rejimi (input yo'q), tool chip'lar ko'rinadi
- [ ] 11.11 Testlar: employee `/management` 403 (router), davr toggle → query param, limit "Cheksiz" → `{is_unlimited: true}` body, progress rang chegaralari; golden S-19, S-20, S-21

## Bosqich 12 — `features/management` — mahsulot CRUD (S-22)

> Dizayn: `3c`. Oflayn navbat `rules.md` §11.

- [ ] 12.1 Write DTO'lar: `ProductWriteDto`, `VariantWriteDto`, `BulkPriceDto` (`variant_ids, percent | amount`), rasm multipart
- [ ] 12.2 `CatalogWriteDataSource` — product create/patch/delete, variant create/patch/delete, bulk-price, image upload (progress), image delete
- [ ] 12.3 `ProductFormNotifier` — `dirty` tracking, variantlar inline ro'yxati, validatsiya (nom, kod, kategoriya, narx > 0, `color_hex` format)
- [ ] 12.4 `ProductsManageScreen` — ro'yxat + qidiruv + kategoriya filtri; satrda narx (birlik bilan); faol/nofaol toggle; ko'p tanlash rejimi → "Narxni o'zgartirish" (bulk)
- [ ] 12.5 `ProductFormScreen` (S-22) — rasm qatori ("+" kamera/galereya → `image_cropper` 4:5 yoki 1:1 → `flutter_image_compress` ≤ 1200px ≤ 1 MB → upload), maydonlar (nom, kod, kategoriya, mato turi, naqsh, uslub, shaffoflik, rulon eni, segment, tarkib, parvarish, tavsif), tavsiya etilgan xonalar (chip multi-select), **narx birligi** (`m² / dona / metr`), variantlar bo'limi (rang doirasi + `flutter_colorpicker`, rang nomi, SKU, narx + birlik, o'chirish; "+ Variant qo'shish"), yopishqoq "Saqlash"
- [ ] 12.6 `BulkPriceSheet` — `+10%` / `−5%` / "yangi narx"; oldindan ko'rish (eski → yangi 3 misol); tasdiq
- [ ] 12.7 Oflayn: saqlash internet yo'q bo'lsa `OfflineQueue` ga; snackbar "Saqlanadi: internet qaytganda"; qaytganda yuborish; konflikt → "Server versiyasi saqlandi" ogohlantirish
- [ ] 12.8 Server maydon xatolari (`errors.variants.0.price`) → tegishli variant maydoni ostida
- [ ] 12.9 Rasm yuklash ruxsati sababi bilan so'raladi (`permission_handler`), rad etilsa tushunarli matn + sozlamalarga o'tish
- [ ] 12.10 Testlar: forma validatsiya, `dirty` → PATCH body, `errors` → maydon mapping (nested), bulk oldindan ko'rish hisobi backend bilan mos (faqat ko'rsatish), oflayn navbat → qaytganda yuborish tartibi; golden S-22

## Bosqich 13 — `features/management` — narx qoidalari va bilimlar (S-23, S-24)

> Dizayn: `3d`, `4e`.

- [ ] 13.1 DTO/entity: `CalcRule` (`key, value, unit, description`), `ServicePrice`, `DiscountTier`, `DiscountPolicy`, `OrderDefaults`, `CalcPreviewRequest/Response`
- [ ] 13.2 `PricingRemoteDataSource` — calc-rules list/patch, services list/patch, discount-tiers CRUD, discount-policy get/patch, order-defaults get/patch, `pricing/calc/preview/`
- [ ] 13.3 `PricingRulesScreen` (S-23) — 3 bo'lim: **Koeffitsientlar** (nom, ostida kulrang `description`, o'ngda qiymat maydoni — inline tahrir, blur'da PATCH), **Chegirma bosqichlari** (jadval `5 000 000 dan → 3%`, qator qo'shish/o'chirish; ostida employee/manager qo'lda maks %), **Standart qiymatlar** (avans %, yetkazish, muddat kun)
- [ ] 13.4 "Hisobni sinash" → sheet: uzunlik, balandlik, bo'lak soni (default koeffitsient) → `POST pricing/calc/preview/` → natija `QuoteCard` (7-bosqich) bilan ko'rsatiladi
- [ ] 13.5 `KnowledgeRule` entity (`kind, condition{room, style,...}, recommendation, priority, is_active`), `KnowledgeRemoteDataSource` CRUD
- [ ] 13.6 `KnowledgeScreen` (S-24) — qoida kartochkalari: shart chip'lari (`mehmonxona` + `hi-tech`) → tavsiya matni, priority, faol toggle; "+ Qoida qo'shish"
- [ ] 13.7 `KnowledgeRuleForm` — tur, shart tanlovi (xona/uslub/yorug'lik/... chip'lar), tavsiya matni, priority, faol; "AI'da sinash" → yangi suhbat ochiladi
- [ ] 13.8 Testlar: inline qiymat → PATCH `{value}`, tier qo'shish/o'chirish, preview so'rov shakli, knowledge shart → JSON; golden S-23, S-24

## Bosqich 14 — `features/management` — sozlamalar (faqat admin)

> Dizayn yo'q (TZ §2.7f) — `rules.md` §7 tokenlari bilan, S-23 uslubida.

- [ ] 14.1 DTO/entity: `PromptVersion` (`id, version, content, created_at, created_by, is_active`), `ModelPricing`
- [ ] 14.2 `SettingsRemoteDataSource` — prompt list/create/rollback, model-pricings CRUD
- [ ] 14.3 `SystemPromptScreen` — joriy prompt (ko'p qatorli tahrir, `mono` shrift), "Yangi versiya saqlash", versiyalar tarixi (sana, kim), "Qaytarish" (rollback, tasdiq)
- [ ] 14.4 `LlmSettingsScreen` — provider/model tanlovi, temperature (backend endpoint mavjud bo'lsa; yo'q bo'lsa `ModelPricing` ro'yxati va §19 ga yozuv)
- [ ] 14.5 `VoiceSettingsScreen` — TTS ovozi, tezligi (backend endpoint mavjud bo'lsa; aks holda §19)
- [ ] 14.6 `cost_price` ko'rinishi — admin uchun mahsulot formasida va variant satrida "Tannarx" maydoni (faqat `role == admin`)
- [ ] 14.7 Testlar: manager sozlamalar yo'liga kira olmaydi (router + `RoleGate`), rollback tasdiq, tannarx manager'ga ko'rinmaydi

## Bosqich 15 — Ovozli rejim (S-08) ★

> Dizayn: `2a`. `rules.md` §8.6.

- [ ] 15.1 Mikrofon ruxsati — kerak bo'lganda, sabab matni bilan; rad → tushunarli holat
- [ ] 15.2 `AudioRecorder` servisi (`record`) — Opus/PCM16 16 kHz mono, 200 ms chunk stream, amplituda stream (`Waveform` uchun)
- [ ] 15.3 `Vad` — oddiy energiya asosidagi sukut aniqlash (1.2 s sukut → `end`); barge-in uchun gap boshlanishi
- [ ] 15.4 `AudioPlayer` servisi (`just_audio` + custom `StreamAudioSource`) — kelgan chunk'larni ketma-ket ijro, 200 ms bufer, `stop()` darhol
- [ ] 15.5 `VoiceNotifier` — holatlar: `idle → listening → transcribing → speaking → idle`; push-to-talk va erkin suhbat rejimlari; barge-in; `mute` (javob faqat matnda)
- [ ] 15.6 `VoicePanel` (S-08) — pastki panel kengayadi: `Waveform`, "Eshityapman…" + taymer, katta "To'xtatish"; AI gapirganda to'lqin boshqa rangda + "To'xtatish" (barge-in); "Ovoz/Matn" toggle; yuqorida TRANSKRIPT bloki (kulrang → final bo'lganda qorayadi)
- [ ] 15.7 Transkript va AI javobi `ChatNotifier` ga xabar sifatida qo'shiladi (matn ham ekranda)
- [ ] 15.8 `wakelock_plus` yoqish/o'chirish; `audio_session` (qo'ng'iroq kelsa to'xtatish); `AppLifecycleState.paused` → to'xtatish, socket yopish
- [ ] 15.9 Raqamlar TTS'da to'g'ri o'qilishi backend vazifasi — ilova faqat matnni ko'rsatadi (test: `2 500 000 so'm` matni o'zgarmaydi)
- [ ] 15.11 **Backend blokeri:** WS JWT auth (`AuthMiddlewareStack` → JWT middleware) va haqiqiy streaming (`list(...)` o'rniga event-by-event) — backend `tasks.md` ga so'rov; ilova tomonida 15.1–15.9 mock socket bilan yakunlanadi, real qurilma testi backend tuzatilgach
- [ ] 15.10 Testlar: `VoiceNotifier` holat mashinasi (fake recorder/player/socket), barge-in → player stop + `interrupt` xabari, lifecycle paused → cleanup; widget: panel holatlari; golden S-08

## Bosqich 16 — Mijoz rejimi (S-09)

> Dizayn: `4a`. `rules.md` §12.

- [ ] 16.1 `CustomerModeNotifier` (`keepAlive`) — `enabled`, PIN secure storage'da; ilova qayta ochilsa saqlanadi
- [ ] 16.2 Yoqish oqimi: chat menyusi → PIN o'rnatish (4 raqam, ikki marta) → rejim yoqiladi
- [ ] 16.3 Chiqish: qulf ikonkasi → PIN → 3 marta xato → 30 s kutish
- [ ] 16.4 Chat'da yashirish: tool chip, thinking, "Qanday hisoblandi?", usage, menyu, tab bar; `SendMessageRequest.context.customer_mode = true`
- [ ] 16.5 Katta shrift (+2 sp) `MediaQuery.textScaler` orqali emas — `AppTypography.customer` varianti
- [ ] 16.6 Yuqorida indikator `Mijoz rejimi` + qulf; router qulfi (§4.3); Android orqaga bloklanadi (`PopScope`)
- [ ] 16.7 Testlar: yashirilgan elementlar ro'yxati (widget), router boshqa yo'lga o'tkazmaydi, PIN xato hisoblagichi; golden S-09

## Bosqich 17 — Oflayn, barqarorlik, tizim holatlari (S-26)

> Dizayn: `3e`. `rules.md` §11.

- [ ] 17.1 `OfflineBanner` global (shell ustida), `ConnectivityNotifier` bilan; qaytganda `OfflineQueue.flush()`
- [ ] 17.2 Chat, suhbatlar, katalog oflayn kesh ko'rinishi — end-to-end tekshiruv (airplane mode integration test)
- [ ] 17.3 `LimitExceededView` — 429 da chat o'rnida; "Managerga yozish" (`tel:`/`sms:` manager telefoni `auth/me/` dan bo'lsa)
- [ ] 17.4 Global xato ushlagich — kutilmagan `Failure` → `ErrorState` (ekran) yoki snackbar (amal); stack trace Sentry'ga
- [ ] 17.5 Skeleton'lar — har ro'yxat/tafsilot ekranida (`CircularProgressIndicator` sahifa yuklanishida — lint/test bilan taqiq)
- [ ] 17.6 Bo'sh holatlar — suhbatlar, buyurtmalar (S-15), katalog qidiruv, xodimlar, bilimlar
- [ ] 17.7 Token muddati tugashi oqimi — 30 kunlik refresh o'lsa login; login'da "Sessiya tugadi" snackbar
- [ ] 17.8 Testlar: oflayn → online → navbat yuborildi (tartib), 429 → view, 503 → banner; golden S-26 to'plami

## Bosqich 18 — PDF, ulashish, bildirishnomalar, rasm bo'yicha tavsiya

- [ ] 18.1 PDF taklif: `GET orders/{id}/pdf/` → fayl (`path_provider` temp) → `open_filex` ko'rish → `share_plus` (Telegram/WhatsApp)
- [ ] 18.2 Chat menyusidan "PDF taklif" — faol suhbat buyurtmaga bog'langan bo'lsa; aks holda "Avval buyurtma yarating"
- [ ] 18.3 Ulashish: buyurtma matni (raqam, mijoz, jami, muddat) `share_plus`
- [ ] 18.4 Push: `firebase_messaging` — token `PATCH auth/me/` (`device_id`) yoki backend endpointiga (mavjud bo'lsa; yo'q — §19); turlar: limit tugadi, yangi buyurtma/status (manager), foreground'da `flutter_local_notifications`
- [ ] 18.5 Bildirishnoma ruxsati — kerak bo'lganda (birinchi buyurtma tasdiqlanganda), sabab bilan
- [ ] 18.6 Chat "+" → rasm biriktirish (kamera/galereya, siqish) → xabar bilan yuborish (backend `messages/` multipart yoki `image_url` — shartnoma aniqlanganda; hozircha `[ ]`, §19)
- [ ] 18.7 Testlar: PDF yuklash → fayl mavjud, ulashish matni formati, push payload → navigatsiya (`/orders/:id`)

## Bosqich 19 — Sifat, ishlash, xavfsizlik

- [ ] 19.1 Coverage ≥ 70% umumiy; `core/sse`, `core/network/interceptors`, `core/utils`, `features/chat/application` ≥ 90%
- [ ] 19.2 Golden to'plami to'liq: S-01, S-03 (3 variant), S-05, S-06 (3 variant), S-11 (2), S-12 (2) — CI'da
- [ ] 19.3 Integration test: login → yangi suhbat → xabar → SSE mock → hisob kartochkasi → qoralama → buyurtma → tasdiqlash
- [ ] 19.4 Integration test: employee `/management` → 403; limit 429 → view
- [ ] 19.5 Ishlash: sovuq start ≤ 2 s (`profile` o'lchov hujjatlashtiriladi `docs/PERF.md`), chat 100+ xabar 60 FPS (`flutter drive --profile` timeline), streaming rebuild ≤ 20/s (test)
- [ ] 19.6 APK ≤ 40 MB (arm64) — CI gate; shriftlar subset (faqat kerakli og'irliklar)
- [ ] 19.7 Xavfsizlik: tokenlar faqat secure storage (test: Hive box'larda `token` kaliti yo'q), log maskalash testi, `usesCleartextTraffic=false`, iOS ATS default, root/jailbreak tekshiruvi **yo'q** (TZ'da yo'q)
- [ ] 19.8 Accessibility: `Semantics` label'lar tugma/ikonkalarda, min bosish maydoni 48 dp (test), kontrast — `accent` on `background` ≥ 4.5:1 tekshirildi
- [ ] 19.9 `dart analyze` 0 issue, `dart format` toza, `custom_lint` toza — CI gate
- [ ] 19.10 Sentry: `Failure` lar breadcrumb, foydalanuvchi `id`/`role` (telefon emas)

## Bosqich 20 — Hujjat va yetkazish

- [ ] 20.1 `README.md` — o'rnatish, `--dart-define-from-file`, build buyruqlari, papka tuzilmasi, `rules.md` ga havola
- [~] 20.2 `docs/ARCHITECTURE.md` — qatlamlar, ma'lumot oqimi diagrammasi, SSE holat mashinasi, ovoz holat mashinasi
- [~] 20.3 `docs/API-CONTRACT.md` — ilova ishlatadigan har endpoint: so'rov/javob namunasi (backend `docs/API-GUIDE.md` bilan sinxron)
- [~] 20.4 `docs/DESIGN-TOKENS.md` — §7 jadvallari + artboard → widget mapping
- [ ] 20.5 `docs/PERF.md` — o'lchov natijalari (start, FPS, APK)
- [ ] 20.6 Android release: `key.properties` (repoda yo'q), `proguard`, `--split-per-abi`; Firebase App Distribution / to'g'ridan-to'g'ri APK
- [ ] 20.7 iOS release: TestFlight (Mac mavjud bo'lsa; aks holda §19 yozuv)
- [ ] 20.8 Versiya: `pubspec.yaml` `version: 1.0.0+1`, `CHANGELOG.md` (o'zbekcha)
- [ ] 20.9 Ilova ichida "Ilova haqida": versiya, build, muhit (Profil ostida)

---

## Bajarish tartibi va bog'liqliklar

- **Bosqich 0 → 1 → 2** ketma-ket; ularsiz feature boshlanmaydi. 1 va 2 bir-biriga bog'liq emas — parallel mumkin (fayl egaligi: `app/theme` + `shared/widgets` vs `core/`).
- **Bosqich 3 → 4** — auth va router; keyin hamma feature ochiladi.
- **MVP (TZ 1-bosqich):** 0–6 + 8 (katalog o'qish) + 5 → sotuvchi matn orqali ishlab, hisob ko'ra oladi.
- **TZ 2-bosqich:** 7, 9, 10, 11, 12, 13, 14.
- **TZ 3-bosqich:** 15, 16.
- **TZ 4-bosqich:** 17 (qisman avvalroq — `OfflineBanner` 2-bosqichdan), 18.
- **Bosqich 19** doimiy: har bosqich yakunida qisman tekshiriladi (coverage, analyze, golden).
- Bosqich 5, 8, 9, 11, 12, 13 bir-biriga bog'liq emas — parallel agentlarga **fayl egaligi** bilan beriladi
  (`features/<name>/**` + tegishli `test/**`; `shared/`, `core/`, `app/` ga faqat o'qish; kerak bo'lsa avval alohida commit).
- Bosqich 7 → 6 ga bog'liq (ChatNotifier), 13.4 → 7.3 ga (`QuoteCard`), 9.11 → 8 ga (mahsulot picker), 16 → 6 ga.
- Backend shartnoma noaniq bo'lgan bandlar (14.4, 14.5, 18.4, 18.6) — avval backend `docs/API-GUIDE.md` tekshiriladi;
  endpoint yo'q bo'lsa band `[ ]` qoladi va `rules.md` §19 ga yozuv qo'shiladi. O'ylab topilgan endpoint ishlatilmaydi.
