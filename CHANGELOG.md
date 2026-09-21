# Changelog

Loyihadagi barcha muhim o'zgarishlar shu faylda yoziladi (o'zbekcha, Conventional Commits bo'yicha).

## 1.0.3+4 (2026-09-21)

- **fix(auth)**: logout/akkaunt almashganda eski foydalanuvchi suhbatlari va keshi tozalanadi
- **fix(orders)**: muddat o'rniga yaratilgan sana; buyurtma tafsiloti to'liq
- **fix(management,profile)**: sarf/limit ekranlari yangilanadi, 0 = cheklov yo'q, pull-to-refresh
- **fix(core)**: oflayn navbat Hive adapteri ilovada ro'yxatdan o'tkazildi (crash)

## 1.0.2+3 (2026-09-21)

- **fix(chat)**: qayta ochganda tarix tartibi va yo'qolgan xabarlar — server tartibi saqlanadi, id bo'yicha dedupe, kesh birlashuvi, `page_size=100` + scroll'da eski xabarlar
- **fix(chat)**: qoralama kartasida qizil "to'ldirish kerak" ro'yxati olib tashlandi; maydon to'lmagan bo'lsa "Buyurtma yaratish" formani ochadi
- **feat(orders)**: buyurtma tafsiloti to'liq — bo'laklar (mato, SKU, o'lcham, maydon, narx), aksessuarlar, xizmatlar, chegirma/yetkazish/avans/qoldiq
- **feat(profile)**: versiya pubspec'dan avtomatik ko'rsatiladi (debug build'da ham)

## 1.0.1+2 (2026-09-21)

- **fix(chat,orders)**: chat qoralamasidan buyurtma yaratish — Go agent `missing` kaliti o'qiladi, yetkazib berish `delivery` flagga aylanadi, `room_name` bo'lmasa "Xona N", o'lchovsiz qoralamada tugmalar o'chadi (bo'sh buyurtma yaratilmaydi)

## 1.0.0 (2026-09-18)

- **fix(core,security)**: 2026-09-19 audit — `settings` box ochilmay ilova ishga tushmasdi (tuzatildi), Hive keshi AES bilan shifrlandi (schemaVersion 2), logout'da suhbat/xabar keshi tozalanadi, refresh tarmoq xatosida sessiya saqlanadi, SSE 4xx/429 qayta urinilmaydi va xom xato ko'rsatilmaydi, VoiceSocket URI kodlash/dispose/`ready`, PIN qulfi saqlanadi, Android `allowBackup=false`, release'da cleartext yo'q
- **refactor(presentation)**: `build()` ≤ 80 qator — 13.10 yakunlandi (`tool/check_build_len.py`)

- **test(chat)**: chat uchun to'liq test to'plami; boshqaruv l10n/hardcode tozalash
- **feat(management,profile)**: boshqaruv va profil karkasi — Bosqich 10–13 (jarayonda)
- **feat(orders)**: buyurtmalar bo'limi — Bosqich 9; PaymentStatus backend bilan moslashtirildi
- **feat(catalog)**: katalog, filtr va mahsulot sahifasi — Bosqich 8; haqiqiy shriftlar
- **feat(conversations,chat)**: suhbatlar ro'yxati va chat karkasi — Bosqich 5, 6–7 (jarayonda)
- **feat(auth,router)**: kirish oqimi va navigatsiya — Bosqich 3–4
- **test(core,shared)**: widget va core testlarini to'ldirish — 1.24, 2.19
- **feat(core,theme)**: dizayn tizimi, umumiy widgetlar va core qatlam — Bosqich 1–2
- **feat(app)**: loyiha poydevori — Bosqich 0
