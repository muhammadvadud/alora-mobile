# Alora Mobil — Dizayn tokenlari (DESIGN-TOKENS.md)

> Manba: `rules.md` §7 (7.1–7.7) + `docs/design/Alora-Mobil.dc.html`.
> **Ziddiyat bo'lsa rules.md ustun.** Yangi token qo'shish — faqat §19 orqali.
>
> Yo'nalish: **«zig'ir va patina»** — tinch, matoli, bezaksiz.

---

## 1. Ranglar (`AppColors`)

### 1.1 Yorug' palitra

| Token | Hex | Qayerda |
|---|---|---|
| `background` | `#F2F3F0` | ekran foni |
| `surface` | `#FBFBF9` | kartochka, input, chip |
| `surfaceMuted` | `#EEF0EC` | sotuvchi xabari foni, status pill neytral |
| `surfaceDisabled` | `#EFF0EC` | disabled input |
| `textPrimary` | `#151E1C` | asosiy matn |
| `textSecondary` | `#5C6663` | ikkilamchi matn, placeholder |
| `textDisabled` | `#96A09D` | disabled |
| `border` | `#DCDFD9` | 1px chegara |
| `borderSubtle` | `#EAEBE6` | ro'yxat ajratgichi, progress fon |
| `accent` | `#0E5751` | asosiy tugma, faol tab, AI belgisi, tanlangan chegara |
| `accentPressed` | `#0A423E` | bosilgan holat |
| `accentSoft` | `#E4EFED` | tanlangan chip foni, "Tayyor" pill |
| `brass` | `#8A6620` | bo'lim label (uppercase), teg, "Tikuvda" pill |
| `brassSoft` | `#F5EFE1` | brass pill foni |
| `danger` | `#A6483C` | xato, destruktiv, "Bekor qilingan" |
| `dangerSoft` | `#F7ECEA` | danger pill foni |
| `success` | `#2E7D4F` | "Topshirildi", muvaffaqiyat |
| `successSoft` | `#E5F0E9` | — |
| `info` | `#4A6B7C` | "Tasdiqlangan" |
| `infoSoft` | `#E7EDF0` | — |
| `inverse` | `#151E1C` | snackbar foni, tanlangan chip foni |
| `onInverse` | `#F2F3F0` | snackbar matni |
| `onAccent` | `#F2F3F0` | asosiy tugma matni |

### 1.2 Qorong'i palitra

| Token | Hex |
|---|---|
| `background` | `#101514` |
| `surface` | `#181E1D` |
| `surfaceMuted` | `#1C2523` |
| `surfaceDisabled` | `#151B1A` |
| `textPrimary` | `#E7EAE6` |
| `textSecondary` | `#96A09D` |
| `textDisabled` | `#5C6663` |
| `border` | `#293230` |
| `borderSubtle` | `#232B29` |
| `accent` | `#5CB8AB` |
| `accentPressed` | `#4AA396` |
| `accentSoft` | `#1A2E2C` |
| `brass` | `#C9A257` |
| `brassSoft` | `#2A2416` |
| `danger` | `#D98A7C` |
| `dangerSoft` | `#3A1F1B` |
| `success` | `#5CB88A` |
| `successSoft` | `#1B2E22` |
| `info` | `#8FB0C2` |
| `infoSoft` | `#1E2A30` |
| `inverse` | `#E7EAE6` |
| `onInverse` | `#101514` |
| `onAccent` | `#101514` |

> `*Soft` qorong'i qiymatlari dizayn faylida yo'q — yorug' qiymatning
> `accent`/`brass`/`danger` bilan 12% aralashmasi. `AppColors.dark` da
> yuqoridagi jadval aynan yoziladi.

### 1.3 Dart nomi

Har token uchun `AppColors.<token>` — `ThemeExtension<AppColors>` orqali.
Qo'shimcha `context.colors` extension — `context.extensions<AppColors>()`.

---

## 2. Tipografika (`AppTypography`)

Shriftlar `assets/fonts/` ga qo'shiladi (offline). Tarmoqdan yuklash — taqiq.

