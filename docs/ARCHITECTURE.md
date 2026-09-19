# Alora Mobil — Arxitektura hujjati (ARCHITECTURE.md)

> Manbalar: `rules.md` (to'liq), `tasks.md` 20.2, `docs/API-CONTRACT.md`, `.github/workflows/ci.yml`.
> O'zbek lotin. Hujjat `rules.md` ga zid kelmasin — ziddiyat bo'lsa `rules.md` ustun.

---

## 1. Umumiy ko'rinish

**Alora** — parda va bezak materiallari sotuvchilari uchun yagona mobil ilova.
Chat orqali mijoz bilan muloqot, AI yordamida mahsulot tanlash, hisob-kitob qilish va buyurtma yaratish — hammasi shu ilovada.

| Xususiyat | Tavsif |
|---|---|
| Platformalar | Android 8+ (API 26), iOS 14+. Telefon **va** planshet |
| Backend | **Faqat Django** (REST API + SSE streaming + WebSocket ovoz) |
| Autentifikatsiya | JWT (SimpleJWT): `access` 15 daq, `refresh` 30 kun; `flutter_secure_storage` |
| Til | O'zbek lotin (asosiy), O'zbek kirill, Rus (ARB, `flutter_localizations`) |

### Backend bilan aloqa usullari

| Protokol | Endpoint / URL | Maqsad |
|---|---|---|
| REST (Dio) | `POST/GET/PATCH/DELETE /api/v1/*` | CRUD, auth, ma'lumot olish |
| SSE (Server-Sent Events) | `POST conversations/{id}/messages/` → `text/event-stream` | Chat xabarlarini streaming qilish |
| WebSocket | `ws(s)://<host>/ws/voice/{conversation_id}/?locale=uz\|ru` | Ovozli rejim (STT + TTS) |

---

## 2. Qatlamlar (Clean Architecture)

Ilova **Feature-first + Clean Architecture** printsipi asosida tuzilgan.
Ma'lumot oqimi faqat **pastga** — `presentation → application → domain → data` yo'nalishida harakatlanadi.

```
┌─────────────────────────────────────────────────────────┐
│                    PRESENTATION                          │
│  Screen, Widget, Button, Chip                           │
│  context.watch<T>() bilan holatni kuzatadi              │
│  ref.read(...) faqat callback'da                        │
│                                                          │
│  ❌ data qatlamini IMPORT QILMAYDI                       │
│  ✅ application (notifier) va domain (entity) import qiladi │
├─────────────────────────────────────────────────────────┤
│                  APPLICATION                             │
│  AsyncNotifier / Notifier / StreamNotifier               │
│  Provider'lar (repository, datasource)                   │
│  Business logic yo'q — faqat state boshqarish            │
│  ref.listen — side-effect (snackbar, navigatsiya)       │
├─────────────────────────────────────────────────────────┤
│                    DOMAIN                                │
│  Entity (freezed, JSON bilmaydi)                         │
│  Abstract Repository (interfeys)                         │
│  UseCase (ixtiyoriy, murakkab mantiq bo'lsa)            │
├─────────────────────────────────────────────────────────┤
│                     DATA                                 │
│  Datasource (RemoteDataSource → Dio, LocalDataSource → Hive) │
│  DTO (freezed + json_serializable, snake_case)           │
│  Mapper (DTO ↔ Entity)                                  │
│  RepositoryImpl (abstract repo'ni amalga oshiradi)       │
└─────────────────────────────────────────────────────────┘
```

**Qoidalari:**
- Widget ichida `Dio` chaqirish — **taqiq**
- Notifier ichida `BuildContext` ishlatish — **taqiq**
- Repository ichida `Widget` import qilish — **taqiq**
- `presentation` → `data` to'g'ridan-to'g'ri import — **taqiq**

---

## 3. Papka tuzilmasi

> rules.md §2 dagi namuna bilan solishtirilgan. Haqiqiy holat:

```
alora-mobile/
├── lib/
│   ├── main.dart                         # ProviderScope, runApp
│   ├── bootstrap.dart                    # Hive init, env, error handlers, Sentry
│   ├── app/
│   │   ├── app.dart                      # MaterialApp.router
│   │   ├── router/
│   │   │   ├── app_router.dart           # GoRouter, ShellRoute, redirect
│   │   │   └── routes.dart              # Yo'l konstantalari (AppRoutes)
│   │   ├── theme/
│   │   │   ├── app_colors.dart           # §7.1 — yorug'/qorong'i palitra
│   │   │   ├── app_typography.dart       # §7.2
│   │   │   ├── app_radius.dart           # §7.3
│   │   │   ├── app_spacing.dart          # §7.3
│   │   │   ├── app_theme.dart            # ThemeData (light/dark)
│   │   │   └── status_colors.dart        # §7.5
│   │   └── l10n/                         # ARB fayllar
│   ├── core/
│   │   ├── network/
│   │   │   ├── dio_client.dart           # Bitta Dio instansi
│   │   │   ├── interceptors/             # auth, refresh, retry, logging, error_mapper
│   │   │   └── api_paths.dart            # Barcha endpoint yo'llari
│   │   ├── sse/
│   │   │   ├── sse_client.dart           # POST → text/event-stream
│   │   │   └── sse_event.dart            # SseEvent sealed
│   │   ├── ws/
│   │   │   └── voice_socket.dart         # WebSocket ovoz kanali
│   │   ├── storage/
│   │   │   ├── secure_storage.dart       # Token'lar (flutter_secure_storage)
│   │   │   ├── hive_boxes.dart           # Box nomlari, adapterlar
│   │   │   └── offline_queue.dart        # Manager tahrirlari navbati
│   │   ├── error/
│   │   │   ├── failure.dart              # Sealed Failure
│   │   │   └── failure_l10n.dart         # Failure → foydalanuvchi matni
│   │   ├── connectivity/                 # Internet holati provider
│   │   ├── dev/                          # Komponentlar kutubxonasi (faqat ENV=dev)
│   │   └── utils/                        # money_format, date_format, phone_format, debounce
│   ├── features/
│   │   ├── auth/                         # S-01: Login, token, profil
│   │   ├── chat/                         # ★ S-02…S-09: Matnli/ovozli AI chat
│   │   ├── conversations/                # S-10: Suhbatlar ro'yxati
│   │   ├── catalog/                      # S-16…S-18: Katalog, mahsulot, filtr
│   │   ├── orders/                       # S-11…S-15: Buyurtmalar CRUD
│   │   ├── management/                   # S-19…S-24: Statistika, xodimlar, narx, bilimlar
│   │   ├── customer_mode/                # S-09: Mijoz rejimi (PIN, katta shrift)
│   │   └── profile/                      # S-25: Profil, til, mavzu
│   └── shared/
│       ├── widgets/                      # AppButton, AppChip, StatusPill… (§7.6)
│       ├── models/                       # Money, Paginated — bir nechta feature ishlatadi
│       ├── extensions/                   # Context extensions
│       └── icons/                        # AppIcons (lucide_icons_flutter)
├── test/                                 # lib/ bilan bir xil tuzilma
│   ├── unit/
│   ├── widget/
│   ├── golden/
│   └── helpers/
├── integration_test/
├── assets/
│   ├── fonts/                            # IBM Plex Sans, Spectral, IBM Plex Mono
│   └── images/
├── docs/                                 # Hujjatlar (shu fayl)
├── plan/                                 # TZ'lar (nusxa yoki symlink)
├── .github/workflows/ci.yml
├── pubspec.yaml
├── analysis_options.yaml
├── build.yaml
├── rules.md
├── tasks.md
└── .env.example
```

### Haqiqiy holat — rules.md bilan solishtirish

| Papka | rules.md | Haqiqiy holat | ✅/❌ |
|---|---|---|---|
| `lib/app/` | bor | bor | ✅ |
| `lib/app/router/` | bor | bor | ✅ |
| `lib/app/theme/` | bor | bor | ✅ |
| `lib/app/l10n/` | bor | bor | ✅ |
| `lib/core/network/` | bor | bor | ✅ |
| `lib/core/network/interceptors/` | bor | bor | ✅ |
| `lib/core/sse/` | bor | bor | ✅ |
| `lib/core/ws/` | bor | bor | ✅ |
| `lib/core/storage/` | bor | bor | ✅ |
| `lib/core/error/` | bor | bor | ✅ |
| `lib/core/connectivity/` | bor | bor | ✅ |
| `lib/core/utils/` | bor | bor | ✅ |
| `lib/core/dev/` | bor | bor | ✅ |
| `lib/features/auth/` | bor | bor | ✅ |
| `lib/features/chat/` | bor | bor | ✅ |
| `lib/features/conversations/` | bor | bor | ✅ |
| `lib/features/catalog/` | bor | bor | ✅ |
| `lib/features/orders/` | bor | bor | ✅ |
| `lib/features/management/` | bor | bor | ✅ |
| `lib/features/customer_mode/` | bor | bor | ✅ |
| `lib/features/profile/` | bor | bor | ✅ |
| `lib/features/voice/` | — (rules §2 da chat ichida nazarda tutilgan) | bor — ovozli rejim alohida feature (application: recorder/vad/player/notifier, presentation: VoicePanel) | ✅ (qo'shimcha) |
| `lib/shared/widgets/` | bor | bor | ✅ |
| `lib/shared/models/` | bor | bor | ✅ |
| `lib/shared/extensions/` | bor | bor | ✅ |
| `lib/shared/icons/` | — (rules'da ko'rsatilmagan) | bor | ✅ (qo'shimcha) |

### Feature ichidagi tartib (majburiy)

```
features/<feature>/
├── data/
│   ├── datasources/     # <feature>_remote_ds.dart, <feature>_local_ds.dart
│   ├── dto/             # API JSON ↔ DTO (freezed + json_serializable)
│   ├── mappers/         # DTO ↔ domain entity
│   └── repositories/    # <Feature>RepositoryImpl
├── domain/
│   ├── entities/        # freezed, JSON bilmaydi
│   ├── repositories/    # abstract <Feature>Repository
│   └── usecases/        # ixtiyoriy
├── application/
│   ├── providers.dart   # repository/datasource providerlari
│   └── <name>_notifier.dart  # AsyncNotifier / Notifier
└── presentation/
    ├── screens/
    └── widgets/
```

---

## 4. State management (Riverpod)

### Asosiy qoidalar

| Qoida | Tavsif |
|---|---|
| Faqat Riverpod 2 + `riverpod_generator` | `StateProvider`, `ChangeNotifier`, global `setState` — **taqiq** |
| Async ma'lumot | `AsyncNotifier` / `AsyncValue`; `.when(data, loading, error)` majburiy |
| Chat oqimi | `ChatNotifier extends Notifier<ChatState>`; immutable `copyWith` |
| Streaming throttle | 50 ms bufer → bitta state yangilanishi (har chunk'da rebuild — taqiq) |
| Side-effect | `ref.listen` (snackbar, navigatsiya); `build()` ichida navigatsiya — taqiq |

### Provider turlari

| Provider turi | Qayerda ishlatiladi |
|---|---|
| `@riverpod` (autoDispose default) | Ko'pchilik provider'lar (suhbatlar, katalog, buyurtmalar) |
| `@riverpod(keepAlive: true)` | Auth, connectivity, theme, locale, customerMode |
| `family` | ChatNotifier (by conversationId), OrderDetailNotifier (by orderId) |

### keepAlive ro'yxati (uzun umrli providerlar)

| Provider | Sabab |
|---|---|
| `AuthNotifier` | Token holati butun ilova davomida kerak |
| `ConnectivityNotifier` | Internet holati global |
| `ThemeNotifier` | Mavzu rejimi butun ilovada |
| `LocaleNotifier` | Til tanlovi butun ilovada |
| `CustomerModeNotifier` | Mijoz rejimi saqlanib qoladi |
| `errorReporterProvider` | Sentry/Noop hisobot qatlami (breadcrumb, user id/rol) |
| `dioProvider` | Bitta Dio instansi, interceptorlar bilan |

### ChatNotifier throttle mexanizmi

```
SSE event keladi (content / tool_call / tool_result / done / error)
        │
        ▼
┌───────────────────────────────────────────┐
│ base = _pendingState ?? state              │  ← eng so'nggi (hali commit qilinmagan)
│ yangi holat = base asosida hisoblanadi     │    holatdan davom etadi — bo'lak yo'qolmaydi
│ _pendingState = yangi holat                │
└─────────┬─────────────────────────────────┘
          │ 50 ms Timer (faqat bittasi faol)
          ▼
┌─────────────────────┐
│ state = _pendingState│  (≤ 20 rebuild/s)
│ _pendingState = null │
└─────────────────────┘

Sinxron yozuvlar (yangi xabar, retryLast, cancelStream, reset) → `_commitNow`:
timer bekor qilinadi, bufer tozalanadi, state darhol yoziladi (eski bufer ustidan yozmaydi).
```

Regression testlar: `test/unit/features/chat/chat_notifier_test.dart` — 100 chunk → ≤3 commit **va** to'liq matn;
bir microtask'dagi burst; SSE `error` → `state.error` + `isStreaming=false`.

---

## 5. Navigatsiya (GoRouter)

### Route daraxti

```
GoRouter
├── /login                          ← token yo'qda
├── /forbidden                      ← 403 ekrani
└── StatefulShellRoute.indexedStack ← asosiy shell (tab bar)
    ├── /chat                       ← suhbatlar + chat
    │   └── /chat/:conversationId   ← deep-link
    ├── /orders                     ← buyurtmalar ro'yxati
    │   └── /orders/:orderId        ← deep-link
    ├── /catalog                    ← katalog grid
    │   └── /catalog/products/:id   ← mahsulot sahifasi
    ├── /management                 ← boshqaruv (faqat manager/admin)
    │   ├── /management/stats
    │   ├── /management/employees
    │   ├── /management/products
    │   ├── /management/pricing
    │   ├── /management/knowledge
    │   └── /management/settings    ← faqat admin
    └── /profile                    ← profil
```

### Redirect qoidalari

| Rol × Yo'l | Natija |
|---|---|
| Token yo'q → qaysi yo'l bo'lsa | `/login` ga qaytariladi |
| Token bor + `/login` da | `/chat` ga o'tkaziladi |
| `employee` → `/management/**` | `/forbidden` ga qaytariladi |
| Mijoz rejimi yoqilgan → `/chat/:id` dan tashqari | `/chat/:id` ga qaytariladi |
| Mijoz rejimi → `/login`, `/orders`, `/catalog` | `/chat/:id` ga qaytariladi |

### Mijoz rejimi qulfi

Mijoz rejimi yoqilganda:
- Faqat `/chat/:id` ruxsat
- Boshqa hamma yo'l → chatga qaytariladi
- Tab bar yashiriladi
- AppBar menyusi yashiriladi
- Android orqaga tugmasi bloklanadi (`PopScope`)

### Planshet landshaft

`width ≥ 840`: `/chat` ikki panelli layout (`LayoutBuilder`):
- Chap: suhbatlar ro'yxati (`ConversationsPane`, 320px)
- O'ng: chat
- Boshqa ekranlar: `maxWidth 720` markazda

---

## 6. Ma'lumot oqimi ketma-ketlik diagrammalari

### 6.1 Login → Token → Me

```
LoginScreen          AuthRemoteDS       SecureStorage        AuthNotifier
    │                      │                   │                   │
    │ 1. phone+password    │                   │                   │
    │─────────────────────>│                   │                   │
    │                      │ 2. POST /login/   │                   │
    │                      │──────────────────>│                   │
    │                      │ 3. {access,refresh}│                  │
    │                      │<──────────────────│                   │
    │                      │                   │                   │
    │                      │ 4. access+refresh saqlash            │
    │                      │──────────────────>│                   │
    │                      │                   │                   │
    │                      │ 5. GET /auth/me/  │                   │
    │                      │──────────────────>│                   │
    │                      │ 6. User profile   │                   │
    │                      │<──────────────────│                   │
    │                      │                   │                   │
    │                      │ 7. state = AuthState.authenticated(user)
    │                      │──────────────────────────────────────>│
    │  8. /chat ga o'tish  │                   │                   │
    │<──────────────────────────────────────────────────────────── │
```

### 6.2 401 → Refresh Mutex → Qayta so'rov

```
Ixtiyoriy so'rov (Dio)
    │
    ▼
┌──────────────────┐
│ 401 javob keldi  │
└────────┬─────────┘
         │
         ▼
┌──────────────────┐     ┌─────────────────┐
│ Mutex: lock olish│────>│ Boshqa so'rovlar │
│ (faqat bitta     │     │ navbatda kutadi  │
│  refresh)        │     └─────────────────┘
└────────┬─────────┘
         │
         ▼
┌──────────────────┐
│ POST /auth/      │
│ refresh/         │
└────────┬─────────┘
         │
    ┌────┴────┐
    │ Muvaffaq │      │ Xato (401) │
    ▼          │      ▼            │
┌────────┐    │  ┌──────────┐    │
│ Yangi   │    │  │ Token    │    │
│ token   │    │  │ tozalanadi│    │
│ saqlash  │    │  │ /login'ga│    │
└────┬───┘    │  └──────────┘    │
     │        │                  │
     ▼        │                  │
┌─────────────┐                  │
│ Asl so'rov  │                  │
│ qayta       │                  │
│ yuboriladi  │                  │
└─────────────┘                  │
```

### 6.3 Chat xabar → SSE → ChatState yangilanishi

```
Sotuvchi xabar yozadi     ChatRemoteDS          SseClient          ChatNotifier
    │                        │                     │                    │
    │ 1. sendMessage(content)│                     │                    │
    │───────────────────────>│                     │                    │
    │                        │ 2. POST messages/   │                    │
    │                        │    (stream)         │                    │
    │                        │────────────────────>│                    │
    │                        │                     │                    │
    │                        │ 3. SSE event: start │                    │
    │                        │<────────────────────│                    │
    │                        │                     │                    │
    │                        │ 4. SSE event:       │                    │
    │                        │    content × N      │                    │
    │                        │<────────────────────│                    │
    │                        │                     │                    │
    │                        │ 5. SSE event: done  │                    │
    │                        │<────────────────────│                    │
    │                        │                     │                    │
    │                        │ 6. ChatState yangilanadi (copyWith)     │
    │                        │─────────────────────────────────────────>│
    │                        │                     │                    │
    │  7. UI qayta chiziladi │                     │                    │
    │<─────────────────────────────────────────────────────────────────│
```

### 6.4 Manager oflayn tahrir → OfflineQueue → Flush

```
Manager PATCH qiladi       OfflineQueue (Hive)      ConnectivityNotifier
    │                          │                         │
    │ 1. Internet yo'q         │                         │
    │─────────────────────────>│                         │
    │                          │ 2. Queue'ga qo'shadi    │
    │                          │    {method,path,body,   │
    │                          │     createdAt,attempts} │
    │  3. snackbar "Saqlanadi" │                         │
    │<─────────────────────────│                         │
    │                          │                         │
    │  ... Internet qaytdi ... │                         │
    │                          │                         │
    │                          │ 4. isOnline = true      │
    │                          │<────────────────────────│
    │                          │                         │
    │                          │ 5. flush() — FIFO       │
    │                          │    yuboradi              │
    │                          │                         │
    │  6. Muvaffaq: o'chiriladi│                         │
    │  7. Konflikt (409/400):  │                         │
    │     server yutadi,       │                         │
    │     snackbar "Saqlanmadi"│                         │
    │<─────────────────────────│                         │
```

---

## 7. SSE holat mashinasi

### Voqealar va holat o'tishlari

```
                    ┌──────────┐
         boshlang'ich holat   │
                    │  idle   │
                    └────┬─────┘
                         │ user xabar yubordi
                         ▼
                    ┌──────────┐
                    │streaming │◄──── content, thinking, tool_call,
                    │          │      tool_result kelmoqda
                    └────┬─────┘
                         │
              ┌──────────┼──────────┐
              ▼          ▼          ▼
         ┌────────┐ ┌────────┐ ┌────────┐
         │  done  │ │ error  │ │uzildi  │
         │ (tugadi)│ │(xato)  │ │(tarmoq)│
         └────┬───┘ └───┬────┘ └───┬────┘
              │         │          │
              ▼         ▼          ▼
         ┌────────┐ ┌────────┐ ┌────────┐
         │  idle  │ │retrying│ │retrying│
         │        │ │        │ │        │
         └────────┘ └────┬───┘ └───┬────┘
                         │         │
                    3 marta qayta urinish
                    (1s, 2s, 4s exponential)
                         │
                    ┌────┴────┐
                    ▼         ▼
              Muvaffaq   Muvaffaq bo'lmadi
              → idle     → idle (qisman matn saqlanadi)
```

### SSE event → ChatState ta'siri

| SSE event | ChatState o'zgarishi |
|---|---|
| `start` | Yangi bo'sh `AssistantMessage` qo'shiladi, `isStreaming = true` |
| `thinking` | `ThinkingBlock` qo'shiladi (yig'iladigan) |
| `content` | Oxirgi `AssistantMessage.content` ga qo'shiladi (50 ms throttle) |
| `tool_call(tool)` | `ToolChip(spinner)` qo'shiladi |
| `tool_args(tool, args)` | Argumentlar chip'ga yoziladi |
| `tool_result(tool, result)` | Chip → ✅ + natija; natija `RichBlock` ga parse qilinadi |
| `done(usage, products)` | `isStreaming = false`, `usage` saqlanadi, `products` bo'lsa `ProductCarousel` |
| `error(detail)` | `error = detail`, qizil banner + "Qayta urinish" |
| `unknown` | E'tibor berilmaydi (oldinga moslik) |

---

## 8. Ovoz holat mashinasi

> rules.md §8.6, tasks.md §15.5.

```
         ┌──────────┐
         │   idle   │
         └────┬─────┘
              │ mikrofon tugmasi bosildi
              ▼
         ┌──────────────┐
         │  listening   │◄──── barge-in (VAD gap sezsa)
         │  (yozmoqda)  │      just_audio.stop() +
         └──────┬───────┘      {"kind":"end"} yuboriladi
                │
                │ VAD sukut sezdi (1.2s)
                ▼
         ┌──────────────┐
         │ transcribing │
         │ (STT kutilmoqda)│
         └──────┬───────┘
                │ transcript kelgan
                ▼
         ┌──────────────┐
         │  speaking    │◄──── audio chunk'lar kelmoqda
         │ (AI gapirmoqda)│    just_audio ijro etmoqda
         └──────┬───────┘
                │
                │ "done" yoki barge-in
                └──────────────────────► idle yoki listening
```

### Lifecycle hodisalari

| Hodisa | Natija |
|---|---|
| `WidgetsBindingObserver.paused` | Yozish to'xtaydi, socket yopiladi, sessiya saqlanadi |
| `audio_session` interruption (qo'ng'iroq) | Audio to'xtaydi, socket yopiladi |
| Barge-in (VAD gap boshlandi) | `just_audio.stop()` lokal + `{"kind":"end"}` yuboriladi → yangi `listening` |
| `mute` rejimi | Faqat matnda ko'rsatiladi, audio ijro qilinmaydi |

### Audio bo'laklar

| Yo'nalish | Format |
|---|---|
| Mijoz → Server | binary frame: PCM16/Opus 16 kHz mono, 200 ms |
| Server → Mijoz | binary frame: audio chunk'lar (`just_audio` StreamAudioSource) |

---

## 9. Xato boshqaruvi

### HTTP → Failure → UI jadvali

| HTTP / holat | `Failure` turi | UI ko'rinishi |
|---|---|---|
| Ulanish yo'q, timeout | `NetworkFailure` | `OfflineBanner` yoki `ErrorState(onRetry)` |
| 400 + `validation_error` | `ValidationFailure(fieldErrors)` | Maydon ostida `errorText` |
| 401 (refresh'dan keyin ham) | `AuthFailure` | `/login` ga yo'naltirish |
| 403 | `PermissionFailure` | "Ruxsat yo'q" ekrani |
| 404 | `NotFoundFailure` | "Topilmadi" |
| 429 + `throttled` yoki limit | `LimitFailure(message)` | `LimitExceededView` |
| 503 "AI xizmati vaqtincha ishlamayapti" | `ServiceUnavailableFailure` | Banner + qayta urinish |
| Boshqa 5xx | `ServerFailure` | "Server javob bermadi" + qayta urinish |

### Kuzatuv (Sentry) — `core/error/error_reporter.dart`

- `ErrorMapperInterceptor(onFailure:)` → har `Failure` breadcrumb (category `failure`, faqat tur nomi va daraja; telefon/detail yo'q).
- `reportFailure(ref, failure)` — breadcrumb + `server`/`serviceUnavailable`/`unknown` uchun `captureException`.
- `AuthNotifier` → `setUser(id, role)` / `clearUser()`; `sendDefaultPii = false`, `beforeSend` PII tozalaydi.
- Dev/test — `NoopErrorReporter` (`Env.isProd && dsn` bo'lmasa).

### Backend xato formati

```json
{
  "detail": "Ma'lumotlar noto'g'ri",
  "code": "validation_error",
  "errors": { "price": "0 dan katta bo'lishi kerak" }
}
```

**Qoida:** Foydalanuvchiga **hech qachon** xom `DioException` yoki stack trace ko'rsatilmaydi.
Backend `detail` matni o'zbekcha — shu ko'rsatiladi.

---

## 10. Oflayn strategiya

### Hive box'lar

| Box nomi | Maqsad | TTL |
|---|---|---|
| `auth_prefs` | Mavzu, til, mijoz rejimi holati | Doimiy |
| `catalog_products` | Mahsulotlar keshi | 24 soat |
| `catalog_categories` | Kategoriyalar keshi | 24 soat |
| `conversations` | Oxirgi 20 suhbat | — |
| `messages` | Har suhbatning oxirgi 50 xabari | — |
| `offline_queue` | Manager tahrirlari navbati | — |
| `settings` | Tizim sozlamalari | — |

Barcha box'lar `HiveBoxes.open<T>()` orqali **AES-256 shifrlangan** holda ochiladi — kalit
`SecureStorage.getOrCreateCacheKey()` (Keystore/Keychain), `bootstrap` da `HiveBoxes.configureCipher`.
`HiveBoxes.init()` sxema versiyasini tekshiradi (`schemaVersion` o'zgarsa box'lar o'chiriladi);
`HiveBoxes.clearUserData()` logout'da `auth_prefs`, `conversations`, `messages`, `offline_queue` ni tozalaydi.

### Stale-while-revalidate strategiya

```
Foydalanuvchi katalogni ochdi
        │
        ▼
┌──────────────────┐
│ 1. Keshdan o'qish │
│    (darhol)       │
└────────┬─────────┘
         │
         ▼
┌──────────────────┐
│ 2. Fonida tarmoq │
│    so'rov yuborish│
└────────┬─────────┘
         │
    ┌────┴────┐
    │ Farq bor │      │ Farq yo'q │
    ▼          │      ▼            │
┌────────┐    │  ┌──────────┐    │
│ Jimgina│    │  │ Hech narsa│    │
│ almasht│    │  │ o'zgarmaydi│   │
└────────┘    │  └──────────┘    │
```

### Oflayn holatlar jadvali

| Holat | Ilova xatti-harakati |
|---|---|
| Internet yo'q | `OfflineBanner`, chat input disabled; suhbatlar, oxirgi xabarlar va katalog **Hive keshidan** |
| Chat oqimi uzildi | Qisman javob saqlanadi + "Davom ettirish / Qayta yuborish" |
| Manager oflayn tahriri | `OfflineQueue` (Hive) → internet qaytganda FIFO yuborish; 409/400 → server yutadi |
| Token muddati tugadi | Interceptor jimgina refresh; 30 kunlik refresh yo'q → login |
| Limit tugadi (429) | `LimitExceededView`, chat disabled, `auth/me/` qayta so'raladi |
| AI xizmati yo'q (503) | Banner + qayta urinish |

> Har box'da `schemaVersion`; versiya o'zgarsa box tozalanadi (migratsiya yo'q — kesh vaqtinchalik ma'lumot).

---

## 11. Dizayn tizimi (qisqacha)

> To'liq ma'lumot: `rules.md` §7, `docs/DESIGN-TOKENS.md`.

| Token guruhi | Fayl | Asosiy qiymatlar |
|---|---|---|
| Ranglar | `AppColors` | accent `#0E5751`, brass `#8A6620`, danger `#A6483C`; yorug'/qorong'i ikki palitra |
| Tipografika | `AppTypography` | IBM Plex Sans (body), Spectral (display), IBM Plex Mono (raqamlar) |
| Radius | `AppRadius` | pill 999, card 16, input 12, bubble `20/20/8/20` |
| Bo'shliq | `AppSpacing` | xs 4, s 8, m 12, l 16, xl 24, xxl 32 |
| Status ranglari | `StatusColors` | 8 buyurtma statusi + 3 to'lov belgisi |
| Widget'lar | `shared/widgets/` | AppButton, AppChip, ToolChip, StatusPill, QuoteCard, ProductCard… |

**Muhim qoidalar:**
- `Color(0xFF...)` yoki `TextStyle(fontSize: ...)` widget ichida **to'g'ridan-to'g'ri yozish taqiq** — faqat token klasslari orqali
- `ColorScheme.fromSeed` — **taqiq**
- Material `Icons.*` (filled) — **taqiq**; `lucide_icons_flutter` ishlatiladi
- Gradient, neon, emoji — **taqiq**

---

## 12. Sifat darvozalari

### Lint va format

```bash
dart format --set-exit-if-changed lib test   # line-length 100
dart analyze --fatal-infos                     # 0 warning, 0 info
```

Qo'shimcha qoidalar (`analysis_options.yaml`):
- `always_declare_return_types`
- `prefer_final_locals`
- `avoid_print` (logger ishlatiladi)
- `unawaited_futures`
- `require_trailing_commas`
- `prefer_const_constructors`
- `use_key_in_widget_constructors`
- `avoid_dynamic_calls`
- `strict-casts: true`, `strict-raw-types: true`
- `riverpod_lint` + `custom_lint`

### Testlar

| Tur | Chegaralash | Majburiy obyektlar |
|---|---|---|
| Unit | ≥ 90% | `core/sse`, `core/network/interceptors`, `core/utils`, `features/chat/application` |
| Widget | Har `shared/widgets` komponenti | Barcha holatlar (normal, fokus, xato, disabled) |
| Golden | S-01, S-03, S-05, S-06, S-11, S-12 | Yorug' **va** qorong'i; S-03, S-06 planshet |
| Integration | Login → chat → SSE → hisob → buyurtma | Mock server bilan |
| Coverage umumiy | ≥ 70% | CI'da tekshiriladi |

### CI qadamlari (`.github/workflows/ci.yml`)

```yaml
1. flutter pub get
2. dart run build_runner build --delete-conflicting-outputs
3. flutter gen-l10n  →  l10n-errors.txt bo'sh ({}) bo'lishi shart (tarjima qilinmagan kalit = xato)
4. dart format --set-exit-if-changed lib test
5. dart analyze --fatal-infos
6. dart run custom_lint
7. flutter test --coverage --concurrency=2 test/unit test/widget test/golden test/integration
8. Coverage gate: ≥ 70% (lcov; *.g.dart, *.freezed.dart, l10n chiqarib tashlanadi)
9. flutter build apk --release --split-per-abi (arm64, env/prod.json + tool/version_defines.sh)
10. APK ≤ 40 MB (fayl hajmi; `--analyze-size` Flutter 3.47.4 da integration_test plagini bilan xato beradi)
```

**Integration testlar qurilmasiz:** `integration_test/*.dart` (IntegrationTestWidgetsFlutterBinding, fake repo/SSE/Hive)
`test/integration/*_host_test.dart` o'ramlari orqali `flutter_tester` da yuradi — emulator kerak emas.

### Qo'shimcha sifat chegaralari

| Ko'rsatkich | Chegara |
|---|---|
| Sovuq ishga tushish | ≤ 2 s |
| Chat scroll | 60 FPS, 100+ xabar |
| Streaming rebuild | ≤ 20/s (50 ms throttle) |
| APK hajmi | ≤ 40 MB (arm64 split) |
| Ovoz javob | ≤ 3 s ichida eshitila boshlaydi |
| Fayl hajmi | ≤ 400 qator |
| Widget build() | ≤ 80 qator (keyin klasslarga bo'linadi) |

---

## 13. Ochiq masalalar

> `rules.md` §8.6, `docs/API-CONTRACT.md` §14 dan olingan.

| # | Masala | Holat | Ta'sir |
|---|---|---|---|
| 1 | **WS JWT auth** — backend `AuthMiddlewareStack` (session) ishlatadi, JWT'ni WS'da qabul qilmaydi | ❌ Backend'da JWT middleware yo'q | Ovozli rejim ishlamaydi (1008 bilan yopiladi); ilova `?token=` variantiga tayyor |
| 2 | **LLM sozlamalari** (provider, model, temperature) — backend'da endpoint yo'q | ❌ Yo'q | Admin LLM sozlamalarini boshqara olmaydi |
| 3 | **Ovoz sozlamalari** (TTS provider, STT provider, til) — backend'da endpoint yo'q | ❌ Yo'q | Admin ovoz sozlamalarini boshqara olmaydi |
| 4 | **Push token yuborish** (`device_id` mavjud, lekin token yangilash endpointi yo'q) | ❌ Yo'q | Push bildirishnomalar ishlamaydi |
| 5 | **Chatga rasm yuborish** — `POST messages/` faqat `content` (string) qabul qiladi | ❌ Yo'q | Rasm biriktirish 4-bosqichda rejalashtirilgan, hozircha bloklangan |
| 6 | **Oflayn queue sync** — backend'da alohida sync endpointi yo'q | ❌ Yo'q | Oddiy CRUD orqali ishlaydi; konflikt → server yutadi |

---

## Oxirgi hisobot

| Mezon | Natija |
|---|---|
| **Fayl hajmi** | ~750 qator |
| **Asoslandi** | `rules.md` §0–§19 (to'liq), `tasks.md` 20.2, `docs/API-CONTRACT.md` §14, `.github/workflows/ci.yml` |
| **Haqiqiy papkalar** | 26 ta papka `find` bilan tekshirildi, hammasi mavjud (§3 jadvalida ✅) |
| **Qatlamlar** | §2 — Clean Architecture, presentation → application → domain → data |
| **Ma'lumot oqimi** | §6 — 4 ta ASCII sequence diagram (login, refresh, chat SSE, oflayn queue) |
| **SSE holat mashinasi** | §7 — idle → streaming → done/error/retrying → idle |
| **Ovoz holat mashinasi** | §8 — idle → listening → transcribing → speaking → idle |
| **Xato boshqaruvi** | §9 — HTTP → Failure → UI jadvali |
| **Oflayn strategiya** | §10 — Hive box'lar, TTL, stale-while-revalidate |
| **Dizayn tizimi** | §11 — `docs/DESIGN-TOKENS.md` ga havola |
| **Sifat darvozalari** | §12 — lint/analyze/test/coverage/golden; CI qadamlari |
| **Ochiq masalalar** | §13 — 6 ta backend'da yo'q endpoint (API-CONTRACT.md §14 dan) |

**Yangilandi (2026-09-19):** voice feature, throttle semantikasi (`_pendingState`/`_commitNow`), Sentry qatlami,
CI qadamlari (custom_lint, tarjima, integration host o'ramlari, APK gate) haqiqiy kodga moslandi.

**Tayyorlandi:** `rules.md` (790 qator), `tasks.md` (369 qator), `docs/API-CONTRACT.md` (1392 qator),
`docs/DESIGN-TOKENS.md` (259 qator), `.github/workflows/ci.yml`, `find lib -type d`.
