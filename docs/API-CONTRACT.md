# Alora Mobil — API shartnomasi (API-CONTRACT.md)

> Manbalar: `rules.md` §8, backend `docs/API-GUIDE.md`, backend kod (`apps/*/views.py`,
> `apps/*/serializers.py`, `apps/*/urls.py`). Haqiqiy maydon nomlari backend'dan olingan.
>
> Base URL: `https://<host>/api/v1`. Barcha endpoint'lar `ApiPaths` klassida (`core/network/api_paths.dart`).
> Widget yoki repository ichida string yo'l yozish — taqiq.

---

## 1. Autentifikatsiya

### 1.1 `POST /api/v1/auth/login/`

Tizimga kirish. Rate limit: 5 daqiqada 5 ta so'rov.

**So'rov:**
```json
{
  "phone": "+998901234567",
  "password": "secret123"
}
```

**Javob (200):**
```json
{
  "access": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "refresh": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

**Xato (401):**
```json
{
  "detail": "Kirish ma'lumotlari noto'g'ri",
  "code": "authentication_failed",
  "errors": {}
}
```

**Xato (429):**
```json
{
  "detail": "So'rovlar soni cheklangan",
  "code": "throttled",
  "errors": {}
}
```

### 1.2 `POST /api/v1/auth/refresh/`

Token yangilash (rotation). `access` 15 daqiqa, `refresh` 30 kun.

**So'rov:**
```json
{
  "refresh": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

**Javob (200):**
```json
{
  "access": "eyJ...",
  "refresh": "eyJ..."
}
```

> Eski refresh token blacklist'ga tushadi (rotation).

### 1.3 `POST /api/v1/auth/logout/`

Tizimdan chiqish (tokenni blacklist'ga kiritish).

**So'rov:**
```json
{
  "refresh": "eyJ..."
}
```

**Javob (205):** bo'sh body.

### 1.4 `GET /api/v1/auth/me/`

Joriy foydalanuvchi ma'lumotlari. Auth talab qilinadi.

**Javob (200):**
```json
{
  "profile": {
    "id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
    "phone": "+998901234567",
    "full_name": "Aziz Karimov",
    "role": "manager",
    "tenant": "f47ac10b-58cc-4372-a567-0e02b2c3d479",
    "device_id": "fcm-device-token-string"
  },
  "limit": {
    "id": "...",
    "user_id": "...",
    "period": "daily",
    "is_unlimited": false,
    "max_tokens": 50000,
    "max_cost_uzs": "100000.00",
    "max_messages": 200,
    "on_exceed": "block",
    "is_active": true
  }
}
```

> `limit` `null` bo'lishi mumkin (limit o'rnatilmagan). `device_id` — FCM token.

---

## 2. Jamoa (xodimlar)

> Faqat `manager`/`admin`. Employee adminni ko'rmaydi.

### 2.1 `GET /api/v1/team/employees/`

**Javob (200):**
```json
[
  {
    "id": "a1b2c3d4-...",
    "phone": "+998901234567",
    "full_name": "Aziz Karimov",
    "role": "employee",
    "is_active": true,
    "last_login": "2026-09-16T10:30:00Z",
    "created_at": "2026-09-01T08:00:00Z",
    "today_tokens": 1234,
    "today_messages": 15,
    "today_conversations": 3
  }
]
```

### 2.2 `POST /api/v1/team/employees/`

**So'rov:**
```json
{
  "phone": "+998911234567",
  "full_name": "Dilshod Aliyev",
  "password": "temp123",
  "role": "employee",
  "is_active": true
}
```

**Javob (201):** 2.1 dagi formatda.

### 2.3 `GET/PATCH /api/v1/team/employees/{id}/`

Patched qisman yangilash. `password` ixtiyoriy — yangilansa parol o'zgaradi.

### 2.4 `DELETE /api/v1/team/employees/{id}/`

**Javob:** 204 bo'sh.

### 2.5 `POST /api/v1/team/employees/{id}/limit/`

Xodim limitini o'rnatish.

**So'rov:**
```json
{
  "is_unlimited": false,
  "period": "daily",
  "max_tokens": 50000,
  "max_cost_uzs": "100000.00",
  "max_messages": 200,
  "on_exceed": "block",
  "is_active": true
}
```

> `is_unlimited: true` — cheksiz rejim. Barcha maydonlar ixtiyoriy.

**Javob (200):**
```json
{
  "id": "...",
  "user_id": "...",
  "period": "daily",
  "is_unlimited": false,
  "max_tokens": 50000,
  "max_cost_uzs": "100000.00",
  "max_messages": 200,
  "on_exceed": "block",
  "is_active": true
}
```

### 2.6 `GET /api/v1/team/employees/{id}/conversations/`

Xodimning suhbatlar ro'yxati.

**Javob (200):**
```json
[
  {
    "id": "...",
    "session_id": "uuid-v4",
    "title": "Mehmonxona pardasi",
    "status": "active",
    "stage": "calc",
    "mode": "seller",
    "last_message_at": "2026-09-16T12:00:00Z",
    "started_at": "2026-09-16T10:00:00Z"
  }
]
```

---

## 3. Katalog

### 3.1 `GET /api/v1/catalog/categories/`

Barcha kategoriyalar (tenant bo'yicha).

**Javob (200):** Cursor pagination (§8). Har element:
```json
{
  "id": "...",
  "name": "Matolar",
  "slug": "matolar",
  "parent": null,
  "sort_order": 1,
  "is_active": true,
  "created_at": "...",
  "updated_at": "..."
}
```

### 3.2 `GET /api/v1/catalog/products/`

Mahsulotlar ro'yxati. Filtrlar:

| Parametr | Turi | Misol |
|---|---|---|
| `category` | UUID | `?category=a1b2...` |
| `style` | string | `?style=klassik` |
| `room` | string | `?room=mehmonxona` |
| `segment` | string | `?segment=economy` |
| `price_unit` | string | `?price_unit=per_sqm` |
| `search` | string | `?search=velvet` |
| `min_price` | number | `?min_price=50000` |
| `max_price` | number | `?max_price=500000` |

**Javob (200):** Cursor pagination. Har element:
```json
{
  "id": "...",
  "category": "uuid",
  "category_data": { "id": "...", "name": "Matolar", "slug": "matolar" },
  "name": "Velvet Milano",
  "code": "VM-001",
  "description": "Zamonaviy xuruş...",
  "fabric_type": "velvet",
  "pattern": "yassi",
  "style": "klassik",
  "transparency": "yopiq",
  "density": "ogir",
  "composition": "100% polyester",
  "care": "Yuvish 30C",
  "recommended_rooms": ["mehmonxona", "yotoqxona"],
  "recommended_coef": 2.5,
  "default_width_m": 2.8,
  "is_sewing_required": true,
  "segment": "standard",
  "tags": ["klassik", "velvet"],
  "sort_order": 1,
  "is_active": true,
  "variants": [
    {
      "id": "...",
      "sku": "VM-GR-001",
      "color_name": "Grafit",
      "color_hex": "#4A4A4A",
      "width_m": 2.8,
      "price": "180000.00",
      "price_unit": "per_sqm",
      "old_price": null,
      "cost_price": "95000.00",
      "is_active": true,
      "images": [
        {
          "id": "...",
          "product": "...",
          "variant": "...",
          "image": "https://...",
          "alt": "Grafit rang",
          "sort_order": 1,
          "is_primary": true,
          "is_active": true
        }
      ],
      "created_at": "...",
      "updated_at": "..."
    }
  ],
  "images": [],
  "created_at": "...",
  "updated_at": "..."
}
```

> `cost_price` faqat admin uchun — boshqa rollarda response'dan chiqariladi.

### 3.3 `GET /api/v1/catalog/products/{id}/`

Bitta mahsulot. Format 3.2 dagi bitta element bilan bir xil.

### 3.4 `POST/PATCH/DELETE /api/v1/catalog/products/{id}/`

Yaratish/yangilash/o'chirish (manager/admin).

**POST So'rov (yaratish):**
```json
{
  "category": "uuid-category",
  "name": "Yangi mahsulot",
  "code": "YM-001",
  "fabric_type": "linen",
  "style": "zamonaviy",
  "recommended_rooms": ["oshxona"],
  "recommended_coef": 2.0,
  "default_width_m": 2.5,
  "is_sewing_required": true,
  "segment": "standard"
}
```

### 3.5 `GET/PATCH/DELETE /api/v1/catalog/variants/{id}/`

Variant CRUD. PATCH qisman yangilash.

**PATCH So'rov:**
```json
{
  "price": "195000.00",
  "is_active": true
}
```

### 3.6 `POST /api/v1/catalog/variants/bulk-price/`

Bir nechta variant narxini bir vaqtda o'zgartirish.

**So'rov:**
```json
{
  "variant_ids": ["uuid1", "uuid2"],
  "value": 15.0,
  "type": "percent"
}
```

> `type`: `"percent"` (foiz) yoki `"amount"` (so'm miqdori).

**Javob (200):**
```json
{
  "updated": 2
}
```

### 3.7 `POST /api/v1/catalog/products/{id}/images/`

Rasm yuklash (multipart/form-data).

**So'rov (form-data):**
- `image`: fayl (required)
- `variant_id`: UUID (ixtiyoriy)
- `alt`: string (ixtiyoriy)
- `is_primary`: boolean (default false)

**Javob (201):** 3.2 dagi `images` formatida.

### 3.8 `DELETE /api/v1/catalog/images/{id}/`

Rasmni o'chirish. **Javob:** 204 bo'sh.

### 3.9 `GET/POST/PATCH/DELETE /api/v1/catalog/fasons/`

Fasonlar CRUD.

**GET Javob:**
```json
[
  {
    "id": "...",
    "name": "Klassik parda",
    "style": "klassik",
    "rooms": ["mehmonxona"],
    "image": "https://...",
    "part_count": 3,
    "is_active": true,
    "parts": [
      {
        "id": "...",
        "role": "portyera",
        "name": "Asosiy parda",
        "width_share": 0.7,
        "height_share": 1.0,
        "default_coef": 2.5,
        "sort_order": 1
      }
    ],
    "accessories": [
      {
        "id": "...",
        "category": "uuid",
        "default_qty": 10,
        "qty_formula": "cornice_length * 2"
      }
    ]
  }
]
```

---

## 4. Buyurtmalar

### 4.1 `GET /api/v1/orders/`

Buyurtmalar ro'yxati. Filtrlar:

| Parametr | Turi | Misol |
|---|---|---|
| `status` | enum | `?status=draft` |
| `user` | UUID | `?user=uuid` |
| `date` | date | `?date=2026-09-16` |
| `date_from` | date | `?date_from=2026-09-01` |
| `date_to` | date | `?date_to=2026-09-30` |
| `search` | string | `?search=ALR-001` |

**Javob (200):** Cursor pagination. Har element:
```json
{
  "id": "...",
  "number": "ALR-2026-000123",
  "conversation": "uuid",
  "customer_name": "Karimova Nilufar",
  "customer_phone": "+998901234567",
  "address": "Toshkent, Beruniy ko'chasi 45",
  "status": "confirmed",
  "status_display": "Tasdiqlangan",
  "subtotal": "2748000.00",
  "discount_percent": "5.00",
  "discount_amount": "137400.00",
  "discount_source": "manual",
  "discount_source_display": "Qo'lda",
  "delivery_amount": "50000.00",
  "total": "2660600.00",
  "prepayment_percent": "50.00",
  "prepayment": "1330300.00",
  "balance": "1330300.00",
  "payment_status": "prepaid",
  "payment_status_display": "Avans berilgan",
  "deadline_date": "2026-09-30",
  "note": "Eshik yaqiniga o'rnatish",
  "confirmed_by": { "id": "...", "full_name": "Manager", "phone": "+998..." },
  "confirmed_at": "2026-09-16T11:00:00Z",
  "user": { "id": "...", "full_name": "Sotuvchi", "phone": "+998..." },
  "measurements": [
    {
      "id": "...",
      "room_name": "Mehmonxona",
      "cornice_length_m": "4.200",
      "height_m": "2.600",
      "layers": ["portyera", "tul"],
      "coefficient": "2.500",
      "note": "",
      "parts": [
        {
          "id": "...",
          "variant": {
            "id": "...", "sku": "VM-GR-001",
            "color_name": "Grafit", "product_name": "Velvet Milano",
            "price_unit": "per_sqm"
          },
          "role": "portyera",
          "width_m": "4.200",
          "height_m": "2.600",
          "coefficient": "2.500",
          "area_sqm": "27.300",
          "price_per_sqm": "180000.00",
          "total": "4914000.00",
          "sort_order": 1
        }
      ],
      "accessories": [
        {
          "id": "...",
          "variant": { "id": "...", "sku": "KR-001", "color_name": "Oq", "product_name": "Klip", "price_unit": "per_piece" },
          "qty": "12.000",
          "unit": "dona",
          "unit_price": "3000.00",
          "total": "36000.00",
          "sort_order": 1
        }
      ]
    }
  ],
  "items": [
    {
      "id": "...",
      "service_key": "sewing",
      "name_snapshot": "Tikish",
      "qty": "1.000",
      "unit": "dona",
      "unit_price": "150000.00",
      "total": "150000.00",
      "sort_order": 1
    }
  ],
  "created_at": "...",
  "updated_at": "..."
}
```

### 4.2 `POST /api/v1/orders/`

Buyurtma yaratish (AI draft'idan).

**So'rov:**
```json
{
  "customer_name": "Karimova Nilufar",
  "customer_phone": "+998901234567",
  "address": "Toshkent, Beruniy ko'chasi 45",
  "note": "Eshik yaqiniga o'rnatish",
  "deadline_date": "2026-09-30",
  "prepayment_percent": "50.00",
  "discount_percent": "5.00",
  "delivery": true,
  "services": ["sewing", "installation"],
  "conversation_id": "uuid",
  "measurements": [
    {
      "room_name": "Mehmonxona",
      "cornice_length_m": "4.200",
      "height_m": "2.600",
      "coefficient": "2.500",
      "layers": ["portyera", "tul"],
      "note": "",
      "parts": [
        {
          "variant_id": "uuid",
          "role": "portyera",
          "width_m": "4.200",
          "height_m": "2.600",
          "coefficient": "2.500"
        }
      ],
      "accessories": [
        {
          "variant_id": "uuid",
          "qty": "12.000"
        }
      ]
    }
  ]
}
```

**Javob (201):** 4.1 formatida.

### 4.3 `PATCH /api/v1/orders/{id}/`

Buyurtmani qisman yangilash. So'rov formati 4.2 bilan bir xil, faqat qisman.

### 4.4 `POST /api/v1/orders/{id}/confirm/`

Buyurtmani tasdiqlash (draft → confirmed). Bo'sh body.

**Javob (200):** 4.1 formatida.

**Xato (400):**
```json
{
  "detail": "Tasdiqlash mumkin emas",
  "code": "validation_error",
  "errors": {}
}
```

### 4.5 `POST /api/v1/orders/{id}/status/`

Statusni o'zgartirish.

**So'rov:**
```json
{
  "status": "production",
  "note": "Tikish boshlandi",
  "action_date": "2026-09-17"
}
```

> `status` qiymatlari: `draft`, `confirmed`, `measuring`, `production`, `ready`, `installing`, `completed`, `cancelled`.
> `note` va `action_date` ixtiyoriy.

**Javob (200):** 4.1 formatida.

### 4.6 `GET /api/v1/orders/statuses/`

Status ro'yxati va ruxsat etilgan o'tishlar.

**Javob (200):**
```json
{
  "statuses": [
    { "code": "draft", "label": "Qoralama" },
    { "code": "confirmed", "label": "Tasdiqlangan" },
    ...
  ],
  "transitions": {
    "draft": ["confirmed", "cancelled"],
    "confirmed": ["measuring", "cancelled"],
    "measuring": ["production", "cancelled"],
    "production": ["ready", "cancelled"],
    "ready": ["installing"],
    "installing": ["completed"],
    "completed": [],
    "cancelled": []
  }
}
```

### 4.7 `GET /api/v1/orders/{id}/pdf/`

Kommercheskiy taklif PDF fayli.

**Javob (200):** `Content-Type: application/pdf`, `Content-Disposition: attachment; filename="order-ALR-2026-000123.pdf"`.

**Xato (503):**
```json
{
  "detail": "PDF yaratib bo'lmadi",
  "code": "pdf_unavailable",
  "errors": {}
}
```

---

## 5. Hisob-kitob (Pricing)

### 5.1 `POST /api/v1/pricing/calc/preview/`

Kalkulyatsiya preview'i. Barcha rollar.

**So'rov:**
```json
{
  "measurements": [
    {
      "length": "4.200",
      "height": "2.600",
      "parts": [
        {
          "variant_id": "uuid",
          "role": "portyera",
          "width_m": "4.200",
          "height_m": "2.600",
          "coef": "2.500"
        }
      ],
      "accessories": [
        {
          "variant_id": "uuid-klip",
          "qty": "12.000"
        }
      ]
    }
  ],
  "services": ["sewing"],
  "discount_percent": "5.00",
  "delivery": true
}
```

**Javob (200):**
```json
{
  "measurements": [
    {
      "room_name": "...",
      "parts": [
        {
          "role": "portyera",
          "variant_id": "...",
          "color_name": "Grafit",
          "width_m": "4.200",
          "height_m": "2.600",
          "coef": "2.500",
          "area_sqm": "27.300",
          "price_per_sqm": "180000.00",
          "total": "4914000.00"
        }
      ],
      "accessories": [
        {
          "variant_id": "...",
          "color_name": "Oq",
          "qty": "12.000",
          "unit_price": "3000.00",
          "total": "36000.00"
        }
      ]
    }
  ],
  "services": [
    {
      "key": "sewing",
      "name": "Tikish",
      "total": "150000.00"
    }
  ],
  "subtotal": "5064000.00",
  "tier_discount_percent": "0.00",
  "manual_discount_percent": "5.00",
  "discount_percent": "5.00",
  "discount_amount": "253200.00",
  "delivery_amount": "50000.00",
  "total": "4860800.00",
  "warnings": ["Kant bo'lagida chiqindi 22%"]
}
```

### 5.2 `GET/PATCH /api/v1/pricing/calc-rules/`

Hisob qoidalari (manager/admin). PATCH — massiv yoki yagona.

**GET Javob:**
```json
[
  {
    "id": "...",
    "key": "waste_percent",
    "value": "22.00",
    "unit": "%",
    "description": "Chiqindi foizi",
    "applies_to": "fabric",
    "is_active": true,
    "created_at": "...",
    "updated_at": "..."
  }
]
```

**PATCH So'rov (yakka):**
```json
{
  "key": "waste_percent",
  "value": "20.00"
}
```

**PATCH So'rov (massiv):**
```json
{
  "items": [
    { "key": "waste_percent", "value": "20.00" },
    { "key": "min_area", "value": "0.5" }
  ]
}
```

### 5.3 `GET /api/v1/pricing/calc-rules/{key}/`

Bitta qoida. `key` — string (masalan `waste_percent`).

### 5.4 `GET/PATCH /api/v1/pricing/services/`

Xizmat narxlari. Format 5.2 bilan bir xil (list/uple).

**GET Javob:**
```json
[
  {
    "id": "...",
    "key": "sewing",
    "name": "Tikish",
    "price": "150000.00",
    "unit": "dona",
    "is_active": true,
    "created_at": "...",
    "updated_at": "..."
  }
]
```

### 5.5 `GET/PATCH /api/v1/pricing/discount-policy/`

Chegirma siyosati (singleton).

**GET Javob:**
```json
{
  "id": "...",
  "manual_max_percent_employee": "5.00",
  "manual_max_percent_manager": "15.00",
  "stack_with_tier": false,
  "created_at": "...",
  "updated_at": "..."
}
```

### 5.6 `GET/PATCH /api/v1/pricing/order-defaults/`

Buyurtma standartlari (singleton).

**GET Javob:**
```json
{
  "id": "...",
  "prepayment_percent": "50.00",
  "delivery_amount": "50000.00",
  "deadline_days": 14,
  "created_at": "...",
  "updated_at": "..."
}
```

### 5.7 `GET/POST/PATCH/DELETE /api/v1/pricing/discount-tiers/`

Chegirma bosqichlari (CRUD).

**GET Javob:**
```json
[
  {
    "id": "...",
    "min_amount": "5000000.00",
    "percent": "3.00",
    "is_active": true,
    "created_at": "...",
    "updated_at": "..."
  }
]
```

### 5.8 `GET/POST/PATCH/DELETE /api/v1/pricing/model-pricings/`

Model narxlari (faqat admin). CRUD.

**GET Javob:**
```json
[
  {
    "id": "...",
    "provider": "openai",
    "model": "gpt-4o",
    "input_per_1m": "2.50",
    "output_per_1m": "10.00",
    "cached_input_per_1m": "1.25",
    "stt_per_minute": "0.006",
    "tts_per_1k_chars": "0.015",
    "usd_to_uzs": "12800.00",
    "is_active": true,
    "created_at": "...",
    "updated_at": "..."
  }
]
```

---

## 6. Suhbat (Chat)

### 6.1 `GET /api/v1/conversations/`

Suhbatlar ro'yxati (cursor pagination).

**Javob (200):**
```json
[
  {
    "id": "...",
    "session_id": "uuid-v4",
    "title": "Mehmonxona pardasi",
    "mode": "seller",
    "status": "active",
    "stage": "calc",
    "order": "uuid-or-null",
    "started_at": "2026-09-16T10:00:00Z",
    "last_message_at": "2026-09-16T12:30:00Z",
    "created_at": "...",
    "updated_at": "..."
  }
]
```

> `stage` qiymatlari: `need`, `recommend`, `measure`, `calc`, `variants`, `order`.

### 6.2 `POST /api/v1/conversations/`

Yangi suhbat yaratish.

**So'rov:**
```json
{}
```

**Javob (201):** 6.1 formatida.

### 6.3 `GET/DELETE /api/v1/conversations/{id}/`

GET — tafsilotlar, DELETE — arxivlash.

### 6.4 `POST /api/v1/conversations/{id}/reset/`

Kontekstni tozalash.

**Javob (200):**
```json
{
  "status": "Kontekst tozalandi."
}
```

### 6.5 `GET /api/v1/conversations/{id}/transcript/`

Suhbatning to'liq transkripti.

**Javob (200):** Transkript formati backend tomonidan belgilanadi.

### 6.6 `GET /api/v1/conversations/{id}/messages/`

Suhbat xabarlarini olish (cursor pagination).

**Javob (200):** Cursor pagination. Har element:
```json
{
  "id": "...",
  "role": "user",
  "content": "Mehmonxona uchun parda kerak",
  "tool_calls": null,
  "tool_result": null,
  "audio_url": null,
  "created_at": "2026-09-16T10:00:00Z"
}
```

> `role`: `user`, `assistant`, `tool`, `system`.

### 6.7 `POST /api/v1/conversations/{id}/messages/`

Yangi xabar yuborish → SSE stream (§6.8 ga qara).

**So'rov:**
```json
{
  "content": "Mehmonxona uchun parda kerak, klassik uslubda",
  "locale": "uz",
  "context": {
    "customer_mode": false,
    "stage": "need"
  }
}
```

**Javob:** `Content-Type: text/event-stream` (§6.8).

---

## 7. SSE oqimi (chat streaming)

Backend `POST /api/v1/conversations/{id}/messages/` so'roviga
`text/event-stream` formatida javob qaytaradi.

### 7.1 Freym formati

Har bir voqea qator:
```
data: {"kind": "start"}

data: {"kind": "content", "content": "Salom! "}

data: {"kind": "done", "usage": {...}, "products": [...]}
```

### 7.2 `kind` turlari

| kind | Maydonlar | Ma'no |
|---|---|---|
| `start` | — | AI javobni boshladi |
| `thinking` | — | AI o'ylashni boshladi |
| `content` | `content` (string) | Matn tokenlari kelyapti |
| `tool_call` | `tool` (string) | AI asbob ishlatmoqchi |
| `tool_args` | `tool` (string), `args` (JSON) | Asbob argumentlari kelyapti |
| `tool_result` | `tool` (string), `result` (JSON string) | Asbob natijasi |
| `stage` | `content` (string), `result` (JSON) | Suhbat bosqichi o'zgardi (mobilga o'tadi) |
| `done` | `usage` (object), `products` (array, ixtiyoriy) | Javob tugadi |
| `error` | `detail` yoki `error` (string) | Xatolik yuz berdi |

### 7.3 `done` freymi namunasi

```json
{
  "kind": "done",
  "usage": {
    "provider": "openai",
    "model": "gpt-4o",
    "prompt_tokens": 1234,
    "completion_tokens": 567,
    "cached_tokens": 200,
    "reasoning_tokens": 0,
    "stt_seconds": 0,
    "tts_chars": 0,
    "tool_calls_json": null,
    "latency_ms": 3200
  },
  "products": [
    {
      "id": "...",
      "name": "Velvet Milano",
      "variant_id": "...",
      "color_name": "Grafit",
      "price": "180000.00",
      "price_unit": "per_sqm",
      "image_url": "https://..."
    }
  ]
}
```

### 7.4 `tool_result` natijalari

`tool` nomiga qarab `result` JSON parse qilinadi:
- `product_search` → `ProductCard[]` massivi
- `curtain_calculate` → `QuoteCard` (hisob kartochkasi)
- `price_quote` / `variants` → `OptionsCard` (variantlar)
- `order_draft` → `OrderDraftCard` (buyurtma qoralamasi)

Parse xatosi → chip "Natija" ko'rinishida, xabar oqimi davom etadi.

### 7.5 Xolatlar

- Buzilgan frame — o'tkazib yuboriladi, log'ga yoziladi, oqim to'xtamaydi.
- Uzilish: 3 marta qayta urinish (1s, 2s, 4s). Qisman kelgan matn saqlanadi.
- `done` yoki `error` — oqim yopiladi.
- Foydalanuvchi ekranni tark etsa — `CancelToken` bilan bekor qilinadi.
- Bir vaqtda bitta faol stream.

---

## 8. WebSocket (ovoz)

> rules.md §8.6 asosida. Backend `apps/chat/consumers.py` (`VoiceChatConsumer`).

### 8.1 URL

```
ws(s)://<host>/ws/voice/{conversation_id}/?locale=uz
```

### 8.2 Auth — ochiq masala

Backend hozir `AuthMiddlewareStack` (session) ishlatadi, JWT'ni WS'da
qabul qilmaydi → mobil ilova ulanolmaydi (1008 bilan yopiladi).
Backend jamoasi JWT middleware qo'shishi shart.

### 8.3 Mijoz → Server

| Tur | Format | Tavsif |
|---|---|---|
| Audio bo'lak | **binary frame** | PCM16/Opus 16 kHz mono, 200 ms |
| Gap tugallandi | text frame `{"kind":"end"}` | Yangi gap boshlanishini bildiradi |

### 8.4 Server → Mijoz

| Tur | Format | Tavsif |
|---|---|---|
| Audio | **binary frame** | `just_audio` ga chunk |
| STT natijasi | text frame | `{"kind":"transcript","content":"..."}` (qisman) |
| AI matni | text frame | `{"kind":"content","content":"..."}` |
| Tugadi | text frame | `{"kind":"done"}` |
| Xato | text frame | `{"kind":"error","error":"..."}` (server 1011 bilan yopadi) |

> `kind` maydoni (`type` emas). Noma'lum `kind` — e'tibor berilmaydi.

### 8.5 Barge-in

Mikrofon VAD gap sezsa → `just_audio.stop()` lokal + `{"kind":"end"}`
yuborib yangi gap boshlanadi.

---

## 9. Bilimlar bazasi

### 9.1 `GET /api/v1/knowledge/rules/`

**Javob (200):**
```json
[
  {
    "id": "...",
    "kind": "fabric",
    "condition": "Mehmonxona uchun",
    "recommendation": "Yog'ga chidamli matolarni tavsiya qiling",
    "priority": 1,
    "is_active": true,
    "created_at": "...",
    "updated_at": "..."
  }
]
```

### 9.2 `POST /api/v1/knowledge/rules/`

**So'rov:**
```json
{
  "kind": "fabric",
  "condition": "Oshxona uchun",
  "recommendation": "Easily cleaned fabrics",
  "priority": 2,
  "is_active": true
}
```

> `kind` va `recommendation` majburiy.

### 9.3 `PATCH /api/v1/knowledge/rules/{id}/`

Qisman yangilash.

### 9.4 `DELETE /api/v1/knowledge/rules/{id}/`

**Javob:** 204 bo'sh.

---

## 10. Statistika

### 10.1 `GET /api/v1/usage/summary/`

Kunlik/haftalik/oylik xulosa. Manager/admin.

**Parametrlar:** `?period=day|week|month&user=<uuid>` (user ixtiyoriy).

**Javob (200):**
```json
{
  "period": "day",
  "date_from": "2026-09-16",
  "date_to": "2026-09-16",
  "tokens": 15234,
  "cost_uzs": "45702.00",
  "messages": 87,
  "conversations": 12
}
```

### 10.2 `GET /api/v1/usage/by-user/`

Xodimlar bo'yicha reyting.

**Parametrlar:** `?period=day|week|month`

**Javob (200):**
```json
[
  {
    "user_id": "...",
    "full_name": "Aziz Karimov",
    "tokens": 8500,
    "cost_uzs": "25500.00",
    "messages": 45,
    "conversations": 7
  }
]
```

### 10.3 `GET /api/v1/usage/conversations/`

Eng qimmat suhbatlar.

**Javob (200):**
```json
[
  {
    "conversation_id": "...",
    "cost_uzs": "85000.00",
    "tokens": 25000,
    "messages": 34
  }
]
```

### 10.4 `GET /api/v1/analytics/conversion/`

Suhbatdan buyurtmaga konversiya.

**Javob (200):**
```json
{
  "total_conversations": 150,
  "with_order": 45,
  "conversion_rate": "30.00"
}
```

---

## 11. Sozlamalar (faqat admin)

### 11.1 `GET /api/v1/settings/prompt/`

Joriy prompt versiyasi va tarix.

**Javob (200):**
```json
{
  "current": {
    "id": "...",
    "version": 5,
    "content": "Sen Alora AI yordamchisan...",
    "author": "uuid",
    "author_name": "Admin",
    "is_current": true,
    "created_at": "2026-09-16T10:00:00Z"
  },
  "history": [
    {
      "id": "...",
      "version": 4,
      "content": "Eski prompt...",
      "author": "uuid",
      "author_name": "Admin",
      "is_current": false,
      "created_at": "2026-09-15T10:00:00Z"
    }
  ]
}
```

### 11.2 `POST /api/v1/settings/prompt/`

Yangi prompt versiyasi yaratish.

**So'rov:**
```json
{
  "content": "Sen Alora AI yordamchisan. Sotuvchiga yordam berasan..."
}
```

**Javob (201):** Versiya formatida.

### 11.3 `POST /api/v1/settings/prompt/{version}/rollback/`

Eski versiyaga qaytish.

**Javob (200):** Yangi versiya formatida (qaytarilgan versiya `is_current: true`).

---

## 12. Xato formati

Barcha xatolar yagona formatda:
```json
{
  "detail": "Xabar matni (o'zbekcha)",
  "code": "error_code",
  "errors": {
    "maydon_nomi": "Xato tafsiloti"
  }
}
```

### 12.1 HTTP kodlari

| HTTP | Code | UI |
|---|---|---|
| Tarmoq yo'q, timeout | — | `OfflineBanner` yoki `ErrorState(onRetry)` |
| 400 | `validation_error` | Maydon ostida `errorText` |
| 401 (refresh'dan keyin ham) | `not_authenticated` | Login'ga |
| 403 | `permission_denied` | "Ruxsat yo'q" ekrani |
| 404 | `not_found` | "Topilmadi" |
| 429 | `throttled` | `LimitExceededView` |
| 500 | `error` | "Server javob bermadi" + qayta urinish |

> Foydalanuvchiga hech qachon xom `DioException`/stack trace ko'rsatilmaydi.
> Backend `detail` matni o'zbekcha — shu ko'rsatiladi.

---

## 13. Pagination

Barcha ro'yxatlar cursor pagination:
```json
{
  "next": "https://.../?cursor=cj0xJnA9...",
  "previous": null,
  "results": [...]
}
```

- Default: 20 ta element
- Maksimal: 100 (`?page_size=100`)
- Saralash: `-created_at` (eng yangilari oldin)
- Ro'yxat ekranlari `next` bo'yicha cheksiz scroll (`ListView.builder`).

---

## 14. Backend'dan hali kutilayotgan endpointlar

Backend `apps/` papkasida tekshirildi. Quyidagilar **topilmadi**:

| Endpoint | Holat | Izoh |
|---|---|---|
| LLM sozlamalari (provider, model, temperature) | ❌ Yo'q | Faqat `model-pricings` (narx hisob) bor. LLM parametrlarini boshqarish endpointi yo'q |
| Ovoz sozlamalari (TTS provider, STT provider, til) | ❌ Yo'q | Voice faqat WS orqali. Ovoz sozlamalarini boshqarish endpointi yo'q |
| Push token yuborish (`PUT /auth/device/` yoki similar) | ❌ Yo'q | `device_id` mavjud (User model), lekin token yangilash endpointi yo'q |
| Chatga rasm yuborish (image upload) | ❌ Yo'q | `POST messages/` faqat `content` (string) qabul qiladi. Chat uchun rasm yuklash endpointi yo'q |
| Suhbat statusini o'zgartirish (archive/deactivate) | ✅ Bor | `DELETE conversations/{id}/` (arxivlash) |
| Buyurtma PDF | ✅ Bor | `GET orders/{id}/pdf/` |
| Oflayn queue sync | ❌ Yo'q | Ilova tomonida `OfflineQueue` (Hive). Backend'da alohida sync endpointi yo'q — oddiy CRUD orqali |

---

## 15. API Paths xaritasi

Jadval `core/network/api_paths.dart` dagi **haqiqiy** a'zolar (kod bilan sinxron, 2026-09-19):

| `ApiPaths` a'zosi | Yo'l | Metod |
|---|---|---|
| `login` | `auth/login/` | POST |
| `refresh` | `auth/refresh/` | POST |
| `logout` | `auth/logout/` | POST |
| `me` | `auth/me/` | GET |
| `conversations` | `conversations/` | GET/POST |
| `conversation(id)` | `conversations/{id}/` | GET/DELETE |
| `conversationReset(id)` | `conversations/{id}/reset/` | POST |
| `conversationTranscript(id)` | `conversations/{id}/transcript/` | GET |
| `conversationMessages(id)` | `conversations/{id}/messages/` | GET (tarix) / POST (SSE) |
| `voiceSocket(id)` | `ws/voice/{conversation_id}/` | WS |
| `categories` | `catalog/categories/` | GET |
| `products` | `catalog/products/` | GET / POST (manager) |
| `product(id)` | `catalog/products/{id}/` | GET / PATCH / DELETE |
| `variant(id)` | `catalog/variants/{id}/` | GET / PATCH / DELETE |
| `variantsBulkPrice` | `catalog/variants/bulk-price/` | POST |
| `productImages(id)` | `catalog/products/{id}/images/` | POST (multipart) |
| `catalogImage(id)` | `catalog/images/{id}/` | DELETE |
| `fasons` / `fason(id)` | `catalog/fasons/`, `catalog/fasons/{id}/` | CRUD |
| `orders` | `orders/` | GET / POST |
| `order(id)` | `orders/{id}/` | GET / PATCH |
| `orderConfirm(id)` | `orders/{id}/confirm/` | POST |
| `orderStatus(id)` | `orders/{id}/status/` | POST |
| `orderStatuses` | `orders/statuses/` | GET |
| `orderPdf(id)` | `orders/{id}/pdf/` | GET (bytes) |
| `calcPreview` | `pricing/calc/preview/` | POST (rules §19.2) |
| `calcRules` / `calcRule(key)` | `pricing/calc-rules/`, `pricing/calc-rules/{key}/` | GET / PATCH |
| `services` | `pricing/services/` | GET / PATCH |
| `discountTiers` / `discountTier(id)` | `pricing/discount-tiers/`, `.../{id}/` | CRUD |
| `discountPolicy` | `pricing/discount-policy/` | GET / PATCH |
| `orderDefaults` | `pricing/order-defaults/` | GET / PATCH |
| `modelPricings` / `modelPricing(id)` | `pricing/model-pricings/`, `.../{id}/` | CRUD (admin) |
| `knowledgeRules` / `knowledgeRule(id)` | `knowledge/rules/`, `knowledge/rules/{id}/` | CRUD |
| `employees` | `team/employees/` | GET / POST |
| `employee(id)` | `team/employees/{id}/` | GET / PATCH |
| `employeeLimit(id)` | `team/employees/{id}/limit/` | POST |
| `employeeConversations(id)` | `team/employees/{id}/conversations/` | GET |
| `usageSummary` | `usage/summary/` | GET |
| `usageByUser` | `usage/by-user/` | GET |
| `usageConversations` | `usage/conversations/` | GET |
| `analyticsConversion` | `analytics/conversion/` | GET |
| `settingsPrompt` | `settings/prompt/` | GET / POST |
| `settingsPromptRollback(id)` | `settings/prompt/{id}/rollback/` | POST |
