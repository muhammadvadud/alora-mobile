# Alora Mobile — Dizayn tizimi v2 (Figma «ChatGPT Apps UI Kit» asosida)

> Manba: Figma `HwGZovGFpezgJNUbsoKAZ9` («ChatGPT Apps UI Kit (Community)»), sahifalar
> `● ChatGPT Mobile & Desktop UI`, `→ Colors`, `→ Typography`, `→ Spacing & Grid`, `→ Shadows`.
> Qiymatlar Figma REST API orqali **aynan** olingan (2026-09-19). Render'lar: `docs/design/figma-kit/*.png`.
> Bu hujjat `rules.md` §7 ning yagona manbasi. Kitda **yo'q** ekranlar (katalog, buyurtmalar,
> boshqaruv, profil, login) shu tokenlar va §6 komponent qoidalari bilan chiziladi.
> Kitda **bor, lekin bizda yo'q** narsalar (xarita, brend ilovalar, model tanlovi, xabar ostidagi
> like/dislike/copy qatori, «liquid glass» effektlari, drawer) — **qo'shilmaydi** (rules §0.3).

Yo'nalish: **oq, tinch, matnga urg'u**. Fon oq, sirtlar `#F3F3F3` pill'lar, kartochka faqat 1px `#E8E8E8`
chegara + 20 radius, asosiy tugma **qora**, aksent ko'k faqat tanlov/holat uchun. Shrift — **Inter**.

---

## 1. Ranglar (`AppColors`)

