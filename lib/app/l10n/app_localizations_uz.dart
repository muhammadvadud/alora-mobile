// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uzbek (`uz`).
class AppLocalizationsUz extends AppLocalizations {
  AppLocalizationsUz([String locale = 'uz']) : super(locale);

  @override
  String get app_name => 'Alora';

  @override
  String get common_retry => 'Qayta urinish';

  @override
  String get common_cancel => 'Bekor qilish';

  @override
  String get common_save => 'Saqlash';

  @override
  String get common_ok => 'OK';

  @override
  String get common_loading => 'Yuklanmoqda…';

  @override
  String get common_noInternet => 'Internet yo\'q. Ulanish tiklanganda avtomatik yuboriladi';

  @override
  String get common_error => 'Xatolik yuz berdi';

  @override
  String get common_search => 'Qidiruv';

  @override
  String get common_close => 'Yopish';

  @override
  String get error_network => 'Ulanish yo\'q. Internetni tekshiring.';

  @override
  String get error_auth => 'Sessiya muddati tugadi. Iltimos, qayta kiring.';

  @override
  String get offline_flushFailed =>
      'Serverda yangi ma\'lumot bor. Ba\'zi o\'zgarishlar saqlanmadi.';

  @override
  String get error_permission => 'Ruxsat yo\'q';

  @override
  String get error_notFound => 'Topilmadi';

  @override
  String get error_limit => 'Limit tugadi';

  @override
  String get orders_confirm => 'Tasdiqlash';

  @override
  String get orders_confirmedSnack => 'Buyurtma tasdiqlandi';

  @override
  String get orders_createdSnack => 'Buyurtma yaratildi';

  @override
  String get chat_defaultTitle => 'Mijoz';

  @override
  String get chat_historyLoadFailedTitle => 'Ma\'lumot kelmadi';

  @override
  String get chat_noConversation => 'Suhbat tanlanmagan';

  @override
  String get limit_callManager => 'Qo\'ng\'iroq';

  @override
  String get limit_smsManager => 'SMS';

  @override
  String get error_serviceUnavailable => 'AI xizmati vaqtincha ishlamayapti';

  @override
  String get error_server => 'Server javob bermadi';

  @override
  String get error_unknown => 'Noma\'lum xatolik';

  @override
  String get order_status_draft => 'Qoralama';

  @override
  String get order_status_confirmed => 'Tasdiqlangan';

  @override
  String get order_status_measuring => 'O\'lchovda';

  @override
  String get order_status_production => 'Tikuvda';

  @override
  String get order_status_ready => 'Tayyor';

  @override
  String get order_status_installing => 'O\'rnatishda';

  @override
  String get order_status_completed => 'Topshirildi';

  @override
  String get order_status_cancelled => 'Bekor qilingan';

  @override
  String get order_status_unknown => 'Noma\'lum';

  @override
  String get payment_status_advancePaid => 'Avans olindi';

  @override
  String get payment_status_fullyPaid => 'To\'liq to\'landi';

  @override
  String get payment_status_debt => 'Qarz bor';

  @override
  String get payment_status_unknown => 'Noma\'lum';

  @override
  String get price_unit_perSqm => 'so\'m/m²';

  @override
  String get price_unit_perPiece => 'so\'m/dona';

  @override
  String get price_unit_perMeter => 'so\'m/m';

  @override
  String get price_unit_unknown => '';

  @override
  String get login_tagline => 'Parda savdosi uchun ish quroli';

  @override
  String get login_phoneLabel => 'Telefon raqami';

  @override
  String get login_passwordLabel => 'Parol';

  @override
  String get login_signIn => 'Kirish';

  @override
  String get login_forgotPassword => 'Parolni unutdingizmi? Menejer bilan bog\'laning';

  @override
  String get login_errorAuthFailed => 'Kirish ma\'lumotlari noto\'g\'ri';

  @override
  String get login_errorRequired => 'Telefon raqam va parolni kiriting';

  @override
  String get tab_chat => 'Chat';

  @override
  String get tab_orders => 'Buyurtmalar';

  @override
  String get tab_catalog => 'Katalog';

  @override
  String get tab_management => 'Boshqaruv';

  @override
  String get tab_profile => 'Profil';

  @override
  String get placeholder_comingSoon => 'Bo\'lim tayyorlanmoqda';

  @override
  String get forbidden_title => 'Ruxsat yo\'q';

  @override
  String get forbidden_text => 'Bu bo\'limga faqat menejer yoki admin kirishi mumkin';

  @override
  String get catalog_searchHint => 'Mahsulot qidirish';

  @override
  String get catalog_allCategories => 'Hammasi';

  @override
  String get catalog_filter => 'Filtrlash';

  @override
  String get catalog_filterClear => 'Tozalash';

  @override
  String catalog_filterShow(int count) {
    return 'Ko\'rsatish ($count ta)';
  }

  @override
  String get catalog_emptyTitle => 'Hech narsa topilmadi';

  @override
  String get catalog_emptyMessage => 'Filtrlarni o\'zgartiring yoki qidiruv so\'zini o\'zgartiring';

  @override
  String get catalog_filterType => 'Tur';

  @override
  String get catalog_filterTypeFabric => 'Matolar';

  @override
  String get catalog_filterTypeAccessory => 'Aksessuarlar';

  @override
  String get catalog_filterStyle => 'Uslub';

  @override
  String get catalog_filterStyleKlassik => 'Klassik';

  @override
  String get catalog_filterStyleZamonaviy => 'Zamonaviy';

  @override
  String get catalog_filterStyleMinimalist => 'Minimalist';

  @override
  String get catalog_filterRoom => 'Xona';

  @override
  String get catalog_filterRoomMehmonxona => 'Mehmonxona';

  @override
  String get catalog_filterRoomYotoqxona => 'Yotoqxona';

  @override
  String get catalog_filterRoomOshxona => 'Oshxona';

  @override
  String get catalog_filterRoomBolalarXonasi => 'Bolalar xonasi';

  @override
  String get catalog_filterRoomOfis => 'Ofis';

  @override
  String get catalog_filterPattern => 'Naqsh';

  @override
  String get catalog_filterPatternYassi => 'Yassi';

  @override
  String get catalog_filterPatternGulli => 'Gulli';

  @override
  String get catalog_filterPatternChiziqli => 'Chiziqli';

  @override
  String get catalog_filterPatternGeometrik => 'Geometrik';

  @override
  String get catalog_filterTransparency => 'Shaffoflik';

  @override
  String get catalog_filterTransparencyYopiq => 'Yopiq';

  @override
  String get catalog_filterTransparencyYarimYorug => 'Yarim yorug\'';

  @override
  String get catalog_filterTransparencyYorug => 'Yorug\'';

  @override
  String get catalog_filterSegment => 'Segment';

  @override
  String get catalog_filterSegmentEconomy => 'Iqtisod';

  @override
  String get catalog_filterSegmentStandard => 'Standart';

  @override
  String get catalog_filterSegmentPremium => 'Premium';

  @override
  String get catalog_filterPrice => 'Narx';

  @override
  String catalog_filterPriceRange(int min, int max) {
    return '$min — $max so\'m';
  }

  @override
  String catalog_filterPriceRangeFormatted(String min, String max) {
    return '$min — $max so\'m';
  }

  @override
  String get product_category => 'Kategoriya';

  @override
  String get product_properties => 'Xususiyatlar';

  @override
  String get product_askAi => 'AI\'dan so\'rash';

  @override
  String get product_addToAccount => 'Hisobga qo\'shish';

  @override
  String get product_variantSelected => 'Tanlangan';

  @override
  String get product_colorLabel => 'Rang';

  @override
  String product_rollWidthValue(String value, String unit) {
    return '$value $unit';
  }

  @override
  String get product_fabricType => 'Mato turi';

  @override
  String get product_rollWidth => 'Rulon eni';

  @override
  String get product_composition => 'Tarkib';

  @override
  String get product_care => 'Parvarish';

  @override
  String get product_unitCm => 'sm';

  @override
  String get product_sewingRequired => 'Tikish kerak';

  @override
  String product_askAiMessage(String name, String color) {
    return 'Shu mato ($name, $color) mehmonxonaga to\'g\'ri keladimi?';
  }

  @override
  String product_addToAccountMessage(String variant) {
    return 'Hisobga qo\'sh: $variant';
  }

