# Alora Mobile — Ishlab chiqish qoidalari (rules.md)

> Bu hujjat `plan/03-MOBILE-TZ.md`, `plan/04-MOBILE-DESIGN-TZ.md`, `plan/00-ALORA-UMUMIY-TZ.md`
> va Claude Design'dagi tasdiqlangan dizayn (`docs/design/Alora-Mobil.dc.html`) asosida yozilgan
> va **majburiy** hisoblanadi. Kod yozayotgan har bir dasturchi (yoki AI agent) ishni boshlashdan
> oldin shu faylni **to'liq** o'qiydi va undan chetga chiqmaydi.
> Qoida bilan TZ ziddiyatga tushsa — TZ ustun, ammo o'zgarish shu faylga ham kiritiladi (§19).

**Stack:** Flutter 3.47.x (stable) · Dart 3.13.x · Riverpod 2 (`riverpod_generator`) · GoRouter · Dio ·
`freezed` + `json_serializable` · Hive (kesh, oflayn navbat) · `flutter_secure_storage` · `record` + `just_audio` ·
`web_socket_channel` · `fl_chart` · `cached_network_image` · `flutter_localizations` (ARB)

**Platformalar:** Android 8+ (API 26), iOS 14+. Telefon **va** planshet.

**Manbalar (o'qish tartibi):**
1. `rules.md` (shu fayl) — har sessiya boshida
2. `tasks.md` — qaysi ish qilinishi kerak
3. `plan/03-MOBILE-TZ.md` — funksional talab
4. `plan/04-MOBILE-DESIGN-TZ.md` + `docs/design/Alora-Mobil.dc.html` — vizual talab
5. `plan/01-BACKEND-TZ.md` §5–6 va backend'ning `docs/API-GUIDE.md` — API shartnoma

---

## 0. QAT'IY QONUN (buzilishi mumkin emas)

> Bu bo'lim boshqa hamma narsadan ustun. Quyidagi qoidalarni buzgan kod
> **qabul qilinmaydi** — review'dan o'tmaydi, merge qilinmaydi, commit qilinmadi.

1. **`rules.md` dan chiqib ketish qat'iyan taqiqlanadi.** Bu hujjatda belgilangan arxitektura,
   papka tuzilmasi, nomlash, qatlamlar, dizayn tokenlari va texnologiya tanlovidan chetga chiqish —
   hech qanday bahona bilan ruxsat etilmaydi. "Tezroq bo'lardi", "vaqtinchalik", "keyin tuzataman" —
   qabul qilinmaydigan sabablar.

2. **Har bir agent ishni `rules.md` ni o'qishdan boshlaydi.** O'qimasdan yozilgan kod — xato
   hisoblanadi. Agent o'z hisobotida qaysi bo'limlarga tayanganini ko'rsatadi.

3. **TZ doirasidan chiqish taqiqlanadi.** `plan/03-MOBILE-TZ.md` da bo'lmagan ekran, funksiya yoki
   sozlama o'ylab topilmaydi. TZ'da bor narsa esa qisqartirilmaydi. Kamchilik topilsa — kod
   yozilmaydi, avval savol beriladi.

4. **Dizayndan chiqish taqiqlanadi.** Rang, shrift, radius, o'lcham, bo'shliq — faqat §7 dagi
   tokenlardan. `Color(0xFF...)`, `TextStyle(fontSize: ...)`, `BorderRadius.circular(...)` ni
   widget ichida **to'g'ridan-to'g'ri yozish taqiq**. Faqat `AppColors`, `AppTypography`,
   `AppRadius`, `AppSpacing` orqali.

5. **Qatlamlar buzilmaydi.** Ma'lumot oqimi faqat
   `presentation → application (notifier/controller) → domain → data (repository → datasource)`
   yo'nalishida. Widget ichida `Dio` chaqirish, notifier ichida `BuildContext` ishlatish,
   repository ichida `Widget` import qilish — taqiq.

6. **Yangi paket qo'shish — faqat §17 ro'yxatidan.** Ro'yxatda yo'q paket kerak bo'lsa: avval
   §19 ga chetlanish yoziladi, foydalanuvchi tasdiqlaydi, keyin `pubspec.yaml` o'zgaradi.

7. **Test o'tmagan ish "bajarildi" deb belgilanmaydi** va commit qilinmaydi (§16).

8. **Narx va hisob mobil ilovada hisoblanmaydi.** Ilova faqat backend/AI bergan raqamni
   ko'rsatadi. `price * coef` kabi biznes-formulani Dart'da yozish — taqiq. Yagona istisno:
   ko'rsatish uchun yig'indi (masalan kartochka ichida qatorlarni jamlash) — u ham
   backend `total` bilan mos kelishi testda tekshiriladi.

9. **Ziddiyat bo'lsa tartib shunday:** `03-MOBILE-TZ.md` (funksiya) > `04-MOBILE-DESIGN-TZ.md` va
   dizayn fayli (ko'rinish) > `rules.md` > shaxsiy fikr. Dizayn faylidagi *ma'lumot* (masalan
   `so'm/m`) bilan TZ'dagi ma'lumot (`so'm/m²`) farq qilsa — **TZ ustun**, dizayn faqat
   ko'rinish uchun.

**Chetga chiqish qanday rasmiylashtiriladi:** o'zgarish sababi, ta'sir doirasi va muqobil
variantlar yozilib, §19 jurnaliga kiritiladi va alohida commit qilinadi.
Yozilmagan chetga chiqish — mavjud emas, ya'ni xato hisoblanadi.

---

## 1. Umumiy tamoyillar

1. **Ilova — yagona mijoz (client).** Chat ham, boshqaruv paneli ham shu ilovada. Alohida web yo'q.
2. **Backend — haqiqat manbai.** Mahsulot, narx, koeffitsient, status ro'yxati — hammasi API'dan.
   Ilovada `enum` sifatida faqat *ko'rinish* uchun kerak bo'lgan qiymatlar saqlanadi
   (status rangi, rol nomi), ular API bilan mos kelishi testda tekshiriladi.
3. **Ilova faqat Django bilan gaplashadi.** Go, gRPC, LLM haqida kodda hech narsa yo'q.
4. **Ommaviy do'kon yo'q.** Ro'yxatdan o'tish ekrani yo'q, "parolni tiklash" oqimi yo'q
   (faqat "Manager bilan bog'laning" matni).
5. **Sotuvchi bir qo'lda ishlaydi.** Asosiy amallar ekranning pastki yarmida, bosiladigan
   maydon ≥ 48 dp. Yozishdan ko'ra bosish (chip, tugma) afzal.
6. **Mijoz ekranni ko'radi.** Ichki jargon (`token`, `SSE`, `tool`, `prompt`) UI matnida
   ko'rinmaydi. Xodim uchun "token" o'rniga "sarf".
7. **Ishlamayotgan narsa "bajarildi" deb belgilanmaydi.**

---

## 2. Loyiha tuzilmasi

Feature-first + Clean Architecture. Har feature o'z ichida `data / domain / application / presentation`.

```
alora-mobile/
├── lib/
│   ├── main.dart                     # faqat bootstrap: ProviderScope, runApp
│   ├── bootstrap.dart                # Hive init, env, error handlers, Sentry
│   ├── app/
│   │   ├── app.dart                  # MaterialApp.router
│   │   ├── router/
│   │   │   ├── app_router.dart       # GoRouter, ShellRoute (tab bar), redirect
│   │   │   └── routes.dart           # yo'l konstantalari (AppRoutes)
│   │   ├── theme/
│   │   │   ├── app_colors.dart       # §7.1 — yorug'/qorong'i palitra
│   │   │   ├── app_typography.dart   # §7.2
│   │   │   ├── app_radius.dart       # §7.3
│   │   │   ├── app_spacing.dart      # §7.3
│   │   │   ├── app_theme.dart        # ThemeData (light/dark), ThemeExtension
│   │   │   └── status_colors.dart    # §7.5 — buyurtma status ranglari
│   │   └── l10n/                     # ARB: app_uz.arb (lotin), app_uz_Cyrl.arb, app_ru.arb
│   ├── core/
│   │   ├── network/
│   │   │   ├── dio_client.dart       # bitta Dio instansi, base URL env'dan
│   │   │   ├── interceptors/         # auth, refresh, retry, logging, error_mapper
│   │   │   └── api_paths.dart        # BARCHA endpoint yo'llari shu yerda (§8.1)
│   │   ├── sse/
│   │   │   ├── sse_client.dart       # POST → text/event-stream, frame parser
│   │   │   └── sse_event.dart        # kind, content, tool, args, result, usage, products
│   │   ├── ws/
│   │   │   └── voice_socket.dart     # WebSocket ovoz kanali
│   │   ├── storage/
│   │   │   ├── secure_storage.dart   # token'lar (flutter_secure_storage)
│   │   │   ├── hive_boxes.dart       # box nomlari, adapterlar ro'yxatdan o'tishi
│   │   │   └── offline_queue.dart    # manager tahrirlari navbati
│   │   ├── error/
│   │   │   ├── failure.dart          # sealed Failure (network, auth, validation, limit, server)
│   │   │   └── failure_l10n.dart     # Failure → foydalanuvchi matni
│   │   ├── connectivity/             # internet holati provider
│   │   └── utils/                    # money_format, date_format, phone_format, debounce
│   ├── features/
│   │   ├── auth/
│   │   ├── chat/                     # ★ eng katta feature
│   │   ├── conversations/
│   │   ├── catalog/
│   │   ├── orders/
│   │   ├── management/               # stats, employees, products CRUD, pricing, knowledge, settings
│   │   ├── customer_mode/            # mijoz rejimi (PIN, katta shrift)
│   │   └── profile/
│   └── shared/
│       ├── widgets/                  # §7.6 komponentlar (AppButton, AppChip, StatusPill...)
│       ├── models/                   # bir nechta feature ishlatadigan modellar (Money, Paginated)
│       └── extensions/
├── test/                             # lib/ bilan bir xil papka tuzilmasi
│   ├── unit/
│   ├── widget/
│   ├── golden/
│   └── helpers/                      # fake repo, pump helpers, fixtures
├── integration_test/
├── assets/
│   ├── fonts/                        # IBM Plex Sans, Spectral (§7.2)
│   └── images/
├── docs/
│   └── design/Alora-Mobil.dc.html    # Claude Design'dan eksport, o'zgartirilmaydi
├── plan/                             # TZ'lar (o'qish uchun nusxa yoki symlink)
├── rules.md
├── tasks.md
├── pubspec.yaml
├── analysis_options.yaml
├── build.yaml
└── .env.example
```

**Feature ichidagi tartib (majburiy):**

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
│   └── usecases/        # ixtiyoriy; murakkab mantiq bo'lsa
├── application/
│   ├── providers.dart   # repository/datasource providerlari
│   └── <name>_notifier.dart  # AsyncNotifier / Notifier / StreamNotifier
└── presentation/
    ├── screens/         # <name>_screen.dart
    └── widgets/         # faqat shu feature'ga tegishli widgetlar
```

**Qoidalar:**
- Ekran fayli 300 qatordan oshsa — widgetlarga bo'linadi.
- Widget ichida `ref.read(...)` faqat callback'da; `build()` ichida `ref.watch(...)`.
- `presentation` `data` qatlamini **import qilmaydi**. Faqat `application` va `domain`.
- Fayl nomi `snake_case`, klass `PascalCase`, provider `camelCase` + `Provider` suffiksi.

---

## 3. State management (Riverpod)

1. Faqat Riverpod 2 + `riverpod_generator` (`@riverpod`). `StateProvider`, `ChangeNotifier`,
   `setState` bilan global holat — taqiq. `setState` faqat lokal UI holati uchun (animatsiya,
   ochiq/yopiq).
2. Async ma'lumot — `AsyncNotifier` / `AsyncValue`. UI `.when(data, loading, error)` bilan
   uchala holatni **doim** qoplaydi. `.value!` / `.requireValue` — taqiq.
3. Chat oqimi — `ChatNotifier extends Notifier<ChatState>`; SSE eventlari `ChatState.messages`
   ni **immutable** yangilaydi (`copyWith`). Har event'da `state = state.copyWith(...)`.
4. Streaming throttle: `content` bo'laklari 50 ms buferlanadi, keyin bitta `state` yangilanishi
   (TZ §7). Har chunk'da rebuild — taqiq.
5. `ref.listen` — snackbar/navigatsiya kabi *side-effect* uchun. `build()` ichida navigatsiya — taqiq.
6. Provider'lar `autoDispose` default; uzoq yashaydigani (auth, connectivity, theme, locale)
   `keepAlive: true` bilan aniq belgilanadi.
7. Repository'lar `Provider` orqali beriladi — testda `overrideWithValue` bilan almashadi.

---

## 4. Navigatsiya (GoRouter)

1. Bitta `GoRouter` — `app/router/app_router.dart`. Yo'llar `AppRoutes` konstantalarida,
   string literal bilan `context.go('/chat')` — taqiq.
2. `StatefulShellRoute.indexedStack` — pastki tab bar. Tab'lar:
   `/chat`, `/orders`, `/catalog`, `/management` (faqat manager/admin), `/profile`.
3. `redirect`:
   - token yo'q → `/login`
   - token bor, `/login` da → `/chat`
   - `employee` `/management/**` ga kirsa → `/forbidden` (403 ekrani)
   - **mijoz rejimi** yoqilgan → faqat `/chat/:id` ruxsat, qolgan hamma yo'l → chatga qaytariladi
4. Deep-link: `/chat/:conversationId`, `/orders/:orderId`, `/catalog/products/:productId`.
5. Planshet landshaft (`width ≥ 840`): `/chat` ikki panelli — chapda suhbatlar, o'ngda chat
   (dizayn 5a). Bu `LayoutBuilder` bilan hal qilinadi, alohida route yaratilmaydi.

---

## 5. Rollar va ruxsat

Rol iyerarxiyasi: `employee < manager < admin`. Rol `GET /auth/me/` dan keladi va
`AuthState.user.role` da saqlanadi.

| Bo'lim | employee | manager | admin |
|---|---|---|---|
| Chat, suhbatlar, katalog (o'qish), o'z buyurtmalari, profil | ✅ | ✅ | ✅ |
| Boshqaruv tab'i (statistika, xodimlar, mahsulot CRUD, narx qoidalari, bilimlar) | ❌ | ✅ | ✅ |
| Sozlamalar: system prompt, LLM, ovoz, tannarx ko'rish | ❌ | ❌ | ✅ |

**Qoidalar:**
- Ruxsat **ikki joyda** tekshiriladi: router `redirect` (yo'l) + widget (`RoleGate`) (tugma/bo'lim).
- Server 403 qaytarsa ilova buni **xato emas**, "Ruxsat yo'q" holati sifatida ko'rsatadi.
- `cost_price` (tannarx) DTO'da nullable; `null` bo'lsa UI hech qanday "tannarx" so'zini ko'rsatmaydi.
- Chegirma maydoni: employee `DiscountPolicy.manual_max_percent_employee` dan oshsa lokal
  validatsiya xatosi (`Sizga 5% gacha ruxsat berilgan`). Chegara **API'dan** olinadi, kodda yozilmaydi.

---

## 6. Ekranlar ro'yxati (o'zgartirilmaydi, qisqartirilmaydi)

Har ekran dizayn faylida `S-xx` artboard bilan mos keladi. Ekran ID'si widget nomida emas,
faqat hujjat va commit'da ishlatiladi.

| ID | Ekran | Feature | Dizayn artboard |
|---|---|---|---|
| S-01 | Login | auth | 1a |
| S-02 | Chat — bo'sh holat | chat | 1b |
| S-03 | Chat — suhbat (yorug'/qorong'i/planshet) | chat | 1c, 1j, 5a |
| S-04 | Chat — mahsulot tavsiyasi (karusel) | chat | 1d |
| S-05 | Chat — hisob kartochkasi | chat | 1e |
| S-06 | Chat — uchta variant (yorug'/qorong'i/planshet) | chat | 1f, 5b, 5c |
| S-07 | Chat — buyurtma qoralamasi kartochkasi | chat | 1g |
| S-08 | Chat — ovozli rejim | chat | 2a |
| S-09 | Chat — mijoz rejimi | customer_mode | 4a |
| S-10 | Suhbatlar ro'yxati | conversations | 2b |
| S-11 | Buyurtmalar ro'yxati (yorug'/qorong'i) | orders | 1h, 5d |
| S-12 | Buyurtma tafsiloti (yorug'/qorong'i) | orders | 1i, 5e |
| S-13 | Status o'zgartirish (bottom sheet) | orders | 2c |
| S-14 | Buyurtma tahriri / yaratish formasi | orders | 4b |
| S-15 | Buyurtmalar — bo'sh holat | orders | 3e |
| S-16 | Katalog — grid | catalog | 2d |
| S-17 | Katalog — filtr (bottom sheet) | catalog | 4c |
| S-18 | Mahsulot sahifasi | catalog | 2e |
| S-19 | Boshqaruv — statistika | management | 3a |
| S-20 | Xodimlar ro'yxati | management | 3b |
| S-21 | Xodim sahifasi (limit bloki) | management | 4d |
| S-22 | Mahsulot tahriri (manager) | management | 3c |
| S-23 | Narx va hisob qoidalari | management | 3d |
| S-24 | Bilimlar bazasi | management | 4e |
| S-25 | Profil | profile | 2f |
| S-26 | Tizim holatlari (internet yo'q, limit, xato, skeleton, bo'sh) | shared | 3e |
| — | Komponentlar kutubxonasi | shared/widgets | 3f |
| — | Sozlamalar (faqat admin): prompt, LLM, ovoz | management | TZ §2.7f (dizayn yo'q — §7 tokenlari bilan) |

---

## 7. Dizayn tizimi (tokenlar) — yagona manba

> Qiymatlar `docs/design/Alora-Mobil.dc.html` dan **aynan** olingan. Yangi rang/o'lcham
> qo'shish — faqat §19 orqali. Yo'nalish: **«zig'ir va patina»** — tinch, matoli, bezaksiz.

### 7.1 Ranglar (`AppColors`)

| Token | Yorug' | Qorong'i | Qayerda |
|---|---|---|---|
| `background` | `#F2F3F0` | `#101514` | ekran foni |
| `surface` | `#FBFBF9` | `#181E1D` | kartochka, input, chip |
| `surfaceMuted` | `#EEF0EC` | `#1C2523` | sotuvchi xabari foni, status pill neytral |
| `surfaceDisabled` | `#EFF0EC` | `#151B1A` | disabled input |
| `textPrimary` | `#151E1C` | `#E7EAE6` | asosiy matn |
| `textSecondary` | `#5C6663` | `#96A09D` | ikkilamchi matn, placeholder |
| `textDisabled` | `#96A09D` | `#5C6663` | disabled |
| `border` | `#DCDFD9` | `#293230` | 1px chegara |
| `borderSubtle` | `#EAEBE6` | `#232B29` | ro'yxat ajratgichi, progress fon |
| `accent` | `#0E5751` | `#5CB8AB` | asosiy tugma, faol tab, AI belgisi, tanlangan chegara |
| `accentPressed` | `#0A423E` | `#4AA396` | bosilgan holat |
| `accentSoft` | `#E4EFED` | `#1A2E2C` | tanlangan chip foni, "Tayyor" pill |
| `brass` | `#8A6620` | `#C9A257` | bo'lim label (uppercase), teg, "Tikuvda" pill |
| `brassSoft` | `#F5EFE1` | `#2A2416` | brass pill foni |
| `danger` | `#A6483C` | `#D98A7C` | xato, destruktiv, "Bekor qilingan" |
| `dangerSoft` | `#F7ECEA` | `#3A1F1B` | danger pill foni |
| `success` | `#2E7D4F` | `#5CB88A` | "Topshirildi", muvaffaqiyat |
| `successSoft` | `#E5F0E9` | `#1B2E22` | |
| `info` | `#4A6B7C` | `#8FB0C2` | "Tasdiqlangan" |
| `infoSoft` | `#E7EDF0` | `#1E2A30` | |
| `inverse` | `#151E1C` | `#E7EAE6` | snackbar foni, tanlangan chip foni |
| `onInverse` | `#F2F3F0` | `#101514` | snackbar matni |
| `onAccent` | `#F2F3F0` | `#101514` | asosiy tugma matni |

Qorong'i mavzuda dizayn faylida bo'lmagan `*Soft` ranglar — yorug' qiymatning
`accent`/`brass`/`danger` bilan 12% aralashmasi; `AppColors.dark` da yuqoridagi jadval aynan yoziladi.

### 7.2 Tipografika (`AppTypography`)

Shriftlar `assets/fonts/` ga qo'shiladi (Google Fonts'dan yuklab, offline). Tarmoqdan shrift yuklash — taqiq.

| Token | Shrift | O'lcham/og'irlik | Qayerda |
|---|---|---|---|
| `displayL` | Spectral 500 | 28 / 1.2 | Login logotipi, katta sarlavha (kam) |
| `displayM` | Spectral 500 | 22 / 1.25 | JAMI summa, bo'sh holat sarlavhasi |
| `titleL` | IBM Plex Sans 600 | 18 / 1.3 | Ekran sarlavhasi (AppBar) |
| `titleM` | IBM Plex Sans 600 | 16 / 1.3 | Dialog sarlavhasi, kartochka sarlavhasi |
| `titleS` | IBM Plex Sans 600 | 14 / 1.3 | Ro'yxat satri nomi, mahsulot nomi |
| `bodyL` | IBM Plex Sans 400 | 15 / 1.5 | Chat xabari (sotuvchi) |
| `bodyM` | IBM Plex Sans 400 | 14.5 / 1.55 | Chat xabari (AI), input matni |
| `bodyS` | IBM Plex Sans 400 | 13 / 1.45 | Chip, ikkilamchi matn, dialog tanasi |
| `labelL` | IBM Plex Sans 600 | 14.5 / 1.2 | Tugma matni |
| `labelM` | IBM Plex Sans 600 | 12 / 1.2 | Tool chip, "JAMI" label, tab bar (10) |
| `labelS` | IBM Plex Sans 600 | 11 / 1.2 | Status pill (11.5), input label, kichik izoh |
| `overline` | IBM Plex Sans 600 | 11 / 1.2, letterSpacing 0.8, UPPERCASE, `brass` | Bo'lim sarlavhasi (MATOLAR · BEZAKLAR · XIZMATLAR) |
| `mono` | IBM Plex Mono 500 | 12 | Buyurtma raqami `ALR-2026-000123` |

- Barcha raqamlar (narx, m², jadval) — `FontFeature.tabularFigures()` majburiy.
- Mijoz rejimida (§12) barcha `body*` va `title*` +2 sp.
- Diakritika (`o' g' '`) va kirill — shrift fayllari to'liq (Latin Ext + Cyrillic) yuklanadi; testda `Oʻzbek` va `Ўзбек` render qilinadi.

### 7.3 Radius va bo'shliq

| Token | Qiymat | Qayerda |
|---|---|---|
| `AppRadius.pill` | 999 | tugma, chip, status pill, input paneli (chat), avatar |
| `AppRadius.card` | 16 | kartochka, dialog, ro'yxat konteyneri, mahsulot kartochkasi |
| `AppRadius.input` | 12 | input maydoni, snackbar, ichki blok |
| `AppRadius.avatar` | 11 | harfli avatar kvadrat |
| `AppRadius.bubble` | `20 20 8 20` | sotuvchi xabari (o'ng-past burchak kichik) |
| `AppRadius.sheet` | 20 (yuqori) | bottom sheet |
| `AppRadius.small` | 4 | badge, ichki teg |
| `AppSpacing.xs / s / m / l / xl / xxl` | 4 / 8 / 12 / 16 / 24 / 32 | |
| `AppSpacing.screenH` | 16 | ekran gorizontal padding |
| `AppSpacing.chatGap` | 16 | xabarlar orasidagi masofa |

- **Soya deyarli yo'q.** Kartochka faqat `1px border`. Tanlangan kartochka: `1.5px accent` + `0 0 0 3px accent@9%`.
- Ikonkalar: outline, stroke 1.5, o'lcham 22–24. `Icons.*` (Material filled) — taqiq; `lucide_icons` yoki
  loyihaning SVG to'plami (`assets/icons/`) ishlatiladi.
- Rasm nisbati: mato — **4:5** vertikal; bezak (gul, podxvat) — **1:1**. 16:9 — taqiq.
- Minimal bosish maydoni 48×48 dp (tugma balandligi 46 + padding).

### 7.4 Komponent o'lchamlari (dizayn faylidan)

| Komponent | Spetsifikatsiya |
|---|---|
| AppBar | balandlik 56; sarlavha markazda **pill** ichida (`surface` + `border`), ostida 11px `textSecondary` bosqich matni |
| Asosiy tugma | balandlik 46, `pill`, `accent` fon, `onAccent` matn `labelL`; bosilgan `accentPressed`; disabled `border` fon + `textDisabled`; yuklanmoqda — 14px spinner + matn |
| Ikkilamchi tugma | 46, `pill`, `surface` + 1px `border`, `textPrimary` |
| Matnli tugma | 46, `accent` matn, fon yo'q |
| Destruktiv tugma | 46, `pill`, 1px `#E3CFCA` chegara, `danger` matn; dialogda to'ldirilgan `danger` |
| Chip (quick reply) | padding 9×13, `pill`, `surface` + `border`, `bodyS`; tanlangan — `inverse` fon + `onInverse` 600; kategoriya tanlangan — `accentSoft` fon + `accent` chegara/matn; sonli — `brass` 600 raqam |
| Tool chip | padding 6×11, `pill`, `surface` + `border`, 12px `textSecondary`; chapda 6px nuqta (`accent`) yoki 10px spinner; o'ngda chevron |
| "Yozmoqda" indikatori | 120×2 px `border` chiziq, ustida 40px `accent` bo'lak, `translateX` animatsiya 1.4s |
| Sotuvchi xabari | `surfaceMuted`, `bubble` radius, padding 12×16, max-width 80%, o'ngda |
| AI xabari | fon yo'q, `bodyM`, chapda 2px padding; tool chip ustida |
| Input paneli (chat) | `surface` + `border`, radius 26, padding 8; chapda "+" 38px, o'rtada matn, mikrofon 38px, yuborish 44px `accent` doira |
| Input maydoni | balandlik 46, `input` radius, `surface` + 1px `border`; fokus 1.5px `accent`; xato 1.5px `danger` + ostida 11px `danger` matn; disabled `surfaceDisabled` |
| Status pill | `pill`, padding 4×10, 11.5px 600, chapda 6px nuqta; ranglar §7.5 |
| Mahsulot kartochkasi | eni 180 (karusel) / grid 2 ustun, `card` radius, rasm 4:5, nom `titleS`, rang doirasi 12px + rang nomi 12px, narx 15px 600 + birlik 12px `textSecondary` |
| Hisob kartochkasi | `surface` + `border` + `card`; sarlavha `overline` brass; qator `bodyS` 13.5: chapda nom, o'rtada miqdor (`textSecondary`, eni 44), o'ngda summa (eni 82, 500, tabular); JAMI ustida 1px `textPrimary` chiziq; JAMI 22px 600 + "so'm" 13px |
| Variant kartochkasi | `card`, padding 14×15; tanlangan — 1.5px `accent` + 3px halo |
| Buyurtma kartochkasi | `card`; chap chetida 3px status rangli chiziq; raqam `mono`; status pill o'ngda; muddat matni: ≤3 kun `brass`, o'tgan `danger` |
| Snackbar | `inverse` fon, `input` radius, 7px rangli nuqta (`accent`/`danger`), 13.5 matn, o'ngda 13px 600 amal |
| Dialog | `surface` + `border` + `card`, sarlavha `titleM`, tana `bodyS` `textSecondary`, 2 tugma 44px |
| Tab bar | balandlik 62 + safe area, `surface` + yuqorida 1px `border`; label 10px; faol `accent` 600 + to'lgan ikonka; badge `brass` |
| Progress (limit) | 5px, `borderSubtle` fon; < 80% `accent`, 80–99% `brass`, 100% `danger` |
| Skeleton | `borderSubtle` bloklar, radius 5–7, shimmer yo'q (tinch pulsatsiya 1.2s) |
| Bottom sheet | yuqorida 36×4 tutqich `border`, sarlavha `titleM`, `sheet` radius |
| Harfli avatar | 36×36, `avatar` radius, `accent` fon, `onAccent` 15px 600 |
| Safe area | yuqori 47, pastki 34 (iOS); Android'da `MediaQuery.padding` |

### 7.5 Buyurtma statuslari (`OrderStatus` + `StatusColors`)

| Kod | Matn (uz) | Fon | Matn/nuqta |
|---|---|---|---|
| `draft` | Qoralama | `surfaceMuted` | `textSecondary` |
| `confirmed` | Tasdiqlangan | `infoSoft` | `info` |
| `measuring` | O'lchovda | `brassSoft` | `brass` |
| `production` | Tikuvda | `brassSoft` | `brass` |
| `ready` | Tayyor | `accentSoft` | `accent` |
| `installing` | O'rnatishda | `accentSoft` | `accent` |
| `completed` | Topshirildi | `successSoft` | `success` |
| `cancelled` | Bekor qilingan | `dangerSoft` | `danger` |

To'lov belgisi (alohida kichik chip): `Avans olindi` (`accentSoft`), `To'liq to'landi` (`successSoft`), `Qarz bor` (`dangerSoft`).
Status ro'yxati va ruxsat etilgan o'tishlar `GET /orders/statuses/` dan olinadi; ilova o'tishni **o'zi hisoblamaydi**.

### 7.6 Umumiy widgetlar (`lib/shared/widgets/`)

Quyidagilar **bir marta** yoziladi va hamma joyda qayta ishlatiladi. Feature ichida nusxa yaratish — taqiq:

`AppButton` (primary/secondary/text/destructive, `isLoading`, `isEnabled`) · `AppChip` · `AppCountChip` ·
`ToolChip` · `StatusPill` · `PaymentChip` · `AppTextField` (text/password/number/search/multiline, `errorText`) ·
`PhoneField` (+998 maskasi) · `MoneyText` (tabular, `so'm` suffiksi) · `UnitText` (`so'm/m²`, `so'm/dona`, `so'm/m`) ·
`ColorDot` (`color_hex`) · `LetterAvatar` · `AppCard` · `SectionLabel` (overline brass) · `AppBottomSheet` ·
`AppDialog` · `AppSnackbar` · `LimitProgressBar` · `SkeletonBox` / `SkeletonList` · `EmptyState` ·
`ErrorState` (`onRetry`) · `OfflineBanner` · `LimitExceededView` · `ProductCard` · `AppTabBar` · `RoleGate` ·
`TypingLine` (yozmoqda indikatori) · `Waveform`.

### 7.7 Nimadan qochish kerak (dizayn TZ §2)

Gradient · neon · emoji bilan bo'lim belgilash · AI'ni ✨ bilan belgilash · soyali "qog'oz" kartochkalar ·
katta rangli illyustratsiyalar · Material 3 default ranglari (`ColorScheme.fromSeed` — taqiq) ·
`CircularProgressIndicator` sahifa yuklanishida (skeleton ishlatiladi) · 3 nuqta "typing" (chiziq ishlatiladi).

---

## 8. Backend bilan shartnoma

### 8.1 Yo'llar (`core/network/api_paths.dart`)

Base: `https://<host>/api/v1`. Barcha yo'llar **faqat** `ApiPaths` klassida. Widget yoki repository ichida
string yo'l yozish — taqiq. Haqiqiy backend yo'llari (`projects/backend/config/urls.py` tekshirilgan):

| Guruh | Yo'l |
|---|---|
| Auth | `POST auth/login/` · `POST auth/refresh/` · `POST auth/logout/` · `GET auth/me/` |
| Suhbat | `GET/POST conversations/` · `GET/DELETE conversations/{id}/` · `POST conversations/{id}/reset/` · `GET conversations/{id}/transcript/` · `GET conversations/{id}/messages/` (tarix) · `POST conversations/{id}/messages/` (**SSE**) |
| Ovoz | `WS /ws/voice/{conversation_id}/` |
| Katalog | `GET catalog/categories/` · `GET catalog/products/?category=&style=&room=&segment=&price_unit=&search=&min_price=&max_price=` · `GET catalog/products/{id}/` · `GET catalog/variants/{id}/` |
| Katalog (manager) | `POST/PATCH/DELETE catalog/products/{id}/` · `POST/PATCH/DELETE catalog/variants/{id}/` · `POST catalog/variants/bulk-price/` · `POST catalog/products/{id}/images/` · `DELETE catalog/images/{id}/` · `GET/POST/PATCH/DELETE catalog/fasons/` |
| Buyurtma | `GET/POST orders/` · `GET/PATCH orders/{id}/` · `POST orders/{id}/confirm/` · `POST orders/{id}/status/` · `GET orders/statuses/` · `GET orders/{id}/pdf/` |
| Hisob | `POST pricing/calc/preview/` ← **diqqat:** TZ'da `/calc/preview/`, backend'da `pricing/` prefiksi ostida |
| Narx qoidalari | `GET/PATCH pricing/calc-rules/` · `pricing/calc-rules/{key}/` · `GET/PATCH pricing/services/` · `pricing/discount-tiers/` (CRUD) · `GET/PATCH pricing/discount-policy/` · `GET/PATCH pricing/order-defaults/` · `pricing/model-pricings/` (admin) |
| Bilimlar | `GET/POST/PATCH/DELETE knowledge/rules/` |
| Jamoa | `GET/POST team/employees/` · `GET/PATCH team/employees/{id}/` · `POST team/employees/{id}/limit/` · `GET team/employees/{id}/conversations/` |
| Statistika | `GET usage/summary/?period=day\|week\|month&user=` · `GET usage/by-user/` · `GET usage/conversations/` · `GET analytics/conversion/` |
| Sozlamalar (admin) | `GET/POST settings/prompt/` · `POST settings/prompt/{id}/rollback/` |

Shartnoma o'zgarsa — avval backend `docs/API-GUIDE.md`, keyin `ApiPaths`, keyin DTO. Teskarisi emas.

### 8.2 Auth va token

- `login/` javobi: `{"access": "...", "refresh": "..."}` (SimpleJWT). `refresh/` — `{"refresh"}` → `{"access","refresh"}` (rotation). `logout/` — `{"refresh"}`.
- `auth/me/` javobi: `{"profile": {id, phone, full_name, role, tenant, device_id}, "limit": {...}|null}` —
  `UserDto` shu **ichki** shaklga mos yoziladi (`profile` o'ramasi bor).
- `access` 15 daq, `refresh` 30 kun. Ikkalasi **faqat** `flutter_secure_storage` da. Hive/SharedPreferences'da token — taqiq.
- `AuthInterceptor`: har so'rovga `Authorization: Bearer`. 401 kelsa → bitta `refresh` (mutex bilan, parallel so'rovlar navbatda kutadi) → so'rov qayta yuboriladi. Refresh ham 401 bo'lsa → token tozalanadi → `/login`.
- `login/` va `refresh/` ga interceptor qo'llanmaydi.
- Log'da token, parol, telefon to'liq yozilmaydi (maskalanadi).

### 8.3 Xato formati va `Failure`

Backend yagona formatda qaytaradi:
```json
{ "detail": "Ma'lumotlar noto'g'ri", "code": "validation_error", "errors": { "price": "0 dan katta bo'lishi kerak" } }
```
`ErrorMapperInterceptor` → `Failure` (sealed):

| HTTP / holat | `Failure` | UI |
|---|---|---|
| ulanish yo'q, timeout | `NetworkFailure` | `OfflineBanner` yoki `ErrorState(onRetry)` |
| 400 `validation_error` | `ValidationFailure(fieldErrors)` | maydon ostida `errorText` |
| 401 (refresh'dan keyin ham) | `AuthFailure` | login'ga |
| 403 | `PermissionFailure` | "Ruxsat yo'q" ekrani |
| 404 | `NotFoundFailure` | "Topilmadi" |
| 429 `throttled` yoki limit | `LimitFailure(message)` | `LimitExceededView` (S-26) |
| 503 "AI xizmati vaqtincha ishlamayapti" | `ServiceUnavailableFailure` | banner + qayta urinish |
| boshqa 5xx | `ServerFailure` | "Server javob bermadi" + qayta urinish |

Foydalanuvchiga **hech qachon** xom `DioException`/stack trace ko'rsatilmaydi. `detail` matni backend'dan
kelgan bo'lsa — shu ko'rsatiladi (u o'zbekcha).

### 8.4 Pagination

Barcha ro'yxatlar cursor: `{ "next": url|null, "previous": url|null, "results": [] }`.
`Paginated<T>` umumiy model. Ro'yxat ekranlari `next` bo'yicha cheksiz scroll (`ListView.builder` +
oxiridan 200px oldin keyingi sahifa). Sahifa raqami bilan ishlash — taqiq.

### 8.5 SSE (chat streaming)

- `POST conversations/{id}/messages/` → `Content-Type: text/event-stream`. Dio `ResponseType.stream`,
  `receiveTimeout` yo'q (stream uzoq davom etadi), `sendTimeout` 15 s.
- Parser: qatorlar `\n\n` bilan ajratiladi; faqat `data:` prefiksli qatorlar; har biri `json.decode`.
  Buzilgan frame — o'tkazib yuboriladi va log'ga yoziladi, oqim to'xtamaydi.
- `kind` → `SseEvent` sealed: `start`, `thinking`, `content`, `toolCall(tool)`, `toolArgs(tool, args)`,
  `toolResult(tool, result)`, `done(usage, products)`, `error(detail)`. Noma'lum `kind` —
  `SseEvent.unknown`, UI e'tibor bermaydi (kelajak uchun oldinga moslik).
- `tool_result.result` — JSON string; tool nomiga qarab parse: `product_search` → `ProductCard[]`,
  `curtain_calculate` → `QuoteCard`, `price_quote`/`variants` → `OptionsCard`, `order_draft` → `OrderDraftCard`.
  Parse xatosi → tool chip "Natija" ko'rinishida (xom JSON ko'rsatilmaydi), xabar oqimi davom etadi.
- Uzilish: 3 marta qayta urinish (1s, 2s, 4s). Qisman kelgan matn saqlanadi, ustida "Davom ettirish / Qayta yuborish".
- `done` yoki `error` — oqim yopiladi. Foydalanuvchi ekranni tark etsa — `CancelToken` bilan bekor qilinadi (backend gRPC'ni bekor qiladi).
- Bir vaqtda bitta faol stream (ikkinchi xabar yuborish — birinchisi tugaguncha tugma disabled).

### 8.6 WebSocket (ovoz)

Protokol backend `apps/chat/consumers.py` (`VoiceChatConsumer`) dan **aynan** olingan:

- URL: `ws(s)://<host>/ws/voice/{conversation_id}/?locale=uz|ru`.
- **Auth — ochiq masala.** Backend hozir `AuthMiddlewareStack` (session) ishlatadi, JWT'ni WS'da
  qabul qilmaydi → mobil ilova ulanolmaydi (1008 bilan yopiladi). Backend jamoasi JWT middleware
  (`?token=<access>` yoki `Sec-WebSocket-Protocol`) qo'shishi shart. Ilova tomonida `VoiceSocket`
  `?token=` variantiga tayyorlanadi; backend usuli aniqlangach §19 ga yoziladi. Ungacha 15-bosqich
  `[~]` dan nariga o'tmaydi.
- **Yuborish (mijoz → server):** audio bo'laklar **binary frame** sifatida (PCM16/Opus 16 kHz mono,
  200 ms); gap tugaganda text frame `{"kind":"end"}`.
- **Qabul (server → mijoz):** audio — **binary frame** (`just_audio` ga chunk); text frame'lar:
  `{"kind":"transcript","content":"..."}` (STT natijasi, qisman), `{"kind":"content","content":"..."}`
  (AI matni), `{"kind":"done"}` (bo'lishi mumkin — `content` bo'sh), `{"kind":"error","error":"..."}`
  (keyin server 1011 bilan yopadi). `kind` maydoni (`type` emas). Noma'lum `kind` — e'tibor berilmaydi.
- Barge-in: mikrofon VAD gap sezsa → `just_audio.stop()` **lokal** + `{"kind":"end"}` yuborib yangi
  gap boshlanadi (server tomonida `interrupt` yo'q; bo'lsa §19).
- Backend hozir gRPC oqimini **to'liq yig'ib** (`list(...)`) keyin yuboradi — ya'ni real streaming
  emas. Bu backend masalasi; ilova protokoli o'zgarmaydi, lekin "3 s ichida eshitila boshlaydi" (§13)
  talabi backend tuzatilgunga qadar bajarilmaydi — `tasks.md` 15.11.
- Ekran o'chsa / qo'ng'iroq kelsa (`WidgetsBindingObserver.paused`, `audio_session` interruption) → yozish
  to'xtaydi, socket yopiladi, sessiya saqlanadi.
- `wakelock_plus` ovozli rejimda yoqiladi, chiqishda o'chiriladi.

---

## 9. Modellar

1. Barcha entity va DTO — `freezed` + `json_serializable`. Qo'lda `fromJson` — taqiq.
2. **DTO ≠ entity.** DTO API shaklini takrorlaydi (snake_case, nullable); entity — UI uchun qulay
   (non-null, tiplangan). Mapper `data/mappers/` da.
3. Pul — `Decimal` emas, **`int` tiyinsiz so'm** (backend `"2748000.00"` string → `int`). `double` pul uchun — taqiq.
   O'lcham va koeffitsient — `double` (3 kasr).
4. Sana — `DateTime` UTC, ko'rsatishda lokal (`date_format.dart`).
5. `enum` API bilan bir xil string qiymat (`@JsonValue('per_sqm')`). Noma'lum qiymat →
   `unknown` (ilova yiqilmaydi). Har enum'da `unknown` bo'lishi shart.
6. `price_unit`: `perSqm` → `so'm/m²`, `perPiece` → `so'm/dona`, `perMeter` → `so'm/m`. Birlik **har doim**
   narx yonida ko'rsatiladi (`UnitText`).
7. `cost_price` — faqat admin DTO'sida; entity'da `costPrice?` nullable; UI `null` bo'lsa yashiradi.
8. Hisob kartochkasi modeli (`Quote`) — **guruhlangan**: `fabrics[]` (rol, variant, rang, `widthM`, `heightM`,
   `coef`, `areaSqm`, `pricePerSqm`, `total`), `accessories[]` (nom, `qty`, `unit`, `unitPrice`, `total`),
   `services[]` (nom, `qty?`, `total`), `wasteWarnings[]`, `formula` (matn), `subtotal`, `discount`, `delivery`, `total`.
   Dizayn faylida 4 qatorli soddalashtirilgan ko'rinish bor — **TZ (3 guruh) ustun** (§0.9).

---

## 10. Lokalizatsiya

1. `flutter_localizations` + ARB: `app_uz.arb` (lotin, **asosiy**), `app_uz_Cyrl.arb`, `app_ru.arb`.
   `l10n.yaml` bilan `AppLocalizations` generatsiya.
2. UI'da string literal — **taqiq**. Har matn `context.l10n.<key>`. Istisno: log, test, debug.
3. Kalit nomi: `<ekran>_<element>` (`login_phoneLabel`, `orders_emptyTitle`, `common_retry`).
4. Uzbek lotin matni avval yoziladi; kirill va rus — bir xil commit'da (bo'sh qoldirilmaydi; bo'sh kalit
   `flutter gen-l10n` da `untranslated-messages-file` bilan tekshiriladi va CI'da xato).
5. Yozuv uslubi (dizayn TZ §7): qisqa, siz-lik, tugma nima qilsa shuni yozadi (`Tasdiqlash`, `Tikuvga topshirish`),
   xato matni sabab + yechim (`Internet yo'q. Ulanish tiklanganda avtomatik yuboriladi`).
6. **Pul formati:** `2 748 000 so'm` — ming ajratgich **oddiy bo'sh joy** (U+0020 emas, ` ` narrow no-break space),
   kasr ko'rsatilmaydi. `money_format.dart` da bitta funksiya, test bilan.
7. **Telefon:** `+998 90 123 45 67`. **Sana:** `12-sentabr`, `12-sent 2026`; nisbiy: `Bugun / Kecha / Bu hafta`.
8. Til `Profil` da tanlanadi, `Hive` da saqlanadi, ishga tushganda tiklanadi. Default — qurilma tili
   `uz`/`ru` bo'lsa shu, aks holda `uz` lotin.

---

## 11. Oflayn va barqarorlik

| Holat | Talab |
|---|---|
| Internet yo'q | `connectivity_plus` + haqiqiy ping (`GET auth/me/` yoki `HEAD /health/`). Yuqorida `OfflineBanner`; chat input disabled; suhbatlar ro'yxati, oxirgi suhbat xabarlari va katalog **Hive keshidan** ko'rinadi |
| Katalog keshi | `stale-while-revalidate`: avval kesh, fonda yangilash, farq bo'lsa jimgina almashtirish. Kesh TTL 24 soat; `products` va `categories` box'lari |
| Suhbat keshi | oxirgi 20 suhbat + har birining oxirgi 50 xabari |
| Chat oqimi uzildi | qisman javob saqlanadi + "Davom ettirish / Qayta yuborish" (§8.5) |
| Manager oflayn tahriri | `OfflineQueue` (Hive): `{id, method, path, body, createdAt, attempts}`; internet qaytganda FIFO yuboriladi; 409/400 kelsa — server yutadi, snackbar "Saqlanmadi: ..." + navbatdan o'chiriladi |
| Token muddati | interceptor jimgina refresh (§8.2) |
| Limit tugadi (429) | `LimitExceededView`; chat input disabled; `auth/me/` dan limit holati qayta so'raladi |
| AI xizmati yo'q (503) | banner "AI xizmati vaqtincha ishlamayapti" + qayta urinish |

Hive box'lar: `auth_prefs`, `catalog_products`, `catalog_categories`, `conversations`, `messages`,
`offline_queue`, `settings`. Har box'da `schemaVersion`; versiya o'zgarsa box tozalanadi (migratsiya yozilmaydi, kesh — vaqtinchalik ma'lumot).

---

## 12. Mijoz rejimi

1. Chat menyusidan yoqiladi; yoqishda **PIN** (4 raqam) o'rnatiladi (secure storage). Chiqish — shu PIN.
2. Yoqilganda: tool chip'lar, "Qanday hisoblandi?", tannarx, usage, boshqaruv elementlari, tab bar,
   AppBar menyusi — **yashirin**. Faqat toza suhbat + narx + variantlar.
3. Shrift +2 sp (§7.2). Yuqorida nozik indikator: `Mijoz rejimi` + qulf ikonkasi.
4. Router `redirect` faqat `/chat/:id` ga ruxsat beradi (§4.3). Orqaga tugmasi (Android) — bloklanadi (`PopScope`).
5. Rejim holati `CustomerModeNotifier` (keepAlive) da; ilova qayta ochilsa rejim saqlanib qoladi (PIN so'raladi).

---

## 13. Ishlash talablari (nazorat qilinadi)

| Ko'rsatkich | Chegara | Qanday tekshiriladi |
|---|---|---|
| Sovuq ishga tushish | ≤ 2 s | `flutter run --profile` + `DevTools` timeline; `bootstrap` da og'ir ish yo'q (Hive open'lar parallel, katalog kesh lazy) |
| Chat scroll | 60 FPS, 100+ xabar | `ListView.builder` + `RepaintBoundary` har xabarda; `AutomaticKeepAlive` yo'q; rasm `cached_network_image` + `memCacheWidth` |
| Streaming | rebuild ≤ 20/s | 50 ms throttle (§3.4); faqat oxirgi xabar widgeti qayta chiziladi (`select`) |
| Rasm | thumbnail ro'yxatda, to'liq faqat sahifada | backend `thumbnail_url` / `image_url` |
| APK hajmi | ≤ 40 MB (arm64 split) | `flutter build apk --split-per-abi --analyze-size` CI'da |
| Ovoz | javob ≤ 3 s ichida eshitila boshlaydi | `just_audio` 200 ms bufer, birinchi chunk kelganda darhol play |

- `const` konstruktorlar — lint bilan majburiy (`prefer_const_constructors`).
- Katta ro'yxatlarda `itemExtent` yoki `prototypeItem` (kartochka balandligi ma'lum bo'lsa).
- `setState` bo'roni, `build()` ichida og'ir hisob, `MediaQuery.of(context)` o'rniga `MediaQuery.sizeOf` — lint.

---

## 14. Kod sifati

1. `analysis_options.yaml`: `flutter_lints` + `riverpod_lint` + `custom_lint`; qo'shimcha qat'iy qoidalar:
   `always_declare_return_types`, `prefer_final_locals`, `avoid_print`, `unawaited_futures`,
   `require_trailing_commas`, `prefer_const_constructors`, `use_key_in_widget_constructors`,
   `avoid_dynamic_calls`, `strict-casts: true`, `strict-raw-types: true`.
2. `dart format` (line-length **100**). `dart analyze` — 0 warning, 0 info.
3. `print()` — taqiq; `logger` (`core/utils/app_logger.dart`) ishlatiladi; prod'da `Level.warning` dan yuqori.
4. Docstring — public klass va murakkab mantiqda, **o'zbek tilida** qisqa. Kod identifikatorlari inglizcha.
5. Kodda `TODO` qoldirilsa — `tasks.md` ga qator qo'shiladi, aks holda qoldirilmaydi.
6. Fayl 400 qatordan oshsa bo'linadi. Widget `build()` 80 qatordan oshsa — ichki widgetlarga ajratiladi
   (metod emas, **klass** — `_XxxSection extends StatelessWidget`).
7. `dynamic` — taqiq (JSON parse'dan tashqari, u ham `Map<String, dynamic>` bilan cheklanadi).
8. Generatsiya qilingan fayllar (`*.g.dart`, `*.freezed.dart`) commit qilinadi (CI'da `build_runner` qayta ishlatib tekshiradi).
9. Magic number/string — taqiq: konstanta `core/constants.dart` yoki tegishli token klassida.
10. Har widget faylda faqat bitta public widget.

---

## 15. Testlar

1. Framework: `flutter_test`, `mocktail`, `golden_toolkit` (yoki `alchemist`), `integration_test`.
2. **Coverage ≥ 70%** umumiy; `core/sse`, `core/network/interceptors`, `core/utils` (formatlar),
   `features/chat/application` uchun **≥ 90%**.
3. Majburiy test turlari:
   - **Unit:** SSE parser (har `kind`, buzilgan frame, uzilish), `Failure` mapper (har HTTP kod),
     `money_format` / `phone_format` / `date_format`, DTO ↔ entity mapperlar, `ChatNotifier` holat o'tishlari,
     `OfflineQueue` FIFO va konflikt, auth refresh mutex (parallel 3 so'rov → 1 refresh)
   - **Widget:** har `shared/widgets` komponenti (barcha holatlar), xabar turlari (matn, tool chip 3 holat,
     mahsulot karuseli, hisob kartochkasi 3 guruh + "yana N ta", 3 variant, buyurtma qoralamasi yetishmayotgan
     maydon bilan), `RoleGate` (3 rol), `LimitProgressBar` 3 rang, status pill 8 rang
   - **Golden:** S-01, S-03, S-05, S-06, S-11, S-12 — yorug' **va** qorong'i, 390×844; S-03 va S-06 planshet 1024×768
   - **Integration:** login → yangi suhbat → xabar → SSE (mock server) → hisob kartochkasi → buyurtma
     qoralamasi → tasdiqlash; employee `/management` ga kira olmasligi; limit 429 ekrani
4. Tashqi xizmat (API, WebSocket, mikrofon) testda **hech qachon** haqiqiy chaqirilmaydi — `mocktail` /
   `http_mock_adapter` / fake repository.
5. Test nomi hujjat bo'lib xizmat qiladi: `test('employee boshqaruv tabini ko'rmaydi', ...)`.
6. `flutter test` yashil bo'lmaguncha commit qilinmaydi. Golden o'zgarsa — `--update-goldens` alohida
   commit'da, sabab bilan.

---

## 16. Bajarilgan ishni belgilash tartibi

1. Ish boshlanganda `tasks.md` dagi qator `[~]` (jarayonda) qilinadi.
2. `[x]` faqat quyidagilar bajarilganda qo'yiladi:
   (a) kod yozilgan **va** router/provider bilan ulangan (import qilinmagan widget — `[~]`),
   (b) qabul mezonini qoplaydigan test bor va o'tadi,
   (c) `dart format --set-exit-if-changed`, `dart analyze`, `flutter test` uchalasi ham yashil,
   (d) ekran dizayn artboard'i bilan solishtirilgan (golden yoki skrinshot),
   (e) stub, `TODO`, soxta ma'lumot (`'Aziza Karimova'` hardcode) qoldirilmagan — namuna ma'lumot faqat
   `test/helpers/fixtures/` va (dev uchun) `lib/core/dev/fake_data.dart` da, u prod build'ga kirmaydi.
3. Shu o'zgarish **ish commit'ining ichida** ketadi — alohida "tasks yangilandi" commit'i qilinmaydi.
4. Yangi ish paydo bo'lsa `tasks.md` ga tegishli bosqichga qo'shiladi, o'ylab topilgan ish qo'shilmaydi.

---

## 17. Ruxsat etilgan paketlar (`pubspec.yaml`)

Ro'yxatdan tashqari paket — faqat §19 orqali.

| Maqsad | Paket |
|---|---|
| State | `flutter_riverpod`, `riverpod_annotation`, `riverpod_generator`, `riverpod_lint` |
| Router | `go_router` |
| Network | `dio`, `web_socket_channel`, `connectivity_plus` |
| Modellar | `freezed`, `freezed_annotation`, `json_annotation`, `json_serializable` |
| Storage | `hive`, `hive_flutter`, `flutter_secure_storage`, `path_provider` |
| Ovoz | `record`, `just_audio`, `audio_session`, `wakelock_plus`, `permission_handler` |
| Rasm | `cached_network_image`, `image_picker`, `image_cropper`, `flutter_image_compress` |
| UI | `lucide_icons` (yoki `flutter_svg` + o'z ikonkalar), `fl_chart`, `flutter_colorpicker`, `shimmer` **emas** (§7.7) |
| Format | `intl`, `mask_text_input_formatter` |
| Fayl/ulashish | `share_plus`, `open_filex`, `url_launcher` |
| Bildirishnoma | `firebase_messaging`, `flutter_local_notifications` (4-bosqich) |
| Xato kuzatuvi | `sentry_flutter` |
| Test | `flutter_test`, `mocktail`, `golden_toolkit`, `http_mock_adapter`, `integration_test` |
| Build | `build_runner`, `flutter_lints`, `custom_lint`, `flutter_launcher_icons`, `flutter_native_splash` |

Muhit (`.env` / `--dart-define`): `API_BASE_URL`, `WS_BASE_URL`, `SENTRY_DSN`, `ENV` (`dev|staging|prod`).
Sirlar repoga tushmaydi; `.env.example` namuna.

---

## 18. Git qoidalari

1. Branch: `main` (barqaror) ← `feat/<qisqa-nom>`, `fix/<qisqa-nom>`, `chore/<qisqa-nom>`.
2. Commit **atomik** — bitta mantiqiy o'zgarish, bitta commit.
3. **Commit xabari o'zbek tilida**, Conventional Commits prefiksi bilan, scope = feature nomi:

```
feat(chat): SSE parser va ChatNotifier qo'shildi

start/content/tool_call/tool_result/done/error eventlari SseEvent sealed
klassiga o'giriladi, 50 ms throttle bilan ChatState yangilanadi.
Uzilishda 3 marta qayta urinish, qisman matn saqlanadi.
```

4. Prefikslar: `feat`, `fix`, `refactor`, `test`, `docs`, `chore`, `perf`, `build`, `style` (faqat format).
5. Sarlavha ≤ 72 belgi, bajarilgan ish sifatida ("qo'shildi", "tuzatildi").
6. Commit xabarida **AI, Claude, Copilot va shunga o'xshash belgi bo'lmaydi**. `Co-Authored-By` yoki generator izohi yozilmaydi.
7. Push'dan oldin **har doim** `git pull --rebase origin <branch>`.
8. Generatsiya fayllari (`*.g.dart`, `*.freezed.dart`, `l10n`) o'z manbasi bilan bir commit'da.
9. `tasks.md` dagi belgi shu ish bajarilgan commit **ichida** yangilanadi.
10. `.gitignore`: `build/`, `.dart_tool/`, `.env`, `*.iml`, `ios/Pods`, `android/local.properties`, `coverage/`.

---

## 19. Kelishilgan chetlanishlar (jurnal)

> 0-bo'lim 7-bandiga ko'ra TZ, dizayn yoki qoidadan har qanday chetlanish shu yerga yoziladi.
> Yozilmagan chetlanish — xato hisoblanadi. Shablon: **Chetlanish · Sabab · Ta'sir doirasi · Muqobil variantlar · Qaror**.

### 19.1 Tugma radiusi 10 dp → pill (999) (2026-09-16)

**Chetlanish:** `04-MOBILE-DESIGN-TZ.md` §2 tugma radiusini 10 dp deb ko'rsatadi; tasdiqlangan dizayn
faylida (`3f` komponentlar kutubxonasi) barcha tugmalar **pill** (999). Kartochka 16 (TZ: 10–12), input 12.

**Sabab:** dizayn fayli — buyurtmachi ko'rib tasdiqlagan yakuniy vizual manba; dizayn TZ unga brif edi.

**Ta'sir doirasi:** faqat `AppRadius` tokenlari (§7.3). Kod boshqa joyda o'zgarmaydi.

**Qaror:** §7.3 dizayn fayli qiymatlari bilan yozildi. Foydalanuvchi tomonidan tasdiqlangan (rules.md qabul qilinganda).

### 19.2 `calc/preview` yo'li (2026-09-16)

**Chetlanish:** TZ `POST /api/v1/calc/preview/`; haqiqiy backend `POST /api/v1/pricing/calc/preview/`.

**Sabab:** backend `apps/pricing/urls.py` shunday ulangan; backend — haqiqat manbai.

**Qaror:** `ApiPaths.calcPreview = 'pricing/calc/preview/'`. Backend o'zgarsa `ApiPaths` yangilanadi.

### 19.3 Mahsulot kartochkasidagi narx birligi (2026-09-16)

**Chetlanish:** dizayn faylida mato narxi `so'm/m` deb chizilgan; TZ (`00-UMUMIY` §4.0, `03-MOBILE` §2.5)
mato **m²** bo'yicha.

**Qaror:** §0.9 bo'yicha TZ ustun — `UnitText` `so'm/m²` ko'rsatadi. Dizayndagi `so'm/m` faqat bahroma/tasma
(`per_meter`) uchun.

### 19.4 Flutter 3.2x → 3.47.4 (2026-09-16)

**Chetlanish:** TZ (`03-MOBILE-TZ.md`) Flutter 3.2x ni ko'rsatadi; loyiha **Flutter 3.47.4 stable / Dart 3.13.3**
da quriladi (Android SDK 36, build-tools 36.0.0, JDK 17 Temurin).

**Sabab:** TZ yozilgan paytdagi joriy stable 3.2x edi; hozirgi stable 3.47.4. Eski versiyani ataylab
o'rnatish — xavfsizlik yangilanishlaridan va paketlarning joriy versiyalaridan mahrum qiladi.
3.47 Android SDK 36 talab qiladi.

**Ta'sir doirasi:** `pubspec.yaml` (`sdk: ^3.13.0`), `android/` (compileSdk 36), CI (`flutter-version: 3.47.4`),
`README.md`. Kod o'zgarishi yo'q.

**Muhit (sudo'siz, foydalanuvchi home'ida):** `~/development/flutter`, `~/development/jdk-17`, `~/Android/Sdk`;
PATH `~/.zshrc` da. Dart MCP: `claude mcp add --scope user dart -- ~/development/flutter/bin/dart mcp-server`.

**Qaror:** hamma joyda 3.47.4. Foydalanuvchi tomonidan tasdiqlangan (o'rnatish so'rovi).
