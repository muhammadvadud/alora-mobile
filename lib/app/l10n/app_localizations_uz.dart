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
  String get common_noInternet =>
      'Internet yo\'q. Ulanish tiklanganda avtomatik yuboriladi';

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
  String get error_permission => 'Ruxsat yo\'q';

  @override
  String get error_notFound => 'Topilmadi';

  @override
  String get error_limit => 'Limit tugadi';

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
  String get login_forgotPassword =>
      'Parolni unutdingizmi? Menejer bilan bog\'laning';

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
  String get forbidden_text =>
      'Bu bo\'limga faqat menejer yoki admin kirishi mumkin';

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
  String get catalog_emptyMessage =>
      'Filtrlarni o\'zgartiring yoki qidiruv so\'zini o\'zgartiring';

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
  String get conversations_archiveDialogMessage =>
      'Suhbat arxivga ko\'chiriladi';

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
  String get chat_quote_fabrics => 'MATOLAR';

  @override
  String get chat_quote_accessories => 'BEZAKLAR';

  @override
  String get chat_quote_services => 'XIZMATLAR';

  @override
  String chat_quote_more(int count) {
    return 'Yana $count ta bo\'lak';
  }

  @override
  String get chat_quote_total => 'JAMI';

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
  String get chat_draft_title => 'QORALAMA';

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
  String get common_noInternet =>
      'Интернет йўқ. Уланиш тикланганда автоматик юборилади';

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
  String get error_permission => 'Рухсат йўқ';

  @override
  String get error_notFound => 'Топилмади';

  @override
  String get error_limit => 'Лимит тугади';

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
  String get login_forgotPassword =>
      'Паролни унутдингизми? Менеджер билан боғланинг';

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
  String get catalog_emptyMessage =>
      'Фильтрларни ўзгартиргинг ёки қидирув сўзини ўзгартириш';

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
  String get chat_quote_fabrics => 'МАТОЛАР';

  @override
  String get chat_quote_accessories => 'БЕЗАКЛАР';

  @override
  String get chat_quote_services => 'ХИЗМАТЛАР';

  @override
  String chat_quote_more(int count) {
    return 'Яна $count та бўлак';
  }

  @override
  String get chat_quote_total => 'ЖАМИ';

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
  String get chat_draft_title => 'ҚОРАЛАМА';

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
}