  @override
  String get conversations_title => 'Suhbatlar';

  @override
  String get conversations_searchHint => 'Suhbat yoki mijoz';

  @override
  String get conversations_filterAll => 'Hammasi';

  @override
  String get conversations_filterHasOrder => 'Hisob chiqarilgan';

  @override
  String get conversations_filterInProgress => 'Yakunlanmagan';

  @override
  String get conversations_stageNeed => 'ehtiyoj';

  @override
  String get conversations_stageRecommend => 'tavsiya';

  @override
  String get conversations_stageMeasure => 'o\'lchov';

  @override
  String get conversations_stageCalc => 'hisob';

  @override
  String get conversations_stageVariants => 'variantlar';

  @override
  String get conversations_stageOrder => 'buyurtma';

  @override
  String get conversations_stageUnknown => 'noma\'lum';

  @override
  String get conversations_groupToday => 'Bugun';

  @override
  String get conversations_groupYesterday => 'Kecha';

  @override
  String get conversations_groupThisWeek => 'Bu hafta';

  @override
  String get conversations_groupOlder => 'Oldingi';

  @override
  String get conversations_new => 'Yangi suhbat';

  @override
  String get conversations_emptyTitle => 'Hali suhbat yo\'q';

  @override
  String get conversations_emptyMessage => 'Yangi suhbat boshlang';

  @override
  String get conversations_emptyFilteredTitle => 'Natija topilmadi';

  @override
  String get conversations_emptyFilteredMessage => 'Filtrlarni o\'zgartiring';

  @override
  String get conversations_archive => 'Arxivlash';

  @override
  String get conversations_archiveDialogTitle => 'Suhbatni arxivlaysizmi?';

  @override
  String get conversations_archiveDialogMessage => 'Suhbat arxivga ko\'chiriladi';

  @override
  String get chat_emptyTitle => 'Mijoz nima izlayapti?';

  @override
  String get chat_start_livingRoom => 'Mehmonxona';

  @override
  String get chat_start_bedroom => 'Yotoqxona';

  @override
  String get chat_start_couple => 'Kelin-kuyov xonasi';

  @override
  String get chat_start_kitchen => 'Oshxona';

  @override
  String get chat_start_kids => 'Bolalar xonasi';

  @override
  String get chat_start_office => 'Ofis';

  @override
  String get chat_thinking => 'O\'ylayapti…';

  @override
  String chat_tool_running(String tool) {
    return '$tool…';
  }

  @override
  String get chat_tool_result => 'Natija';

  @override
  String get chat_inputHint => 'Xabar…';

  @override
  String get chat_newMessages => '↓ Yangi xabar';

  @override
  String get chat_menuNew => 'Yangi suhbat';

  @override
  String get chat_menuReset => 'Suhbatni tozalash';

  @override
  String get chat_menuCustomerMode => 'Mijoz rejimi';

  @override
  String get chat_menuPdf => 'PDF taklif';

  @override
  String get chat_menuShare => 'Ulashish';

  @override
  String get chat_resetConfirmTitle => 'Tozalaysizmi?';

  @override
  String get chat_resetConfirmMessage => 'Kontekst o\'chiriladi.';

  @override
  String get chat_continue => 'Davom ettirish';

  @override
  String get chat_retry => 'Qayta yuborish';

  @override
  String get tool_label_product_search => 'Mahsulot qidirilmoqda';

  @override
  String get tool_label_curtain_calculate => 'Hisoblanmoqda';

  @override
  String get tool_label_price_quote => 'Narx chiqarilmoqda';

  @override
  String get tool_label_order_draft => 'Buyurtma shakllantirilmoqda';

  @override
  String get tool_label_variants => 'Variantlar tayyorlanmoqda';

  @override
  String get tool_label_unknown => 'Ma\'lumot olinmoqda';

  @override
  String get chat_quote_fabrics => 'Matolar';

  @override
  String get chat_quote_accessories => 'Bezaklar';

  @override
  String get chat_quote_services => 'Xizmatlar';

  @override
  String chat_quote_more(int count) {
    return 'Yana $count ta bo\'lak';
  }

  @override
  String get chat_quote_total => 'Jami';

  @override
  String get chat_quote_howCalculated => 'Qanday hisoblandi?';

  @override
  String get chat_quote_close => 'Yopish';

  @override
  String get chat_quote_show => 'Ko\'rish';

  @override
  String get chat_quote_addPart => 'Bo\'lak qo\'shish';

  @override
  String get chat_quote_showOptions => 'Variantlarni ko\'rish';

  @override
  String get chat_options_select => 'Tanlash';

  @override
  String get chat_draft_edit => 'Tahrirlash';

  @override
  String get chat_draft_createOrder => 'Buyurtma yaratish';

  @override
  String get chat_draft_title => 'Qoralama';

  @override
  String get orders => 'Buyurtmalar';

  @override
  String get errorLoadingStatuses => 'Statuslarni yuklashda xatolik';

  @override
  String get orderDetail => 'Buyurtma tafsiloti';

  @override
  String dateLabel(String value) {
    return 'Sana: $value';
  }

  @override
  String sellerLabel(String name) {
    return 'Sotuvchi: $name';
  }

  @override
  String get customer => 'Mijoz';

  @override
  String get rooms => 'Xonalar';

  @override
  String corniceAndHeight(String cornice, String height) {
    return 'Karniz: $cornice m, Balandlik: $height m';
  }

  @override
  String get finance => 'Moliya';

  @override
  String get orders_financeTotal => 'Jami';

  @override
  String get orders_financePrepayment => 'Avans';

  @override
  String get orders_financeBalance => 'Qoldiq';

  @override
  String get nameAndPhoneRequired => 'Ism va telefon majburiy';

  @override
  String errorOccurred(String message) {
    return 'Xatolik: $message';
  }

  @override
  String get newOrder => 'Yangi buyurtma';

  @override
  String get discount => 'Chegirma';

  @override
  String get amount => 'Summa';

  @override
  String get prepayment => 'Avans';

  @override
  String get note => 'Izoh';

  @override
  String get errorLoadingTransitions => 'O\'tishlarni yuklashda xatolik';

  @override
  String get cancelled => 'Bekor qilingan';

  @override
  String get profile_languageTitle => 'Til';

  @override
  String get profile_languageOptionUz => 'O\'zbek';

  @override
  String get profile_languageOptionCyrl => 'Кирилл';

  @override
  String get profile_languageOptionRu => 'Русский';

  @override
  String get profile_themeTitle => 'Mavzu';

  @override
  String get profile_aboutTitle => 'Ilova haqida';

  @override
  String get profile_aboutVersion => 'Versiya';

  @override
  String get profile_aboutBuild => 'Build';

  @override
  String get profile_aboutEnv => 'Muhit';

  @override
  String get profile_changePassword => 'Parolni o\'zgartirish';

  @override
  String get profile_newPassword => 'Yangi parol';

  @override
  String get profile_confirmPassword => 'Yangi parolni takrorlang';

  @override
  String get profile_passwordChanged => 'Parol o\'zgartirildi';

  @override
  String get profile_themeSystem => 'Tizim';

  @override
  String get profile_themeLight => 'Yorug\'';

  @override
  String get profile_themeDark => 'Qorong\'i';

  @override
  String get profile_logout => 'Chiqish';

  @override
  String get profile_logoutConfirmTitle => 'Chiqish?';

  @override
  String get profile_logoutConfirmMessage => 'Hisobingizdan chiqmoqchimisiz?';

  @override
  String get profile_roleEmployee => 'Xodim';

  @override
  String get profile_roleManager => 'Menejer';

  @override
  String get profile_roleAdmin => 'Admin';

  @override
  String get profile_roleUnknown => 'Noma\'lum';

  @override
  String get profile_todaySpend => 'Bugungi sarf';

  @override
  String get profile_limitDailyReset => 'Kunlik limit soat 24:00 da yangilanadi';

  @override
  String get profile_limitNotSet => 'Limit o\'rnatilmagan';

  @override
  String get profile_unlimited => 'Cheksiz';

  @override
  String get currency_som => 'so\'m';

  @override
  String get management_periodToday => 'Bugun';

  @override
  String get management_periodWeek => 'Hafta';

  @override
  String get management_periodMonth => 'Oy';

  @override
  String get management_chartTitle => 'Kunlik sarf';