Token nomlari eski kod bilan mos qoladi (o'zgargan: `brass` → `warning`, `brassSoft` → `warningSoft`).

| Token | Yorug' | Qorong'i | Kit nomi / qayerda |
|---|---|---|---|
| `background` | `#FFFFFF` | `#212121` | Background Primary — ekran foni |
| `surface` | `#FFFFFF` | `#212121` | kartochka, dialog, sheet, tab bar (fon = background, farq chegarada) |
| `surfaceMuted` | `#F3F3F3` | `#303030` | Background Tertiary/Secondary — sotuvchi pufagi, chip, input pill, «+» tugma, skeleton |
| `surfaceDisabled` | `#E8E8E8` | `#414141` | Background Secondary/Tertiary — disabled tugma foni («Previous») |
| `textPrimary` | `#0D0D0D` | `#FFFFFF` | Text Primary |
| `textSecondary` | `#5D5D5D` | `#CDCDCD` | Text Secondary — ikkilamchi matn, ikonkalar (copy/mic) |
| `textDisabled` | `#8F8F8F` | `#AFAFAF` | Text Tertiary — placeholder («Ask anything»), disabled matn, chevron |
| `border` | `#E8E8E8` | `#414141` | kartochka chegarasi, ajratgich (divider), radio halqasi |
| `borderSubtle` | `#F3F3F3` | `#303030` | ro'yxat ichidagi nozik ajratgich, progress fon |
| `accent` | `#0D0D0D` | `#FFFFFF` | **asosiy tugma** (kit: qora yuborish/ovoz doirasi), faol tab, fokus chegara |
| `accentPressed` | `#303030` | `#E8E8E8` | bosilgan holat |
| `accentSoft` | `#F3F3F3` | `#303030` | tanlangan chip foni (matn `accent`) |
| `onAccent` | `#FFFFFF` | `#0D0D0D` | asosiy tugma matni/ikonkasi |
| `info` | `#0285FF` | `#0285FF` | Accent Blue — tanlangan radio/kun chipi, havola, «Tasdiqlangan» |
| `infoSoft` | `#E6F2FF` | `#0B2A4A` | info pill foni |
| `warning` | `#E25507` | `#FF9E6C` | Accent Orange — «O'lchovda», «Tikuvda», muddat ≤3 kun, limit 80–99% |
| `warningSoft` | `#FDEEE6` | `#3A2416` | warning pill foni |
| `danger` | `#E02E2A` | `#FF8583` | Accent Red — xato, destruktiv, «Bekor qilingan», limit 100% |
| `dangerSoft` | `#FCEAEA` | `#3A1F1F` | danger pill foni |
| `success` | `#008635` | `#40C977` | Accent Green — «Tayyor», «Topshirildi», muvaffaqiyat |
| `successSoft` | `#E6F4EC` | `#14301F` | success pill foni |
| `inverse` | `#0D0D0D` | `#FFFFFF` | snackbar foni, tanlangan chip (inverse) |
| `onInverse` | `#FFFFFF` | `#0D0D0D` | snackbar matni |

`*Soft` qiymatlar: yorug'da aksent rangining oq bilan 10% aralashmasi; qorong'ida `#212121` bilan 25%.
Qorong'i mavzu kit `→ Colors / Dark` sahifasidan (`#212121 / #303030 / #414141`, matn `#FFFFFF / #CDCDCD / #AFAFAF`).

---

## 2. Tipografika (`AppTypography`) — Inter

Shrift: **Inter** (Google Fonts, Latin Extended + Cyrillic), `assets/fonts/Inter-{Regular,Medium,SemiBold,Bold}.ttf`.
Spectral, IBM Plex Sans, IBM Plex Mono — **olib tashlanadi** (pubspec `fonts:` va assets). Tarmoqdan shrift — taqiq.
Kit shkalasi: 12/16 · 14/18 · 16/22 · 18/24 · 20/28 · 24/32 · 30/38 (o'lcham/qator balandligi, px).

| Token | Og'irlik | O'lcham / qator | Qayerda |
|---|---|---|---|
| `displayL` | 600 | 30 / 38 | Login sarlavhasi, bo'sh holat sarlavhasi |
| `displayM` | 600 | 24 / 32 | JAMI summa, statistika raqami |
| `titleL` | 500 | 18 / 24 | AppBar sarlavhasi («ChatGPT 5» uslubi), kartochka ichidagi asosiy nom («Lentil & Spinach Curry») |
| `titleM` | 600 | 16 / 22 | Dialog/sheet sarlavhasi, suggestion chip sarlavhasi, «Choose a pickup point» |
| `titleS` | 600 | 14 / 18 | Ro'yxat satri nomi, mahsulot nomi (karuselda) |
| `bodyL` | 400 | 16 / 22 | Chat xabari (sotuvchi va AI), kartochka tanasi, input matni |
| `bodyM` | 400 | 16 / 22 | `bodyL` bilan bir xil (moslik uchun saqlanadi) |
| `bodyS` | 400 | 14 / 18 | Ikkilamchi matn, chip, dialog tanasi, «Asked Walmart» qatori |
| `labelL` | 500 | 16 / 22 | Tugma matni («Refresh», «Confirm») |
| `labelM` | 500 | 14 / 18 | Kun chipi, tool chip, tab label (11), kichik tugma |
| `labelS` | 500 | 12 / 16 | Status pill, input label, izoh |
| `overline` | 500 | 14 / 18, `textSecondary`, **uppercase emas** | Bo'lim sarlavhasi («Day 1 (Friday)», «Asked Walmart», MATOLAR → «Matolar») |
| `mono` | 500 | 14 / 18, `FontFeature.tabularFigures()` | Buyurtma raqami `ALR-2026-000123` (Inter, mono shrift yo'q) |

- Barcha raqamlar `tabularFigures` majburiy. Mijoz rejimida `body*`/`title*` +2 sp (o'zgarmaydi).
- Letter-spacing hamma joyda 0.

---

## 3. Radius, bo'shliq, soya

| Token | Qiymat | Kit manbasi |
|---|---|---|
| `AppRadius.pill` | 999 | tugma, chip, sotuvchi pufagi (`r=9999`), input pill, «+»/yuborish doirasi, status pill |
| `AppRadius.card` | 20 | kartochka/ro'yxat konteyneri (`MenuList r=20`), dialog, bottom sheet yuqorisi, rasm konteyneri |
| `AppRadius.input` | 16 | suggestion chip (`r=16`), forma input maydoni, snackbar, kun chipi (12 → 16 ga yaxlitlanadi) |
| `AppRadius.avatar` | 8 | ilova avatari 28×28 (`r=8`), harfli avatar |
| `AppRadius.bubble` | pill (999) | sotuvchi xabari — kitda to'liq yumaloq, «dum» yo'q |
| `AppRadius.sheet` | 20 (yuqori) | bottom sheet |
| `AppRadius.small` | 8 | badge, rasm thumbnail (kartochka ichida 88×88 `r=8`) |
| `AppSpacing.xs/s/m/l/xl/xxl` | 4 / 8 / 12 / 16 / 24 / 32 | kit `space-1…8` |
| `AppSpacing.screenH` | 16 | ekran gorizontal padding (`Main Content Area pad 16`) |
| `AppSpacing.chatGap` | 24 | xabarlar orasidagi masofa (`gap=24`) |

Soyalar (kit `→ Shadows`), faqat suzuvchi elementlar uchun:

| Token | Qiymat |
|---|---|
| `AppShadows.sm` | `0 1 2 #101828@5%` |
| `AppShadows.md` | `0 2 4 -2 #101828@10%` + `0 4 6 -1 #000@10%` |
| `AppShadows.lg` | `0 10 15 -3 #000@10%` + `0 4 6 -4 #101828@10%` |

Kartochka, dialog, tab bar — **soya yo'q**, faqat chegara. Soya faqat: pastga scroll tugmasi (`sm`), bottom sheet (`lg`), snackbar (`md`).

---

## 4. Ikonkalar

`lucide_icons_flutter` (o'zgarmaydi), stroke **2.0** (kit vektorlari `w2`), o'lcham 24 (AppBar/input), 20 (kartochka ichi), 16 (inline/meta). Rang: `textPrimary` asosiy, `textSecondary` ikkilamchi. Material filled ikonkalar — taqiq.

---

## 5. Komponent spetsifikatsiyasi (`lib/shared/widgets/`)

Barcha o'lchamlar dp. `Main`, `Walmart`, `Walmart Order`, `Keyboard`, `Rich Layout` frame'laridan.

| Komponent | Spetsifikatsiya |
|---|---|
| **AppBar** | balandlik 44 (+ status bar); fon `background`, **chegara yo'q**; chapda 24px ikonka (orqaga/menyu), 16px keyin sarlavha `titleL` **chapga** tekislangan (markazda pill emas), ixtiyoriy `textDisabled` chevron; o'ngda 24px ikonkalar, orasida 16, o'ng padding 12. Bosqich matni kerak bo'lsa sarlavha ostida `bodyS textSecondary` |
| **Asosiy tugma** | balandlik 44, `pill`, `accent` (qora) fon, `onAccent` `labelL`; bosilgan `accentPressed`; disabled `surfaceDisabled` fon + `textDisabled` matn («Previous»); yuklanmoqda — 16px spinner `onAccent` |
| **Ikkilamchi tugma** | 44, `pill`, `surface` + 1px `border`, `textPrimary` `labelL`; chapda ixtiyoriy 20px ikonka («Refresh») |
| **Matnli tugma** | 44, `info` matn `labelL`, fon yo'q |
| **Destruktiv tugma** | 44, `pill`, `surface` + 1px `border`, `danger` matn; dialogda to'ldirilgan `danger` + oq matn |
| **Ikonka tugma (doira)** | 44×44 `surfaceMuted` doira, 24px ikonka `textPrimary` («+»); kichik varianti 32×32 `accent` doira + `onAccent` ikonka (yuborish/ovoz) |
| **Chat input paneli** | konteyner `background`, padding 12 gorizontal / 8 vertikal, elementlar orasida 8: chapda 44 «+» doira; o'rtada matn pill 44 `surfaceMuted`, chap padding 16, placeholder `bodyL textDisabled` («Xabar yozing…»); pill ichida o'ngda 24px mikrofon `textSecondary` (16 padding) va 32px `accent` doira (matn bo'sh — ovoz to'lqini ikonkasi, matn bor — yuqori strelka). Chegara va soya yo'q. Ko'p qatorli — pill balandligi o'sadi, radius 22 |
| **Suggestion chip** (bo'sh chat) | 72 baland, `surfaceMuted`, `input` radius 16, padding 16×14, `titleM` sarlavha + `bodyS textSecondary` izoh; gorizontal karusel, gap 12, ekran chetidan 12 |
| **Quick-reply chip** | `pill`, `surfaceMuted`, **chegara yo'q**, padding 8×14, `labelM textPrimary`; tanlangan — `inverse` fon + `onInverse` |
| **Kategoriya/kun chipi** | 66×90 (kun) yoki auto (kategoriya), `input` radius, `surface` + 1px `border`; tanlangan — `info` fon + oq matn, chegara yo'q |
| **Tool chip** | `pill`, `surfaceMuted`, padding 6×12, `labelM textSecondary`; chapda 16px ikonka yoki 14px spinner; ustida `bodyS textSecondary` qator («Katalogdan qidirildi») kit «Asked Walmart» uslubida |
| **Sotuvchi xabari** | `surfaceMuted`, `pill`, padding 16×14, `bodyL textPrimary`, max-width 80%, o'ngda |
| **AI xabari** | fon yo'q, `bodyL textPrimary`, to'liq kenglik; ustida ilova qatori: 28×28 avatar (`avatar` radius, Alora logotipi) + 8px + nom `bodyL textSecondary` («Alora») — kit «Walmart» qatori. Xabar ostidagi amal ikonkalari — **yo'q** |
| **«Yozmoqda» indikatori** | kit `Typing`: 3 ta 8px `textDisabled` nuqta pulsatsiya **emas** — TZ §7.7 bo'yicha chiziq saqlanadi: 120×2 `border`, ustida 40px `accent` bo'lak |
| **Kartochka (AppCard)** | `surface` + 1px `border`, `card` radius 20, ichki padding 16; ichki bo'limlar 1px `border` divider bilan (kit `MenuList`) |
| **Karusel kartochkasi** | eni 327 (ekran 390 da), gap 20, chap chetdan 16; ichida sarlavha `overline`, elementlar 88×88 rasm `small` radius + `titleL` nom + `bodyL textSecondary` meta (ikonka 16 + matn) |
| **Mahsulot kartochkasi** | eni 180 (karusel) / grid 2 ustun; `card` radius, rasm 4:5 `small` radius ichki, nom `titleS`, rang doirasi 12 + nom `bodyS textSecondary`, narx `labelL` + birlik `bodyS textSecondary` |
| **Hisob kartochkasi** | `AppCard`; sarlavha `overline`; qator `bodyS`: chapda nom, o'rtada miqdor (`textSecondary`, eni 44), o'ngda summa (eni 82, 500, tabular); bo'limlar divider bilan; JAMI qatori: `titleM` label + `displayM` summa; pastda 2 ta ikkilamchi tugma yonma-yon (gap 8) |
| **Variant kartochkasi** | `card`, padding 16; tanlangan — chapda radio (`info`) + 1.5px `info` chegara |
| **Buyurtma kartochkasi** | `card`; raqam `mono`; status pill o'ngda; muddat `bodyS`: ≤3 kun `warning`, o'tgan `danger`; chap chetidagi rangli chiziq — **olib tashlanadi** |
| **Radio** | 24 doira, 1.5px `border`; tanlangan — 1.5px `info` halqa + 12px `info` nuqta |
| **Input maydoni (forma)** | balandlik 44, `input` radius 16, `surfaceMuted` fon, **chegara yo'q**, padding 16; fokus — 1.5px `accent`; xato — 1.5px `danger` + ostida `labelS danger`; disabled — `surfaceDisabled` + `textDisabled` |
| **Status pill** | `pill`, padding 4×10, `labelS`; fon `*Soft`, matn/nuqta aksent; chapda 8px nuqta (kit narx pili «● €6,95») |
| **Snackbar** | `inverse` fon, `input` radius, `md` soya, `bodyS onInverse`, o'ngda `labelM` amal |
| **Dialog** | `surface`, `card` radius, padding 24, `titleM` sarlavha, `bodyL textSecondary` tana, tugmalar `pill` 44 (asosiy qora + ikkilamchi) |
| **Bottom sheet** | `sheet` radius, `lg` soya, tutqich 36×4 `border`, sarlavha `titleM` |
| **Tab bar** | balandlik 56 + safe area, `background` + yuqorida 1px `border`; ikonka 24 stroke 2, label `labelS`; faol — `accent` (qora); badge — `danger` 8px nuqta |
| **Pastga scroll tugmasi** | 32 doira `surface` + `sm` soya, 16px strelka `textPrimary` |
| **Progress (limit)** | 4px, `borderSubtle` fon; <80% `accent`, 80–99% `warning`, 100% `danger` |
| **Skeleton** | `surfaceMuted` bloklar, radius 12, tinch pulsatsiya 1.2s |
| **Harfli avatar** | 36×36, `avatar` radius, `surfaceMuted` fon, `titleS textPrimary` |
| **Empty/Error state** | markazda 48px ikonka `textDisabled`, `titleM`, `bodyS textSecondary`, ikkilamchi tugma |
| **Ro'yxat satri** | balandlik ≥ 56, padding 16, `titleS` + `bodyS textSecondary`, o'ngda chevron `textDisabled`; satrlar orasida 1px `border` (ichki, chapdan 16) |
| **Bo'lim sarlavhasi (ro'yxat)** | `overline` (`textSecondary`, 14/18), yuqori padding 24, pastki 8 |

---

## 6. Ekranlar (rules §6 ID'lari) — kitga moslash

Kitdagi mos frame ko'rsatilgan; qolganlari §5 komponentlari bilan «kit uslubida» chiziladi.

| ID | Ekran | Kit frame / qoida |
|---|---|---|
| S-01 | Login | Kitda yo'q. Oq fon, yuqorida logotip, `displayL` «Alora», `bodyS textSecondary` izoh; 2 ta `surfaceMuted` input (radius 16), qora asosiy tugma «Kirish», pastda `bodyS textSecondary` «Manager bilan bog'laning» |
| S-02 | Bo'sh chat | `Main (4420:1535)`: AppBar («Alora» + chevron yo'q), markaz bo'sh, pastda 2 qatorli suggestion chip karuseli + input paneli |
| S-03 | Chat matnli oqim | `Walmart (4445:3028)` / `Typing`: pufak, «Asked …» qatori → tool chip ustidagi izoh, AI matni |
| S-04 | Xabar yozilmoqda | `Typing (4420:1859)`: input pill ichida matn, o'ng doira strelka |
| S-05 | Hisob kartochkasi | `Walmart Order (4457:6508)` MenuList uslubi: bo'limlar divider bilan, JAMI + qora «Tasdiqlash» |
| S-06 | Mahsulot karuseli | `Walmart (4445:3028)` karusel: 327 kartochka, 88 rasm, `titleL` nom |
| S-07 | Variantlar / qoralama | `Walmart Order` radio ro'yxati: variant tanlash radio bilan, kun chiplari o'rniga kategoriya chiplari |
| S-08 | Ovozli rejim | Kitda «voice» ekrani yo'q: oq fon, markazda 32→120px `accent` doira to'lqin, pastda ikkilamchi «To'xtatish» |
| S-09 | Mijoz rejimi | S-03 + yuqorida `bodyS textSecondary` «Mijoz rejimi» + 16px qulf; tool chip/usage yashirin |
| S-10 | Suhbatlar ro'yxati | Ro'yxat satri qoidasi; guruh sarlavhasi `overline` («Bugun», «Kecha») |
| S-11…S-15 | Buyurtmalar | Ro'yxat = `AppCard` lar, gap 12; detal = MenuList bo'limlar; forma = `surfaceMuted` inputlar; status o'zgartirish = radio ro'yxat (`Walmart Order` uslubi) |
| S-16…S-18 | Katalog | Kategoriya chiplari (`input` radius, tanlangan `info`), grid 2 ustun mahsulot kartochkasi, filtr = bottom sheet; mahsulot sahifasi — rasm 4:5 `card` radius, nom `displayM`, narx `titleL` |
| S-19…S-21 | Statistika, xodimlar | Statistika raqamlari `displayM` `AppCard` ichida (2 ustun), grafik `fl_chart` — chiziq `accent`, grid `borderSubtle`; xodim satri = ro'yxat satri + `LimitProgressBar` |
| S-22 | Mahsulot CRUD | Forma inputlari `surfaceMuted`; variant kartochkalari `AppCard`; saqlash qora tugma pastda (safe area) |
| S-23, S-24 | Narx qoidalari, bilimlar | MenuList bo'limlar; kalit-qiymat satrlari `titleS` + `bodyL` o'ngda; tahrir — bottom sheet |
| S-25 | Profil | Yuqorida 64px harfli avatar + `titleL` ism + `bodyS` rol; ro'yxat guruhlari `AppCard` (Til, Mavzu, Chiqish `danger`) |
| S-26 | Tizim holatlari | Offline banner — `surfaceMuted` 40px, `bodyS`; Limit — Empty state uslubi; 403/404 — Empty state |

**Qo'shilmaydi** (kitda bor, TZ'da yo'q): drawer/hamburger, model tanlovi («5 ›»), xabar ostidagi copy/like/regenerate ikonkalari, xarita, brend ilova bloklari, «liquid glass» blur, desktop layout.

---

## 7. Golden va tekshiruv

- Barcha golden'lar qayta olinadi (`--update-goldens`), alohida commit, sabab: dizayn tizimi v2 (§19.8).
- `test/widget/a11y` qat'iy: tap target ≥ 48 (44 tugma + 4 padding hisobga olinadi — `AppButton` tashqi 2px padding), kontrast: `textSecondary #5D5D5D` oq fonda 7.4:1 ✓, `textDisabled #8F8F8F` 3.5:1 — placeholder/disabled uchun ruxsat (WCAG istisno), **matn uchun ishlatilmaydi**.
- `tool/check_build_len.py`, `dart analyze --fatal-infos`, `custom_lint`, `tool/format_check.sh` yashil.