| Token | Shrift | O'lcham / og'irlik | Qayerda |
|---|---|---|---|
| `displayL` | Spectral 500 | 28 / 1.2 | Login logotipi, katta sarlavha |
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
| `overline` | IBM Plex Sans 600 | 11 / 1.2 | Bo'lim sarlavhasi (UPPERCASE, letterSpacing 0.8, `brass` rangda) |
| `mono` | IBM Plex Mono 500 | 12 | Buyurtma raqami `ALR-2026-000123` |

**Qoidalar:**
- Barcha raqamlar (narx, m², jadval) — `FontFeature.tabularFigures()` majburiy.
- Mijoz rejimida barcha `body*` va `title*` +2 sp.
- Diakritika (`o' g' '`) va kirill — shrift fayllari to'liq (Latin Ext + Cyrillic) yuklanadi.

---

## 3. Radius va bo'shliq

### 3.1 `AppRadius`

| Token | Qiymat | Qayerda |
|---|---|---|
| `pill` | 999 | tugma, chip, status pill, input paneli (chat), avatar |
| `card` | 16 | kartochka, dialog, ro'yxat konteyneri, mahsulot kartochkasi |
| `input` | 12 | input maydoni, snackbar, ichki blok |
| `avatar` | 11 | harfli avatar kvadrat |
| `bubble` | `20 20 8 20` | sotuvchi xabari (o'ng-past burchak kichik) |
| `sheet` | 20 (yuqori) | bottom sheet |
| `small` | 4 | badge, ichki teg |

### 3.2 `AppSpacing`

| Token | Qiymat | Qayerda |
|---|---|---|
| `xs` | 4 | — |
| `s` | 8 | — |
| `m` | 12 | — |
| `l` | 16 | — |
| `xl` | 24 | — |
| `xxl` | 32 | — |
| `screenH` | 16 | ekran gorizontal padding |
| `chatGap` | 16 | xabarlar orasidagi masofa |

**Qoidalar:**
- Soya deyarli yo'q. Kartochka faqat `1px border`.
- Tanlangan kartochka: `1.5px accent` + `0 0 0 3px accent@9%`.
- Ikonkalar: outline, stroke 1.5, o'lcham 22–24. `Icons.*` (Material filled) — taqiq.
- Rasm nisbati: mato — 4:5 vertikal; bezak — 1:1. 16:9 — taqiq.
- Minimal bosish maydoni 48×48 dp.

---

## 4. Komponent spetsifikatsiyalari

> rules.md §7.4 asosida. Widget nomlari §7.6 dan olingan.

| Komponent | Widget | Spetsifikatsiya |
|---|---|---|
| AppBar | — | balandlik 56; sarlavha markazda **pill** ichida (`surface` + `border`), ostida 11px `textSecondary` bosqich matni |
| Asosiy tugma | `AppButton(primary)` | h 46, `pill`, `accent` fon, `onAccent` matn `labelL`; bosilgan `accentPressed`; disabled `border` fon + `textDisabled`; yuklanmoqda — 14px spinner + matn |
| Ikkilamchi tugma | `AppButton(secondary)` | h 46, `pill`, `surface` + 1px `border`, `textPrimary` |
| Matnli tugma | `AppButton(text)` | h 46, `accent` matn, fon yo'q |
| Destruktiv tugma | `AppButton(destructive)` | h 46, `pill`, 1px `#E3CFCA` chegara, `danger` matn; dialogda to'ldirilgan `danger` |
| Chip (quick reply) | `AppChip` | pad 9×13, `pill`, `surface` + `border`, `bodyS`; tanlangan — `inverse` + `onInverse` 600; kategoriya tanlangan — `accentSoft` + `accent` chegara/matn; sonli — `brass` 600 raqam |
| Tool chip | `ToolChip` | pad 6×11, `pill`, `surface` + `border`, 12px `textSecondary`; chapda 6px nuqta (`accent`) yoki 10px spinner; o'ngda chevron |
| "Yozmoqda" indikatori | `TypingLine` | 120×2 px `border` chiziq, ustida 40px `accent` bo'lak, `translateX` animatsiya 1.4s |
| Sotuvchi xabari | `UserBubble` | `surfaceMuted`, `bubble` radius, pad 12×16, max-width 80%, o'ngda |
| AI xabari | `AssistantMessage` | fon yo'q, `bodyM`, chapda 2px padding; tool chip ustida |
| Input paneli (chat) | — | `surface` + `border`, radius 26, pad 8; chapda "+" 38px, o'rtada matn, mikrofon 38px, yuborish 44px `accent` doira |
| Input maydoni | `AppTextField` | h 46, `input` radius, `surface` + 1px `border`; fokus 1.5px `accent`; xato 1.5px `danger` + ostida 11px `danger` matn; disabled `surfaceDisabled` |
| Status pill | `StatusPill` | `pill`, pad 4×10, 11.5px 600, chapda 6px nuqta; ranglar §7.5 |
| Mahsulot kartochkasi | `ProductCard` | eni 180 (karusel) / grid 2 ustun, `card` radius, rasm 4:5, nom `titleS`, rang doirasi 12px + rang nomi 12px, narx 15px 600 + birlik 12px `textSecondary` |
| Hisob kartochkasi | `QuoteCard` | `surface` + `border` + `card`; sarlavha `overline` brass; qator `bodyS` 13.5: chapda nom, o'rtada miqdor (`textSecondary`, eni 44), o'ngda summa (eni 82, 500, tabular); JAMI ustida 1px `textPrimary` chiziq; JAMI 22px 600 + "so'm" 13px |
| Variant kartochkasi | `OptionsCard` | `card`, pad 14×15; tanlangan — 1.5px `accent` + 3px halo |
| Buyurtma kartochkasi | — | `card`; chap chetida 3px status rangli chiziq; raqam `mono`; status pill o'ngda; muddat matni: ≤3 kun `brass`, o'tgan `danger` |
| Snackbar | `AppSnackbar` | `inverse` fon, `input` radius, 7px rangli nuqta (`accent`/`danger`), 13.5 matn, o'ngda 13px 600 amal |
| Dialog | `AppDialog` | `surface` + `border` + `card`, sarlavha `titleM`, tana `bodyS` `textSecondary`, 2 tugma 44px |
| Tab bar | `AppTabBar` | h 62 + safe area, `surface` + yuqorida 1px `border`; label 10px; faol `accent` 600 + to'lgan ikonka; badge `brass` |
| Progress (limit) | `LimitProgressBar` | 5px, `borderSubtle` fon; < 80% `accent`, 80–99% `brass`, 100% `danger` |
| Skeleton | `SkeletonBox` / `SkeletonList` | `borderSubtle` bloklar, radius 5–7, shimmer yo'q (tinch pulsatsiya 1.2s) |
| Bottom sheet | `AppBottomSheet` | yuqorida 36×4 tutqich `border`, sarlavha `titleM`, `sheet` radius |
| Harfli avatar | `LetterAvatar` | 36×36, `avatar` radius, `accent` fon, `onAccent` 15px 600 |
| Safe area | — | yuqori 47, pastki 34 (iOS); Android'da `MediaQuery.padding` |

---

## 5. Status ranglari (`OrderStatus` + `StatusColors`)

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

**To'lov belgilari** (alohida kichik chip):
| Belgi | Fon |
|---|---|
| `Avans olindi` | `accentSoft` |
| `To'liq to'landi` | `successSoft` |
| `Qarz bor` | `dangerSoft` |

> Dart nomi: `StatusColors.forStatus(OrderStatus.draft)` kabi.
> Status ro'yxati va ruxsat etilgan o'tishlar `GET /orders/statuses/` dan olinadi.

---

## 6. Artboard → widget mapping

> rules.md §6 jadvalidagi har ekran uchun dizayn artboard ID va tegishli Flutter fayl.

| ID | Ekran | Artboard | Feature | Widget / Screen fayl |
|---|---|---|---|---|
| S-01 | Login | 1a | auth | `features/auth/presentation/screens/login_screen.dart` |
| S-02 | Chat — bo'sh holat | 1b | chat | `features/chat/presentation/screens/chat_screen.dart` |
| S-03 | Chat — suhbat | 1c, 1j, 5a | chat | `features/chat/presentation/screens/chat_screen.dart` |
| S-04 | Chat — mahsulot tavsiyasi | 1d | chat | `features/chat/presentation/widgets/product_carousel.dart` |
| S-05 | Chat — hisob kartochkasi | 1e | chat | `features/chat/presentation/widgets/quote_card.dart` |
| S-06 | Chat — uchta variant | 1f, 5b, 5c | chat | `features/chat/presentation/widgets/options_card.dart` |
| S-07 | Chat — buyurtma qoralamasi | 1g | chat | `features/chat/presentation/widgets/order_draft_card.dart` |
| S-08 | Chat — ovozli rejim | 2a | chat | `features/chat/presentation/screens/chat_screen.dart` (voice mode) |
| S-09 | Chat — mijoz rejimi | 4a | customer_mode | `features/customer_mode/presentation/screens/customer_mode_screen.dart` |
| S-10 | Suhbatlar ro'yxati | 2b | conversations | `features/conversations/presentation/screens/conversations_screen.dart` |
| S-11 | Buyurtmalar ro'yxati | 1h, 5d | orders | `features/orders/presentation/screens/orders_screen.dart` |
| S-12 | Buyurtma tafsiloti | 1i, 5e | orders | `features/orders/presentation/screens/order_detail_screen.dart` |
| S-13 | Status o'zgartirish | 2c | orders | `features/orders/presentation/widgets/status_change_sheet.dart` |
| S-14 | Buyurtma tahriri/yaratish | 4b | orders | `features/orders/presentation/screens/order_form_screen.dart` |
| S-15 | Buyurtmalar — bo'sh holat | 3e | orders | `features/orders/presentation/screens/orders_screen.dart` (empty) |
| S-16 | Katalog — grid | 2d | catalog | `features/catalog/presentation/screens/catalog_screen.dart` |
| S-17 | Katalog — filtr | 4c | catalog | `features/catalog/presentation/widgets/catalog_filter_sheet.dart` |
| S-18 | Mahsulot sahifasi | 2e | catalog | `features/catalog/presentation/screens/product_screen.dart` |
| S-19 | Boshqaruv — statistika | 3a | management | `features/management/presentation/screens/stats_screen.dart` |
| S-20 | Xodimlar ro'yxati | 3b | management | `features/management/presentation/screens/employees_screen.dart` |
| S-21 | Xodim sahifasi | 4d | management | `features/management/presentation/screens/employee_detail_screen.dart` |
| S-22 | Mahsulot tahriri | 3c | management | `features/management/presentation/screens/product_edit_screen.dart` |
| S-23 | Narx va hisob qoidalari | 3d | management | `features/management/presentation/screens/pricing_rules_screen.dart` |
| S-24 | Bilimlar bazasi | 4e | management | `features/management/presentation/screens/knowledge_screen.dart` |
| S-25 | Profil | 2f | profile | `features/profile/presentation/screens/profile_screen.dart` |
| S-26 | Tizim holatlari | 3e | shared | `shared/widgets/` — `ErrorState`, `OfflineBanner`, `LimitExceededView`, `SkeletonBox` |
| — | Komponentlar kutubxonasi | 3f | shared | `lib/core/dev/component_gallery.dart` (faqat dev) |
| — | Sozlamalar (admin) | — | management | `features/management/presentation/screens/settings_screen.dart` (dizayn yo'q, §7 tokenlari bilan) |

---

## 7. Nimadan qochish kerak

Gradient · neon · emoji bilan bo'lim belgilash · AI'ni ✨ bilan belgilash · soyali "qog'oz" kartochkalar ·
katta rangli illyustratsiyalar · Material 3 default ranglari (`ColorScheme.fromSeed` — taqiq) ·
`CircularProgressIndicator` sahifa yuklanishida (skeleton ishlatiladi) · 3 nuqta "typing" (chiziq ishlatiladi).

---

## 8. Tasdiqlangan palette tekshiruvi (design HTML bilan solishtirish)

Dizayn faylida (`Alora-Mobil.dc.html`, 2104 qator) eng ko'p ishlatilgan ranglar rules.md §7.1 bilan mos keladi:

- `#5C6663` (textSecondary yorug') — 293 marta ✅
- `#DCDFD9` (border yorug') — 242 marta ✅
- `#FBFBF9` (surface yorug') — 187 marta ✅
- `#0E5751` (accent yorug') — 133 marta ✅
- `#151E1C` (textPrimary yorug') — 130 marta ✅
- `#F2F3F0` (background yorug') — 103 marta ✅
- `#8A6620` (brass yorug') — 76 marta ✅
- `#96A09D` (textDisabled yorug') — 57 marta ✅

Ziddiyat aniqlanmadi — rules.md qiymatlari to'g'ri.