  @override
  String get management_usageDetails => 'Sarf tafsilotlari';

  @override
  String get management_usageTokens => 'Tokenlar';

  @override
  String get management_usageMessages => 'Xabarlar';

  @override
  String get management_statsTitle => 'Statistika';

  @override
  String get management_chartEmpty => 'Grafik uchun ma\'lumot yo\'q';

  @override
  String get management_statThreads => 'Suhbatlar';

  @override
  String get management_statOrders => 'Buyurtmalar';

  @override
  String get management_statConversion => 'Konversiya';

  @override
  String get management_statCost => 'Sarf';

  @override
  String get management_rankingTitle => 'Xodimlar reytingi';

  @override
  String get management_rankingEmployeeCol => 'Xodim';

  @override
  String get management_rankingChatsCol => 'Suhbat';

  @override
  String get management_rankingCostCol => 'Sarf';

  @override
  String get management_rankingOrdersCol => 'Buyurtma';

  @override
  String get management_sectionEmployees => 'Xodimlar';

  @override
  String get management_sectionProducts => 'Mahsulotlar';

  @override
  String get management_sectionPricing => 'Narx qoidalari';

  @override
  String get management_sectionKnowledge => 'Bilimlar';

  @override
  String get management_sectionSettings => 'Sozlamalar';

  @override
  String get management_employeesTitle => 'Xodimlar';

  @override
  String get management_employeesSearchHint => 'Xodim qidirish';

  @override
  String get management_employeeAdd => 'Xodim qo\'shish';

  @override
  String management_employeeLastActive(String date) {
    return 'Oxirgi faollik: $date';
  }

  @override
  String management_employeeTodayMeta(int chats, int messages) {
    return 'Suhbatlar $chats · Xabarlar $messages';
  }

  @override
  String get management_employeeBlocked => 'Bloklangan';

  @override
  String get management_createTitle => 'Xodim qo\'shish';

  @override
  String get management_createPhone => 'Telefon raqami';

  @override
  String get management_createName => 'Ism va familiya';

  @override
  String get management_createPassword => 'Boshlang\'ich parol';

  @override
  String get management_createRole => 'Rol';

  @override
  String get management_employeeProfileTitle => 'Xodim profili';

  @override
  String get management_employeeChangePassword => 'Parolni o\'zgartirish';

  @override
  String get management_employeeNewPassword => 'Yangi parol';

  @override
  String get management_employeeConfirmPassword => 'Yangi parolni takrorlang';

  @override
  String get management_employeePasswordChanged => 'Parol o\'zgartirildi';

  @override
  String get management_limitTitle => 'Kunlik limit';

  @override
  String get management_limitCost => 'Sarf so\'m';

  @override
  String get management_limitMessages => 'Xabarlar soni';

  @override
  String get management_limitTokens => 'Tokenlar';

  @override
  String get management_onExceedWarn => 'Ogohlantirish';

  @override
  String get management_onExceedBlock => 'Bloklash';

  @override
  String get management_limitSet => 'Limitni saqlash';

  @override
  String get management_employeeViewThreads => 'Suhbatlarini ko\'rish';

  @override
  String get management_employeeConversationsTitle => 'Xodim suhbatlari';

  @override
  String get management_employeeBlockConfirmTitle => 'Xodimni bloklash?';

  @override
  String get management_employeeBlockConfirmMessage =>
      'Bloklangan xodim tizimga kira olmaydi. Davom etasizmi?';

  @override
  String get management_employeeUnblockConfirmTitle => 'Xodimni faollashtirish?';

  @override
  String get management_employeeUnblockConfirmMessage =>
      'Xodim tizimga qayta kira oladi. Davom etasizmi?';

  @override
  String get management_conversationsEmptyTitle => 'Suhbatlar yo\'q';

  @override
  String get management_conversationsEmptyMessage => 'Bu xodimning hozircha suhbatlari yo\'q';

  @override
  String get management_transcriptTitle => 'Transkript';

  @override
  String get management_transcriptEmpty => 'Xabarlar yo\'q';

  @override
  String get management_transcriptUser => 'Foydalanuvchi';

  @override
  String get management_transcriptAssistant => 'AI';

  @override
  String get management_transcriptTool => 'Asbob';

  @override
  String get management_employeeBlock => 'Bloklash';

  @override
  String get management_employeeUnblock => 'Faollashtirish';

  @override
  String get management_employeesEmptyMessage => 'Jamoada hozircha xodimlar yo\'q';

  @override
  String get management_employeesEmptyTitle => 'Xodimlar topilmadi';

  @override
  String get management_employeesSearchEmptyMessage => 'Boshqa so\'z bilan qidirib ko\'ring';

  @override
  String get management_employeesSearchEmptyTitle => 'Natija topilmadi';

  @override
  String get management_limitPeriodDay => 'Kunlik';

  @override
  String get management_limitPeriodMonth => 'Oylik';

  @override
  String get management_limitUnlimited => 'Cheksiz';

  @override
  String get management_statsEmpty => 'Ma\'lumotlar hozircha yo\'q';

  @override
  String get management_sectionTitle => 'Bo\'limlar';

  @override
  String get management_createPhoneError => 'Telefon raqamini to\'liq kiriting';

  @override
  String get management_productFormTitle => 'Mahsulot shakli';

  @override
  String get management_productName => 'Nomi';

  @override
  String get management_productsTitle => 'Mahsulotlarni boshqarish';

  @override
  String get management_productsList => 'Ro\'yxat';

  @override
  String get management_knowledgeTitle => 'Bilim qoidalari';

  @override
  String get management_knowledgeList => 'Bilim qoidalari ro\'yxati';

  @override
  String get management_pricingTitle => 'Narx qoidalari';

  @override
  String get management_pricingCoefficients => 'Koeffitsientlar inline tahrir';

  @override
  String get management_pricingTiers => 'Chegirma darajalari jadvali';

  @override
  String get management_pricingDefaults => 'Standart qiymatlar';

  @override
  String get management_pricingTest => 'Hisobni sinash';

  @override
  String get management_pricingCoefs => 'Koeffitsientlar';

  @override
  String get management_pricingServicesTitle => 'Xizmatlar';

  @override
  String get management_pricingServicesEmpty => 'Xizmatlar topilmadi';

  @override
  String get management_pricingServiceActive => 'Faol';

  @override
  String get management_pricingServiceInactive => 'Faol emas';

  @override
  String get management_pricingServicePrice => 'Narx';

  @override
  String get management_pricingServicePriceHint => 'Xizmat narxini so\'mda kiriting';

  @override
  String get management_pricingTiersTitle => 'Chegirma bosqichlari';

  @override
  String get management_pricingDefaultsTitle => 'Standart qiymatlar';

  @override
  String get management_pricingAddTier => 'Bosqich qo\'shish';

  @override
  String get management_pricingTierMinAmount => 'Eng kam summa';

  @override
  String get management_pricingTierPercent => 'Chegirma %';

  @override
  String get management_pricingTierSave => 'Saqlash';

  @override
  String get management_pricingMaxManager => 'Maks chegirma (Manager)';

  @override
  String get management_pricingMaxEmployee => 'Maks chegirma (Xodim)';

  @override
  String get management_pricingAdvancePercent => 'Avans %';

  @override
  String get management_pricingDeliveryPrice => 'Yetkazish narxi';

  @override
  String get management_pricingCalcPreviewHeight => 'Balandligi (m)';

  @override
  String get management_pricingCalcPreviewWidth => 'Uzunligi (m)';

  @override
  String get management_pricingCalcPreviewPieces => 'Bo\'lak soni';

  @override
  String get management_pricingCalcPreviewCalc => 'Hisoblash';

  @override
  String get management_knowledgeAddRule => 'Qoida qo\'shish';

  @override
  String get management_knowledgeRuleType => 'Turi';

  @override
  String get management_knowledgeRuleConditions => 'Shartlar';

  @override
  String get management_knowledgeRuleRecommendation => 'Tavsiya';

  @override
  String get management_knowledgeRulePriority => 'Ustuvorlik';

  @override
  String get management_knowledgeRuleIsActive => 'Faol';

  @override
  String get management_knowledgeRuleSave => 'Saqlash';

  @override
  String get management_knowledgeRuleTestAI => 'AI\'da sinash';

