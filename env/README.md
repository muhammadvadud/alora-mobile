# Environment konfiguratsiyasi

Ilovani ishga tushirishda quyidagi kabi `--dart-define-from-file` parametrini ishlating:

```bash
flutter run --dart-define-from-file=env/dev.json
```

## lan.json
Real telefon (bir Wi-Fi) uchun: kompyuter LAN IP (nginx 80-port). IP o'zgarsa faylni yangilang.

## VERBOSE_LOGS flagi
`VERBOSE_LOGS` flagi (`true`/`false`) ilovada batafsil tarmoq va debug loglarini yoqish uchun ishlatiladi. `lan.json`, `staging.json`, `prod.json` kabi fayllarda PII (shaxsiy ma'lumotlar) logcat'ga chiqib ketmasligi uchun bu flag `false` (yoki ko'rsatilmagan) bo'lishi kerak. Faqat `dev.json` da lokal rivojlantirish uchun `true` qilib qo'yilgan.