  @override
  String get management_bulkPriceTitle => 'Narxni o\'zgartirish';

  @override
  String get management_bulkPricePercent10 => '+10%';

  @override
  String get management_bulkPricePercent5 => '-5%';

  @override
  String get management_bulkPriceAmount => 'Yangi narx';

  @override
  String get management_bulkPricePercentHint => 'Foiz';

  @override
  String get management_bulkPriceAmountHint => 'Summa';

  @override
  String get management_bulkPricePreview => 'Oldindan ko\'rish:';

  @override
  String get management_pricingPolicyHint =>
      'Qo\'lda maksimal chegirma limitlari. AI taklifi bu limitdan oshmaydi.';

  @override
  String get management_pricingStackWithTier => 'Bosqichli chegirma bilan jamlash';

  @override
  String get management_pricingDeadlineDays => 'Muddat (kun)';

  @override
  String get management_pricingCoefsEmpty => 'Koeffitsientlar topilmadi';

  @override
  String get management_pricingTiersEmpty => 'Chegirma bosqichlari hozircha yo\'q';

  @override
  String get management_pricingSaveError => 'Saqlashda xatolik yuz berdi';

  @override
  String get management_pricingPreviewError => 'Hisoblashda xatolik yuz berdi';

  @override
  String get management_knowledgeEditTitle => 'Qoidani tahrirlash';

  @override
  String get management_knowledgeEmptyTitle => 'Qoidalar yo\'q';

  @override
  String get management_knowledgeEmptyMessage => 'Hozircha bilim qoidalari qo\'shilmagan';

  @override
  String get management_knowledgeErrorTitle => 'Yuklab bo\'lmadi';

  @override
  String get management_knowledgeConditionHint => 'Shart qo\'shish';

  @override
  String get management_knowledgeRemove => 'O\'chirish';

  @override
  String get management_knowledgeRemoveConfirmTitle => 'Qoidani o\'chirish?';

  @override
  String get management_knowledgeRemoveConfirmMessage =>
      'Qoida butunlay o\'chiriladi. Davom etasizmi?';

  @override
  String get management_knowledgeRuleRemoved => 'Qoida o\'chirildi';

  @override
  String get management_knowledgeRulePriorityHint => 'Ustuvorlik';

  @override
  String management_knowledgeRulePriorityLabel(int value) {
    return 'Ustuvorlik: $value';
  }

  @override
  String get management_productsSearchHint => 'Mahsulot nomi, SKU qidirish';

  @override
  String get management_productsAll => 'Barchasi';

  @override
  String get management_productsEmptyTitle => 'Mahsulotlar topilmadi';

  @override
  String get management_productsEmptyMessage => 'Qidiruv yoki filtr shartini o\'zgartirib ko\'ring';

  @override
  String get management_productsLoadError => 'Yuklab bo\'lmadi';

  @override
  String get management_bulkApplied => 'Narx yangilandi';

  @override
  String management_productsSelected(int count) {
    return '$count ta tanlandi';
  }

  @override
  String get management_productFormEditTitle => 'Mahsulotni tahrirlash';

  @override
  String get management_productFormBasic => 'Asosiy';

  @override
  String get management_productFormName => 'Nomi';

  @override
  String get management_productFormCode => 'Kodi';

  @override
  String get management_productFormCategory => 'Kategoriya';

  @override
  String get management_productFormDescription => 'Tavsif';

  @override
  String get management_productFormFabricType => 'Mato turi';

  @override
  String get management_productFormComposition => 'Tarkibi';

  @override
  String get management_productFormCare => 'Parvarish qilish';

  @override
  String get management_productFormSegment => 'Segment';

  @override
  String get management_productFormRecommendedRooms => 'Tavsiya qilinadigan xonalar';

  @override
  String get management_productFormBasePrice => 'Asosiy narx';

  @override
  String get management_productFormPrice => 'Narx';

  @override
  String get management_productFormCost => 'Tannarx';

  @override
  String get management_productFormVariants => 'Variantlar';

  @override
  String get management_productFormAddVariant => 'Variant qo\'shish';

  @override
  String get management_productFormVariantsEmpty => 'Hali variant qo\'shilmagan';

  @override
  String management_productFormVariantLabel(int index) {
    return 'Variant $index';
  }

  @override
  String get management_productFormRemoveVariantTitle => 'Variant o\'chirilsinmi?';

  @override
  String get management_productFormRemoveVariantMessage => 'Bu amalni qaytarib bo\'lmaydi';

  @override
  String get management_productFormRemoveVariant => 'O\'chirish';

  @override
  String get management_productFormSku => 'SKU';

  @override
  String get management_productFormColorName => 'Rang nomi';

  @override
  String get management_productFormColorHex => 'Rang (hex)';

  @override
  String get management_productFormWidth => 'Eni (m)';

  @override
  String get management_productFormIsActive => 'Faol';

  @override
  String get management_productFormSaved => 'Saqlandi';

  @override
  String get chat_listening => 'Eshityapman...';

  @override
  String get chat_stopVoice => 'To\'xtatish';

  @override
  String get chat_transcriptLabel => 'TRANSKRIPT';

  @override
  String get chat_voiceMode => 'Ovozli rejim';

  @override
  String get chat_textMode => 'Matnli rejim';

  @override
  String get chat_customerModeTitle => 'Mijoz rejimi';

  @override
  String get chat_enterPinTitle => 'PIN kodni kiriting';

  @override
  String get chat_setPinTitle => 'Mijoz rejimi uchun PIN o\'rnating';

  @override
  String get chat_confirmPinTitle => 'PIN kodni tasdiqlang';

  @override
  String get chat_pinMismatch => 'PIN kodlar mos tushmadi';

  @override
  String get chat_pinIncorrect => 'PIN kod noto\'g\'ri';

  @override
  String chat_pinAttemptsWait(int seconds) {
    return 'Juda ko\'p xato urinishlar. $seconds soniya kuting.';
  }

  @override
  String pin_attemptsLeft(int count) {
    return 'PIN kod noto\'g\'ri. Yana $count urinish qoldi.';
  }

  @override
  String get chat_pdfRequireOrder => 'Avval buyurtma yarating';

  @override
  String get orders_pdf => 'PDF';

  @override
  String get orders_share => 'Ulashish';

  @override
  String get settings_systemPromptTitle => 'Tizim prompti';

  @override
  String get settings_currentPrompt => 'JORIY PROMPT';

  @override
  String get settings_promptHint => 'Prompt matni';

  @override
  String get settings_promptEmpty => 'Hali prompt yo‘q';

  @override
  String get settings_saveNewVersion => 'Yangi versiya saqlash';

  @override
  String get settings_versionHistory => 'VERSIYALAR TARIXI';

  @override
  String settings_version(int version) {
    return 'v$version';
  }

  @override
  String get settings_rollback => 'Qaytarish';

  @override
  String get settings_rollbackConfirmTitle => 'Versiyaga qaytish?';

  @override
  String get settings_rollbackConfirmMessage => 'Haqiqatan ham ushbu versiyaga qaytasizmi?';

  @override
  String get settings_authorUnknown => 'Noma\'lum';

  @override
  String get settings_modelPricingsTitle => 'Model narxlari';

  @override
  String settings_modelProviderModel(String provider, String model) {
    return '$provider — $model';
  }

  @override
  String settings_modelInput(double price) {
    return 'Kirish (1M): $price';
  }

  @override
  String settings_modelOutput(double price) {
    return 'Chiqish (1M): $price';
  }

  @override
  String settings_modelCached(double price) {
    return 'Kesh (1M): $price';
  }

  @override
  String settings_modelStt(double price) {
    return 'STT (daqiqa): $price';
  }

  @override
  String settings_modelTts(double price) {
    return 'TTS (1k belgi): $price';
  }

  @override
  String settings_modelUsdToUzs(double value) {
    return 'USD → UZS: $value';
  }

  @override
  String get settings_active => 'Faol';

  @override
  String get settings_inactive => 'Nofaol';

  @override
  String get settings_delete => 'O\'chirish';

  @override
  String get chat_addAttachment => 'Qo\'shish';

  @override
  String get chat_microphone => 'Mikrofon';

  @override
  String get chat_send => 'Yuborish';

  @override
  String get chat_draft_customer => 'Mijoz';

  @override
  String get chat_draft_phone => 'Telefon raqam';

  @override
  String get chat_draft_address => 'Manzil';

  @override
  String get chat_draft_missingFields => 'To\'ldirish kerak bo\'lgan maydonlar';

  @override
  String get chat_start_livingRoom_sub => 'Parda va dizayn tanlash';

  @override
  String get chat_start_bedroom_sub => 'Qorong\'i va osoyishta';

  @override
  String get chat_start_couple_sub => 'Romantik va shinam';

  @override
  String get chat_start_kitchen_sub => 'Amaliy va yorug\'';

  @override
  String get chat_start_kids_sub => 'O\'yin va qiziqarli';

  @override
  String get chat_start_office_sub => 'Sokin va ishchan';

  @override
  String get catalog_filterPriceFrom => 'Dan';

  @override
  String get catalog_filterPriceTo => 'Gacha';

  @override
  String get common_delete => 'O\'chirish';

  @override
  String management_pricingTierRow(String minAmount) {
    return '$minAmount so\'m dan';
  }

  @override
  String get chat_quote_title => 'Hisob';

  @override
  String get chat_quote_room => 'Xona';
}

/// The translations for Uzbek, using the Cyrillic script (`uz_Cyrl`).
class AppLocalizationsUzCyrl extends AppLocalizationsUz {
  AppLocalizationsUzCyrl() : super('uz_Cyrl');

  @override
  String get app_name => 'Алора';

  @override
  String get common_retry => 'Қайта уриниш';

  @override
  String get common_cancel => 'Бекор қилиш';

  @override
  String get common_save => 'Сақлаш';

  @override
  String get common_ok => 'ОК';

  @override
  String get common_loading => 'Юкланмоқда…';

  @override
  String get common_noInternet => 'Интернет йўқ. Уланиш тикланганда автоматик юборилади';

  @override
  String get common_error => 'Хатолик юз берди';

  @override
  String get common_search => 'Қидирув';

  @override
  String get common_close => 'Ёпиш';

  @override
  String get error_network => 'Уланиш йўқ. Интернетни текширинг.';

  @override
  String get error_auth => 'Сессия муддати тугади. Илтимос, қайта киринг.';

  @override
  String get offline_flushFailed => 'Серверда янги маълумот бор. Баъзи ўзгаришлар сақланмади.';

  @override
  String get error_permission => 'Рухсат йўқ';

  @override
  String get error_notFound => 'Топилмади';

  @override
  String get error_limit => 'Лимит тугади';

  @override
  String get orders_confirm => 'Тасдиқлаш';

  @override
  String get orders_confirmedSnack => 'Буюртма тасдиқланди';

  @override
  String get orders_createdSnack => 'Буюртма яратилди';

  @override
  String get chat_defaultTitle => 'Мижоз';

  @override
  String get chat_historyLoadFailedTitle => 'Маълумот келмади';

  @override
  String get chat_noConversation => 'Суҳбат танланмаган';

  @override
  String get limit_callManager => 'Қўнғироқ';

  @override
  String get limit_smsManager => 'SMS';

  @override
  String get error_serviceUnavailable => 'AI хизмати вақтинча ишламаяпти';

  @override
  String get error_server => 'Сервер жавоб бермади';

  @override
  String get error_unknown => 'Номаълум хатолик';

  @override
  String get order_status_draft => 'Қоралама';

  @override
  String get order_status_confirmed => 'Тасдиқланган';

  @override
  String get order_status_measuring => 'Ўлчовда';

  @override
  String get order_status_production => 'Тикувда';

  @override
  String get order_status_ready => 'Тайёр';

  @override
  String get order_status_installing => 'Ўрнатишда';

  @override
  String get order_status_completed => 'Топширилди';

  @override
  String get order_status_cancelled => 'Бекор қилинган';

  @override
  String get order_status_unknown => 'Номаълум';

  @override
  String get payment_status_advancePaid => 'Аванс олинди';

  @override
  String get payment_status_fullyPaid => 'Тўлиқ тўланди';

  @override
  String get payment_status_debt => 'Қарз бор';

  @override
  String get payment_status_unknown => 'Номаълум';

  @override
  String get price_unit_perSqm => 'сўм/м²';

  @override
  String get price_unit_perPiece => 'сўм/дона';

  @override
  String get price_unit_perMeter => 'сўм/м';

  @override
  String get price_unit_unknown => '';

  @override
  String get login_tagline => 'Парда савдоси учун иш қуроли';

  @override
  String get login_phoneLabel => 'Телефон рақами';

  @override
  String get login_passwordLabel => 'Парол';

  @override
  String get login_signIn => 'Кириш';

  @override
  String get login_forgotPassword => 'Паролни унутдингизми? Менеджер билан боғланинг';

  @override
  String get login_errorAuthFailed => 'Кириш маълумотлари нотўғри';

  @override
  String get login_errorRequired => 'Телефон рақам ва паролни киритинг';

  @override
  String get tab_chat => 'Суҳбат';

  @override
  String get tab_orders => 'Буюртмалар';

  @override
  String get tab_catalog => 'Каталог';

  @override
  String get tab_management => 'Бошқарув';

  @override
  String get tab_profile => 'Профил';

  @override
  String get placeholder_comingSoon => 'Бўлим тайёрланмоқда';

  @override
  String get forbidden_title => 'Рухсат йўқ';

  @override
  String get forbidden_text => 'Бу бўлимга фақат менежер ёки админ кира олади';

  @override
  String get catalog_searchHint => 'Маҳсулот қидириш';

  @override
  String get catalog_allCategories => 'Ҳаммаси';

  @override
  String get catalog_filter => 'Фильтрлаш';

  @override
  String get catalog_filterClear => 'Тозалаш';

  @override
  String catalog_filterShow(int count) {
    return 'Кўрсатиш ($count та)';
  }

  @override
  String get catalog_emptyTitle => 'Ҳеч нарса топилмади';

  @override
  String get catalog_emptyMessage => 'Фильтрларни ўзгартиргинг ёки қидирув сўзини ўзгартириш';

  @override
  String get catalog_filterType => 'Тур';

  @override
  String get catalog_filterTypeFabric => 'Матолар';

  @override
  String get catalog_filterTypeAccessory => 'Аксессуарлар';

  @override
  String get catalog_filterStyle => 'Услуб';

  @override
  String get catalog_filterStyleKlassik => 'Классик';

  @override
  String get catalog_filterStyleZamonaviy => 'Замонавий';

  @override
  String get catalog_filterStyleMinimalist => 'Минималист';

  @override
  String get catalog_filterRoom => 'Хона';

  @override
  String get catalog_filterRoomMehmonxona => 'Меҳмонхона';

  @override
  String get catalog_filterRoomYotoqxona => 'Йўтоқхона';

  @override
  String get catalog_filterRoomOshxona => 'Ошхона';

  @override
  String get catalog_filterRoomBolalarXonasi => 'Болалар хонси';

  @override
  String get catalog_filterRoomOfis => 'Офис';

  @override
  String get catalog_filterPattern => 'Нақш';

  @override
  String get catalog_filterPatternYassi => 'Ясси';

  @override
  String get catalog_filterPatternGulli => 'Гулли';

  @override
  String get catalog_filterPatternChiziqli => 'Чизиқли';

  @override
  String get catalog_filterPatternGeometrik => 'Геометрик';

  @override
  String get catalog_filterTransparency => 'Шаффофлик';

  @override
  String get catalog_filterTransparencyYopiq => 'Ёпиқ';

  @override
  String get catalog_filterTransparencyYarimYorug => 'Ярим ёруғ';

  @override
  String get catalog_filterTransparencyYorug => 'Ёруғ';

  @override
  String get catalog_filterSegment => 'Сегмент';

  @override
  String get catalog_filterSegmentEconomy => 'Иқтисод';

  @override
  String get catalog_filterSegmentStandard => 'Стандарт';

  @override
  String get catalog_filterSegmentPremium => 'Премиум';

  @override
  String get catalog_filterPrice => 'Нарх';

  @override
  String catalog_filterPriceRange(int min, int max) {
    return '$min — $max сўм';
  }

  @override
  String catalog_filterPriceRangeFormatted(String min, String max) {
    return '$min — $max сўм';
  }

  @override
  String get product_category => 'Категория';

  @override
  String get product_properties => 'Хусусиятлар';

  @override
  String get product_askAi => 'AI\'дан сўраш';

  @override
  String get product_addToAccount => 'Ҳисобга қўшиш';

  @override
  String get product_variantSelected => 'Танланган';

  @override
  String get product_colorLabel => 'Ранг';

  @override
  String product_rollWidthValue(String value, String unit) {
    return '$value $unit';
  }

  @override
  String get product_fabricType => 'Мато тури';

  @override
  String get product_rollWidth => 'Рулон эни';

  @override
  String get product_composition => 'Таркиб';

  @override
  String get product_care => 'Парвариш';

  @override
  String get product_unitCm => 'см';

  @override
  String get product_sewingRequired => 'Тикиш керак';

  @override
  String product_askAiMessage(String name, String color) {
    return 'Шу мато ($name, $color) меҳмонхонага тўғри келадими?';
  }

  @override
  String product_addToAccountMessage(String variant) {
    return 'Ҳисобга қўш: $variant';
  }

  @override
  String get conversations_title => 'Суҳбатлар';

  @override
  String get conversations_searchHint => 'Суҳбат ёки мижоз';

  @override
  String get conversations_filterAll => 'Ҳаммаси';

  @override
  String get conversations_filterHasOrder => 'Ҳисоб чиқарилган';

  @override
  String get conversations_filterInProgress => 'Якунланмаган';

  @override
  String get conversations_stageNeed => 'эҳтиёж';

  @override
  String get conversations_stageRecommend => 'тавсия';

  @override
  String get conversations_stageMeasure => 'ўлчов';

  @override
  String get conversations_stageCalc => 'ҳисоб';

  @override
  String get conversations_stageVariants => 'вариантлар';

  @override
  String get conversations_stageOrder => 'буюртма';

  @override
  String get conversations_stageUnknown => 'номаълум';

  @override
  String get conversations_groupToday => 'Бугун';

  @override
  String get conversations_groupYesterday => 'Кеча';

  @override
  String get conversations_groupThisWeek => 'Бу ҳафта';

  @override
  String get conversations_groupOlder => 'Олдинги';

  @override
  String get conversations_new => 'Янги суҳбат';

  @override
  String get conversations_emptyTitle => 'Ҳали суҳбат йўқ';

  @override
  String get conversations_emptyMessage => 'Янги суҳбат бошланг';

  @override
  String get conversations_emptyFilteredTitle => 'Натижа топилмади';

  @override
  String get conversations_emptyFilteredMessage => 'Фильтрларни ўзгартиринг';

  @override
  String get conversations_archive => 'Архивлаш';

  @override
  String get conversations_archiveDialogTitle => 'Суҳбатни архивлайсизми?';

  @override
  String get conversations_archiveDialogMessage => 'Суҳбат архивга кўчирилади';

  @override
  String get chat_emptyTitle => 'Мижоз нима излаяпти?';

  @override
  String get chat_start_livingRoom => 'Меҳмонхона';

  @override
  String get chat_start_bedroom => 'Ётоқхона';

  @override
  String get chat_start_couple => 'Келин-куёв хонаси';

  @override
  String get chat_start_kitchen => 'Ошхона';

  @override
  String get chat_start_kids => 'Болалар хонаси';

  @override
  String get chat_start_office => 'Офис';

  @override
  String get chat_thinking => 'Ўйлаяпти…';

  @override
  String chat_tool_running(String tool) {
    return '$tool…';
  }

  @override
  String get chat_tool_result => 'Натижа';

  @override
  String get chat_inputHint => 'Хабар…';

  @override
  String get chat_newMessages => '↓ Янги хабар';

  @override
  String get chat_menuNew => 'Янги суҳбат';

  @override
  String get chat_menuReset => 'Суҳбатни тозалаш';

  @override
  String get chat_menuCustomerMode => 'Мижоз режими';

  @override
  String get chat_menuPdf => 'PDF таклиф';

  @override
  String get chat_menuShare => 'Улашиш';

  @override
  String get chat_resetConfirmTitle => 'Тозалайсизми?';

  @override
  String get chat_resetConfirmMessage => 'Контекст ўчирилади.';

  @override
  String get chat_continue => 'Давом эттириш';

  @override
  String get chat_retry => 'Қайта юбориш';

  @override
  String get tool_label_product_search => 'Маҳсулот қидирилмоқда';

  @override
  String get tool_label_curtain_calculate => 'Ҳисобланмоқда';

  @override
  String get tool_label_price_quote => 'Нарх чиқарилмоқда';

  @override
  String get tool_label_order_draft => 'Буюртма шакллантирилмоқда';

  @override
  String get tool_label_variants => 'Вариантлар тайёрланмоқда';

  @override
  String get tool_label_unknown => 'Маълумот олинмоқда';

  @override
  String get chat_quote_fabrics => 'Матолар';

  @override
  String get chat_quote_accessories => 'Безаклар';

  @override
  String get chat_quote_services => 'Хизматлар';

  @override
  String chat_quote_more(int count) {
    return 'Яна $count та бўлак';
  }

  @override
  String get chat_quote_total => 'Жами';

  @override
  String get chat_quote_howCalculated => 'Қандай ҳисобланди?';

  @override
  String get chat_quote_close => 'Ёпиш';

  @override
  String get chat_quote_show => 'Кўриш';

  @override
  String get chat_quote_addPart => 'Бўлак қўшиш';

  @override
  String get chat_quote_showOptions => 'Вариантларни кўриш';

  @override
  String get chat_options_select => 'Танлаш';

  @override
  String get chat_draft_edit => 'Таҳрирлаш';

  @override
  String get chat_draft_createOrder => 'Буюртма яратиш';

  @override
  String get chat_draft_title => 'Қоралама';

  @override
  String get orders => 'Буюртмалар';

  @override
  String get errorLoadingStatuses => 'Статусларни юклашда хатолик';

  @override
  String get orderDetail => 'Буюртма тафсилоти';

  @override
  String dateLabel(String value) {
    return 'Сана: $value';
  }

  @override
  String sellerLabel(String name) {
    return 'Сотувчи: $name';
  }

  @override
  String get customer => 'Мижоз';

  @override
  String get rooms => 'Хоналар';

  @override
  String corniceAndHeight(String cornice, String height) {
    return 'Карниз: $cornice м, Баландлик: $height м';
  }

  @override
  String get finance => 'Молия';

  @override
  String get orders_financeTotal => 'Жами';

  @override
  String get orders_financePrepayment => 'Аванс';

  @override
  String get orders_financeBalance => 'Қолдиқ';

  @override
  String get nameAndPhoneRequired => 'Исм ва телефон мажбурий';

  @override
  String errorOccurred(String message) {
    return 'Хатолик: $message';
  }

  @override
  String get newOrder => 'Янги буюртма';

  @override
  String get discount => 'Чегирма';

  @override
  String get amount => 'Сумма';

  @override
  String get prepayment => 'Аванс';

  @override
  String get note => 'Изоҳ';

  @override
  String get errorLoadingTransitions => 'Ўтишларни юклашда хатолик';

  @override
  String get cancelled => 'Бекор қилинган';

  @override
  String get profile_languageTitle => 'Тил';

  @override
  String get profile_languageOptionUz => 'Ўзбек';

  @override
  String get profile_languageOptionCyrl => 'Кирилл';

  @override
  String get profile_languageOptionRu => 'Рус';

  @override
  String get profile_themeTitle => 'Мавзу';

  @override
  String get profile_aboutTitle => 'Илова ҳақида';

  @override
  String get profile_aboutVersion => 'Версия';

  @override
  String get profile_aboutBuild => 'Build';

  @override
  String get profile_aboutEnv => 'Муҳит';

  @override
  String get profile_changePassword => 'Паролни ўзгартириш';

  @override
  String get profile_newPassword => 'Янги парол';

  @override
  String get profile_confirmPassword => 'Янги паролни такрорланг';

  @override
  String get profile_passwordChanged => 'Парол ўзгартирилди';

  @override
  String get profile_themeSystem => 'Тизим';

  @override
  String get profile_themeLight => 'Ёруғ';

  @override
  String get profile_themeDark => 'Қоронғи';

  @override
  String get profile_logout => 'Чиқиш';

  @override
  String get profile_logoutConfirmTitle => 'Чиқиш?';

  @override
  String get profile_logoutConfirmMessage => 'Ҳисобингиздан чиқмоқчимисиз?';

  @override
  String get profile_roleEmployee => 'Ходим';

  @override
  String get profile_roleManager => 'Менежер';

  @override
  String get profile_roleAdmin => 'Админ';

  @override
  String get profile_roleUnknown => 'Номаълум';

  @override
  String get profile_todaySpend => 'Бугунги сарф';

  @override
  String get profile_limitDailyReset => 'Кунлик лимит соат 24:00 да янгиланади';

  @override
  String get profile_limitNotSet => 'Лимит ўрнатилмаган';

  @override
  String get profile_unlimited => 'Чексиз';

  @override
  String get currency_som => 'сўм';

  @override
  String get management_periodToday => 'Бугун';

  @override
  String get management_periodWeek => 'Ҳафта';

  @override
  String get management_periodMonth => 'Ой';

  @override
  String get management_chartTitle => 'Кунлик сарф';

  @override
  String get management_usageDetails => 'Сарф тафсилотлари';

  @override
  String get management_usageTokens => 'Токенлар';

  @override
  String get management_usageMessages => 'Хабарлар';

  @override
  String get management_statsTitle => 'Статистика';

  @override
  String get management_chartEmpty => 'График учун маълумот йўқ';

  @override
  String get management_statThreads => 'Суҳбатлар';

  @override
  String get management_statOrders => 'Буюртмалар';

  @override
  String get management_statConversion => 'Конверсия';

  @override
  String get management_statCost => 'Сарф';

  @override
  String get management_rankingTitle => 'Ходимлар рейтинги';

  @override
  String get management_rankingEmployeeCol => 'Ходим';

  @override
  String get management_rankingChatsCol => 'Суҳбат';

  @override
  String get management_rankingCostCol => 'Сарф';

  @override
  String get management_rankingOrdersCol => 'Буюртма';

  @override
  String get management_sectionEmployees => 'Ходимлар';

  @override
  String get management_sectionProducts => 'Маҳсулотлар';

  @override
  String get management_sectionPricing => 'Нарх қоидалари';

  @override
  String get management_sectionKnowledge => 'Билимлар';

  @override
  String get management_sectionSettings => 'Созламалар';

  @override
  String get management_employeesTitle => 'Ходимлар';

  @override
  String get management_employeesSearchHint => 'Ходим қидириш';

  @override
  String get management_employeeAdd => 'Ходим қўшиш';

  @override
  String management_employeeLastActive(String date) {
    return 'Охирги фаоллик: $date';
  }

  @override
  String management_employeeTodayMeta(int chats, int messages) {
    return 'Суҳбатлар $chats · Хабарлар $messages';
  }

  @override
  String get management_employeeBlocked => 'Блокланган';

  @override
  String get management_createTitle => 'Ходим қўшиш';

  @override
  String get management_createPhone => 'Телефон рақами';

  @override
  String get management_createName => 'Исм ва фамилия';

  @override
  String get management_createPassword => 'Бошланғич парол';

  @override
  String get management_createRole => 'Рол';

  @override
  String get management_employeeProfileTitle => 'Ходим профили';

  @override
  String get management_employeeChangePassword => 'Паролни ўзгартириш';

  @override
  String get management_employeeNewPassword => 'Янги парол';

  @override
  String get management_employeeConfirmPassword => 'Янги паролни такрорланг';

  @override
  String get management_employeePasswordChanged => 'Парол ўзгартирилди';

  @override
  String get management_limitTitle => 'Кунлик лимит';

  @override
  String get management_limitCost => 'Сарф сўм';

  @override
  String get management_limitMessages => 'Хабарлар сони';

  @override
  String get management_limitTokens => 'Токенлар';

  @override
  String get management_onExceedWarn => 'Огоҳлантириш';

  @override
  String get management_onExceedBlock => 'Блоклаш';

  @override
  String get management_limitSet => 'Лимитни сақлаш';

  @override
  String get management_employeeViewThreads => 'Суҳбатларини кўриш';

  @override
  String get management_employeeConversationsTitle => 'Ходим суҳбатлари';

  @override
  String get management_employeeBlockConfirmTitle => 'Ходимни блоклаш?';

  @override
  String get management_employeeBlockConfirmMessage =>
      'Блокланган ходим тизимга кира олмайди. Давом этасизми?';

  @override
  String get management_employeeUnblockConfirmTitle => 'Ходимни фаоллаштириш?';

  @override
  String get management_employeeUnblockConfirmMessage =>
      'Ходим тизимга қайта кира олади. Давом этасизми?';

  @override
  String get management_conversationsEmptyTitle => 'Суҳбатлар йўқ';

  @override
  String get management_conversationsEmptyMessage => 'Бу ходимнинг ҳозирча суҳбатлари йўқ';

  @override
  String get management_transcriptTitle => 'Транскрипт';

  @override
  String get management_transcriptEmpty => 'Хабарлар йўқ';

  @override
  String get management_transcriptUser => 'Фойдаланувчи';

  @override
  String get management_transcriptAssistant => 'AI';

  @override
  String get management_transcriptTool => 'Асбоб';

  @override
  String get management_employeeBlock => 'Блоклаш';

  @override
  String get management_employeeUnblock => 'Фаоллаштириш';

  @override
  String get management_employeesEmptyMessage => 'Жамоада ҳозирча ходимлар йўқ';

  @override
  String get management_employeesEmptyTitle => 'Ходимлар топилмади';

  @override
  String get management_employeesSearchEmptyMessage => 'Бошқа сўз билан қидириб кўринг';

  @override
  String get management_employeesSearchEmptyTitle => 'Натижа топилмади';

  @override
  String get management_limitPeriodDay => 'Кунлик';

  @override
  String get management_limitPeriodMonth => 'Ойлик';

  @override
  String get management_limitUnlimited => 'Чексиз';

  @override
  String get management_statsEmpty => 'Маълумотлар ҳозирча йўқ';

  @override
  String get management_sectionTitle => 'Бўлимлар';

  @override
  String get management_createPhoneError => 'Телефон рақамини тўлиқ киритинг';

  @override
  String get management_productFormTitle => 'Махсулот шакли';

  @override
  String get management_productName => 'Номи';

  @override
  String get management_productsTitle => 'Махсулотларни бошқариш';

  @override
  String get management_productsList => 'Рўйхат';

  @override
  String get management_knowledgeTitle => 'Билим қоидалари';

  @override
  String get management_knowledgeList => 'Билим қоидалари рўйхати';

  @override
  String get management_pricingTitle => 'Нарх қоидалари';

  @override
  String get management_pricingCoefficients => 'Коэффициентлар инлайн таҳрир';

  @override
  String get management_pricingTiers => 'Чегирма даражалари жадвали';

  @override
  String get management_pricingDefaults => 'Оддий қийматлар';

  @override
  String get management_pricingTest => 'Ҳисобни синаш';

  @override
  String get management_pricingServicesTitle => 'Хизматлар';

  @override
  String get management_pricingServicesEmpty => 'Хизматлар топилмади';

  @override
  String get management_pricingServiceActive => 'Фаол';

  @override
  String get management_pricingServiceInactive => 'Фаол эмас';

  @override
  String get management_pricingServicePrice => 'Нарх';

  @override
  String get management_pricingServicePriceHint => 'Хизмат нархини сўмда киритинг';

  @override
  String get management_bulkPriceTitle => 'Нархни ўзгартириш';

  @override
  String get management_bulkPricePercent10 => '+10%';

  @override
  String get management_bulkPricePercent5 => '-5%';

  @override
  String get management_bulkPriceAmount => 'Янги нарх';

  @override
  String get management_bulkPricePercentHint => 'Фоиз';

  @override
  String get management_bulkPriceAmountHint => 'Сумма';

  @override
  String get management_bulkPricePreview => 'Олдиндан кўриш:';

  @override
  String get management_pricingPolicyHint =>
      'Қўлда максимал чегирма лимитлари. АИ таклифи бу лимитдан ошмайди.';

  @override
  String get management_pricingStackWithTier => 'Босқичли чегирма билан жамлаш';

  @override
  String get management_pricingDeadlineDays => 'Муддат (кун)';

  @override
  String get management_pricingCoefsEmpty => 'Коэффициентлар топилмади';

  @override
  String get management_pricingTiersEmpty => 'Чегирма босқичлари ҳозирча йўқ';

  @override
  String get management_pricingSaveError => 'Сақлашда хатолик юз берди';

  @override
  String get management_pricingPreviewError => 'Ҳисоблашда хатолик юз берди';

  @override
  String get management_knowledgeEditTitle => 'Қоидани таҳрирлаш';

  @override
  String get management_knowledgeEmptyTitle => 'Қоидалар йўқ';

  @override
  String get management_knowledgeEmptyMessage => 'Ҳозирча билим қоидалари қўшилмаган';

  @override
  String get management_knowledgeErrorTitle => 'Юклаб бўлмади';

  @override
  String get management_knowledgeConditionHint => 'Шарт қўшиш';

  @override
  String get management_knowledgeRemove => 'Ўчириш';

  @override
  String get management_knowledgeRemoveConfirmTitle => 'Қоидани ўчириш?';

  @override
  String get management_knowledgeRemoveConfirmMessage =>
      'Қоида бутунлай ўчирилади. Давом этасизми?';

  @override
  String get management_knowledgeRuleRemoved => 'Қоида ўчирилди';

  @override
  String get management_knowledgeRulePriorityHint => 'Устуворлик';

  @override
  String management_knowledgeRulePriorityLabel(int value) {
    return 'Устуворлик: $value';
  }

  @override
  String get management_productsSearchHint => 'Маҳсулот номи, SKU қидириш';

  @override
  String get management_productsAll => 'Барчаси';

  @override
  String get management_productsEmptyTitle => 'Маҳсулотлар топилмади';

  @override
  String get management_productsEmptyMessage => 'Қидирув ёки фильтр шартини ўзгартириб кўринг';

  @override
  String get management_productsLoadError => 'Юклаб бўлмади';

  @override
  String get management_bulkApplied => 'Нарх янгиланди';

  @override
  String management_productsSelected(int count) {
    return '$count та танланди';
  }

  @override
  String get management_productFormEditTitle => 'Маҳсулотни таҳрирлаш';

  @override
  String get management_productFormBasic => 'Асосий';

  @override
  String get management_productFormName => 'Номи';

  @override
  String get management_productFormCode => 'Коди';

  @override
  String get management_productFormCategory => 'Категория';

  @override
  String get management_productFormDescription => 'Тавсиф';

  @override
  String get management_productFormFabricType => 'Мато тури';

  @override
  String get management_productFormComposition => 'Таркиби';

  @override
  String get management_productFormCare => 'Парвариш қилиш';

  @override
  String get management_productFormSegment => 'Сегмент';

  @override
  String get management_productFormRecommendedRooms => 'Тавсия қилинадиган хоналар';

  @override
  String get management_productFormBasePrice => 'Асосий нарх';

  @override
  String get management_productFormPrice => 'Нарх';

  @override
  String get management_productFormCost => 'Таннарх';

  @override
  String get management_productFormVariants => 'Вариантлар';

  @override
  String get management_productFormAddVariant => 'Вариант қўшиш';

  @override
  String get management_productFormVariantsEmpty => 'Ҳали вариант қўшилмаган';

  @override
  String management_productFormVariantLabel(int index) {
    return 'Вариант $index';
  }

  @override
  String get management_productFormRemoveVariantTitle => 'Вариант ўчирилсинми?';

  @override
  String get management_productFormRemoveVariantMessage => 'Бу амални қайтариб бўлмайди';

  @override
  String get management_productFormRemoveVariant => 'Ўчириш';

  @override
  String get management_productFormSku => 'SKU';

  @override
  String get management_productFormColorName => 'Ранг номи';

  @override
  String get management_productFormColorHex => 'Ранг (hex)';

  @override
  String get management_productFormWidth => 'Эни (м)';

  @override
  String get management_productFormIsActive => 'Фаол';

  @override
  String get management_productFormSaved => 'Сақланди';

  @override
  String get chat_listening => 'Эшитяпман...';

  @override
  String get chat_stopVoice => 'Тўхтатиш';

  @override
  String get chat_transcriptLabel => 'ТРАНСКРИПТ';

  @override
  String get chat_voiceMode => 'Овозли режим';

  @override
  String get chat_textMode => 'Матнли режим';

  @override
  String get chat_customerModeTitle => 'Мижоз режими';

  @override
  String get chat_enterPinTitle => 'ПИН кодни киритинг';

  @override
  String get chat_setPinTitle => 'Мижоз режими учун ПИН ўрнатинг';

  @override
  String get chat_confirmPinTitle => 'ПИН кодни тасдиқланг';

  @override
  String get chat_pinMismatch => 'ПИН кодлар мос тушмади';

  @override
  String get chat_pinIncorrect => 'ПИН код нотўғри';

  @override
  String chat_pinAttemptsWait(int seconds) {
    return 'Жуда кўп хато уринишлар. $seconds сония кутинг.';
  }

  @override
  String pin_attemptsLeft(int count) {
    return 'ПИН код нотўғри. Яна $count уриниш қолди.';
  }

  @override
  String get chat_pdfRequireOrder => 'Аввал буюртма яратинг';

  @override
  String get orders_pdf => 'PDF';

  @override
  String get orders_share => 'Улашиш';

  @override
  String get settings_systemPromptTitle => 'Тизим промпти';

  @override
  String get settings_currentPrompt => 'ЖОРИЙ ПРОМПТ';

  @override
  String get settings_promptHint => 'Промпт матни';

  @override
  String get settings_promptEmpty => 'Ҳали промпт йўқ';

  @override
  String get settings_saveNewVersion => 'Янги версияни сақлаш';

  @override
  String get settings_versionHistory => 'ВЕРСИЯЛАР ТАРИХИ';

  @override
  String settings_version(int version) {
    return 'v$version';
  }

  @override
  String get settings_rollback => 'Қайтариш';

  @override
  String get settings_rollbackConfirmTitle => 'Версияга қайтиш?';

  @override
  String get settings_rollbackConfirmMessage => 'Ҳақиқатан ҳам ушбу версияга қайтасизми?';

  @override
  String get settings_authorUnknown => 'Номаълум';

  @override
  String get settings_modelPricingsTitle => 'Модель нархлари';

  @override
  String settings_modelProviderModel(String provider, String model) {
    return '$provider — $model';
  }

  @override
  String settings_modelInput(double price) {
    return 'Кириш (1M): $price';
  }

  @override
  String settings_modelOutput(double price) {
    return 'Чиқиш (1M): $price';
  }

  @override
  String settings_modelCached(double price) {
    return 'Кеш (1M): $price';
  }

  @override
  String settings_modelStt(double price) {
    return 'STT (дақиқа): $price';
  }

  @override
  String settings_modelTts(double price) {
    return 'TTS (1k белги): $price';
  }

  @override
  String settings_modelUsdToUzs(double value) {
    return 'USD → UZS: $value';
  }

  @override
  String get settings_active => 'Фаол';

  @override
  String get settings_inactive => 'Нофаол';

  @override
  String get settings_delete => 'Ўчириш';

  @override
  String get chat_addAttachment => 'Қўшиш';

  @override
  String get chat_microphone => 'Микрофон';

  @override
  String get chat_send => 'Юбориш';

  @override
  String get chat_draft_customer => 'Мижоз';

  @override
  String get chat_draft_phone => 'Телефон рақам';

  @override
  String get chat_draft_address => 'Манзил';

  @override
  String get chat_draft_missingFields => 'Тўлдириш керак бўлган майдонлар';

  @override
  String get chat_start_livingRoom_sub => 'Парда ва дизайн танлаш';

  @override
  String get chat_start_bedroom_sub => 'Қоронғи ва осойишта';

  @override
  String get chat_start_couple_sub => 'Романтик ва шинам';

  @override
  String get chat_start_kitchen_sub => 'Амалий ва ёруғ';

  @override
  String get chat_start_kids_sub => 'Ўйин ва қизиқарли';

  @override
  String get chat_start_office_sub => 'Сокин ва ишчан';

  @override
  String get catalog_filterPriceFrom => 'Дан';

  @override
  String get catalog_filterPriceTo => 'Гача';

  @override
  String get common_delete => 'Ўчириш';

  @override
  String management_pricingTierRow(String minAmount) {
    return '$minAmount сўм дан';
  }

  @override
  String get chat_quote_title => 'Ҳисоб';

  @override
  String get chat_quote_room => 'Хона';
}
