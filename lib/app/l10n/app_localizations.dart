import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ru.dart';
import 'app_localizations_uz.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ru'),
    Locale('uz'),
    Locale.fromSubtags(languageCode: 'uz', scriptCode: 'Cyrl'),
  ];

  /// No description provided for @app_name.
  ///
  /// In uz, this message translates to:
  /// **'Alora'**
  String get app_name;

  /// No description provided for @common_retry.
  ///
  /// In uz, this message translates to:
  /// **'Qayta urinish'**
  String get common_retry;

  /// No description provided for @common_cancel.
  ///
  /// In uz, this message translates to:
  /// **'Bekor qilish'**
  String get common_cancel;

  /// No description provided for @common_save.
  ///
  /// In uz, this message translates to:
  /// **'Saqlash'**
  String get common_save;

  /// No description provided for @common_ok.
  ///
  /// In uz, this message translates to:
  /// **'OK'**
  String get common_ok;

  /// No description provided for @common_loading.
  ///
  /// In uz, this message translates to:
  /// **'Yuklanmoqda…'**
  String get common_loading;

  /// No description provided for @common_noInternet.
  ///
  /// In uz, this message translates to:
  /// **'Internet yo\'q. Ulanish tiklanganda avtomatik yuboriladi'**
  String get common_noInternet;

  /// No description provided for @common_error.
  ///
  /// In uz, this message translates to:
  /// **'Xatolik yuz berdi'**
  String get common_error;

  /// No description provided for @common_search.
  ///
  /// In uz, this message translates to:
  /// **'Qidiruv'**
  String get common_search;

  /// No description provided for @common_close.
  ///
  /// In uz, this message translates to:
  /// **'Yopish'**
  String get common_close;

  /// No description provided for @error_network.
  ///
  /// In uz, this message translates to:
  /// **'Ulanish yo\'q. Internetni tekshiring.'**
  String get error_network;

  /// No description provided for @error_auth.
  ///
  /// In uz, this message translates to:
  /// **'Sessiya muddati tugadi. Iltimos, qayta kiring.'**
  String get error_auth;

  /// No description provided for @offline_flushFailed.
  ///
  /// In uz, this message translates to:
  /// **'Serverda yangi ma\'lumot bor. Ba\'zi o\'zgarishlar saqlanmadi.'**
  String get offline_flushFailed;

  /// No description provided for @error_permission.
  ///
  /// In uz, this message translates to:
  /// **'Ruxsat yo\'q'**
  String get error_permission;

  /// No description provided for @error_notFound.
  ///
  /// In uz, this message translates to:
  /// **'Topilmadi'**
  String get error_notFound;

  /// No description provided for @error_limit.
  ///
  /// In uz, this message translates to:
  /// **'Limit tugadi'**
  String get error_limit;

  /// No description provided for @orders_confirm.
  ///
  /// In uz, this message translates to:
  /// **'Tasdiqlash'**
  String get orders_confirm;

  /// No description provided for @orders_confirmedSnack.
  ///
  /// In uz, this message translates to:
  /// **'Buyurtma tasdiqlandi'**
  String get orders_confirmedSnack;

  /// No description provided for @orders_createdSnack.
  ///
  /// In uz, this message translates to:
  /// **'Buyurtma yaratildi'**
  String get orders_createdSnack;

  /// No description provided for @chat_defaultTitle.
  ///
  /// In uz, this message translates to:
  /// **'Mijoz'**
  String get chat_defaultTitle;

  /// No description provided for @chat_noConversation.
  ///
  /// In uz, this message translates to:
  /// **'Suhbat tanlanmagan'**
  String get chat_noConversation;

  /// No description provided for @limit_callManager.
  ///
  /// In uz, this message translates to:
  /// **'Qo\'ng\'iroq'**
  String get limit_callManager;

  /// No description provided for @limit_smsManager.
  ///
  /// In uz, this message translates to:
  /// **'SMS'**
  String get limit_smsManager;

  /// No description provided for @error_serviceUnavailable.
  ///
  /// In uz, this message translates to:
  /// **'AI xizmati vaqtincha ishlamayapti'**
  String get error_serviceUnavailable;

  /// No description provided for @error_server.
  ///
  /// In uz, this message translates to:
  /// **'Server javob bermadi'**
  String get error_server;

  /// No description provided for @error_unknown.
  ///
  /// In uz, this message translates to:
  /// **'Noma\'lum xatolik'**
  String get error_unknown;

  /// No description provided for @order_status_draft.
  ///
  /// In uz, this message translates to:
  /// **'Qoralama'**
  String get order_status_draft;

  /// No description provided for @order_status_confirmed.
  ///
  /// In uz, this message translates to:
  /// **'Tasdiqlangan'**
  String get order_status_confirmed;

  /// No description provided for @order_status_measuring.
  ///
  /// In uz, this message translates to:
  /// **'O\'lchovda'**
  String get order_status_measuring;

  /// No description provided for @order_status_production.
  ///
  /// In uz, this message translates to:
  /// **'Tikuvda'**
  String get order_status_production;

  /// No description provided for @order_status_ready.
  ///
  /// In uz, this message translates to:
  /// **'Tayyor'**
  String get order_status_ready;

  /// No description provided for @order_status_installing.
  ///
  /// In uz, this message translates to:
  /// **'O\'rnatishda'**
  String get order_status_installing;

  /// No description provided for @order_status_completed.
  ///
  /// In uz, this message translates to:
  /// **'Topshirildi'**
  String get order_status_completed;

  /// No description provided for @order_status_cancelled.
  ///
  /// In uz, this message translates to:
  /// **'Bekor qilingan'**
  String get order_status_cancelled;

  /// No description provided for @order_status_unknown.
  ///
  /// In uz, this message translates to:
  /// **'Noma\'lum'**
  String get order_status_unknown;

  /// No description provided for @payment_status_advancePaid.
  ///
  /// In uz, this message translates to:
  /// **'Avans olindi'**
  String get payment_status_advancePaid;

  /// No description provided for @payment_status_fullyPaid.
  ///
  /// In uz, this message translates to:
  /// **'To\'liq to\'landi'**
  String get payment_status_fullyPaid;

  /// No description provided for @payment_status_debt.
  ///
  /// In uz, this message translates to:
  /// **'Qarz bor'**
  String get payment_status_debt;

  /// No description provided for @payment_status_unknown.
  ///
  /// In uz, this message translates to:
  /// **'Noma\'lum'**
  String get payment_status_unknown;

  /// No description provided for @price_unit_perSqm.
  ///
  /// In uz, this message translates to:
  /// **'so\'m/m²'**
  String get price_unit_perSqm;

  /// No description provided for @price_unit_perPiece.
  ///
  /// In uz, this message translates to:
  /// **'so\'m/dona'**
  String get price_unit_perPiece;

  /// No description provided for @price_unit_perMeter.
  ///
  /// In uz, this message translates to:
  /// **'so\'m/m'**
  String get price_unit_perMeter;

  /// No description provided for @price_unit_unknown.
  ///
  /// In uz, this message translates to:
  /// **''**
  String get price_unit_unknown;

  /// No description provided for @login_tagline.
  ///
  /// In uz, this message translates to:
  /// **'Parda savdosi uchun ish quroli'**
  String get login_tagline;

  /// No description provided for @login_phoneLabel.
  ///
  /// In uz, this message translates to:
  /// **'Telefon raqami'**
  String get login_phoneLabel;

  /// No description provided for @login_passwordLabel.
  ///
  /// In uz, this message translates to:
  /// **'Parol'**
  String get login_passwordLabel;

  /// No description provided for @login_signIn.
  ///
  /// In uz, this message translates to:
  /// **'Kirish'**
  String get login_signIn;

  /// No description provided for @login_forgotPassword.
  ///
  /// In uz, this message translates to:
  /// **'Parolni unutdingizmi? Menejer bilan bog\'laning'**
  String get login_forgotPassword;

  /// No description provided for @login_errorAuthFailed.
  ///
  /// In uz, this message translates to:
  /// **'Kirish ma\'lumotlari noto\'g\'ri'**
  String get login_errorAuthFailed;

  /// No description provided for @login_errorRequired.
  ///
  /// In uz, this message translates to:
  /// **'Telefon raqam va parolni kiriting'**
  String get login_errorRequired;

  /// No description provided for @tab_chat.
  ///
  /// In uz, this message translates to:
  /// **'Chat'**
  String get tab_chat;

  /// No description provided for @tab_orders.
  ///
  /// In uz, this message translates to:
  /// **'Buyurtmalar'**
  String get tab_orders;

  /// No description provided for @tab_catalog.
  ///
  /// In uz, this message translates to:
  /// **'Katalog'**
  String get tab_catalog;

  /// No description provided for @tab_management.
  ///
  /// In uz, this message translates to:
  /// **'Boshqaruv'**
  String get tab_management;

  /// No description provided for @tab_profile.
  ///
  /// In uz, this message translates to:
  /// **'Profil'**
  String get tab_profile;

  /// No description provided for @placeholder_comingSoon.
  ///
  /// In uz, this message translates to:
  /// **'Bo\'lim tayyorlanmoqda'**
  String get placeholder_comingSoon;

  /// No description provided for @forbidden_title.
  ///
  /// In uz, this message translates to:
  /// **'Ruxsat yo\'q'**
  String get forbidden_title;

  /// No description provided for @forbidden_text.
  ///
  /// In uz, this message translates to:
  /// **'Bu bo\'limga faqat menejer yoki admin kirishi mumkin'**
  String get forbidden_text;

  /// No description provided for @catalog_searchHint.
  ///
  /// In uz, this message translates to:
  /// **'Mahsulot qidirish'**
  String get catalog_searchHint;

  /// No description provided for @catalog_allCategories.
  ///
  /// In uz, this message translates to:
  /// **'Hammasi'**
  String get catalog_allCategories;

  /// No description provided for @catalog_filter.
  ///
  /// In uz, this message translates to:
  /// **'Filtrlash'**
  String get catalog_filter;

  /// No description provided for @catalog_filterClear.
  ///
  /// In uz, this message translates to:
  /// **'Tozalash'**
  String get catalog_filterClear;

  /// No description provided for @catalog_filterShow.
  ///
  /// In uz, this message translates to:
  /// **'Ko\'rsatish ({count} ta)'**
  String catalog_filterShow(int count);

  /// No description provided for @catalog_emptyTitle.
  ///
  /// In uz, this message translates to:
  /// **'Hech narsa topilmadi'**
  String get catalog_emptyTitle;

  /// No description provided for @catalog_emptyMessage.
  ///
  /// In uz, this message translates to:
  /// **'Filtrlarni o\'zgartiring yoki qidiruv so\'zini o\'zgartiring'**
  String get catalog_emptyMessage;

  /// No description provided for @catalog_filterType.
  ///
  /// In uz, this message translates to:
  /// **'Tur'**
  String get catalog_filterType;

  /// No description provided for @catalog_filterTypeFabric.
  ///
  /// In uz, this message translates to:
  /// **'Matolar'**
  String get catalog_filterTypeFabric;

  /// No description provided for @catalog_filterTypeAccessory.
  ///
  /// In uz, this message translates to:
  /// **'Aksessuarlar'**
  String get catalog_filterTypeAccessory;

  /// No description provided for @catalog_filterStyle.
  ///
  /// In uz, this message translates to:
  /// **'Uslub'**
  String get catalog_filterStyle;

  /// No description provided for @catalog_filterStyleKlassik.
  ///
  /// In uz, this message translates to:
  /// **'Klassik'**
  String get catalog_filterStyleKlassik;

  /// No description provided for @catalog_filterStyleZamonaviy.
  ///
  /// In uz, this message translates to:
  /// **'Zamonaviy'**
  String get catalog_filterStyleZamonaviy;

  /// No description provided for @catalog_filterStyleMinimalist.
  ///
  /// In uz, this message translates to:
  /// **'Minimalist'**
  String get catalog_filterStyleMinimalist;

  /// No description provided for @catalog_filterRoom.
  ///
  /// In uz, this message translates to:
  /// **'Xona'**
  String get catalog_filterRoom;

  /// No description provided for @catalog_filterRoomMehmonxona.
  ///
  /// In uz, this message translates to:
  /// **'Mehmonxona'**
  String get catalog_filterRoomMehmonxona;

  /// No description provided for @catalog_filterRoomYotoqxona.
  ///
  /// In uz, this message translates to:
  /// **'Yotoqxona'**
  String get catalog_filterRoomYotoqxona;

  /// No description provided for @catalog_filterRoomOshxona.
  ///
  /// In uz, this message translates to:
  /// **'Oshxona'**
  String get catalog_filterRoomOshxona;

  /// No description provided for @catalog_filterRoomBolalarXonasi.
  ///
  /// In uz, this message translates to:
  /// **'Bolalar xonasi'**
  String get catalog_filterRoomBolalarXonasi;

  /// No description provided for @catalog_filterRoomOfis.
  ///
  /// In uz, this message translates to:
  /// **'Ofis'**
  String get catalog_filterRoomOfis;

  /// No description provided for @catalog_filterPattern.
  ///
  /// In uz, this message translates to:
  /// **'Naqsh'**
  String get catalog_filterPattern;

  /// No description provided for @catalog_filterPatternYassi.
  ///
  /// In uz, this message translates to:
  /// **'Yassi'**
  String get catalog_filterPatternYassi;

  /// No description provided for @catalog_filterPatternGulli.
  ///
  /// In uz, this message translates to:
  /// **'Gulli'**
  String get catalog_filterPatternGulli;

  /// No description provided for @catalog_filterPatternChiziqli.
  ///
  /// In uz, this message translates to:
  /// **'Chiziqli'**
  String get catalog_filterPatternChiziqli;

  /// No description provided for @catalog_filterPatternGeometrik.
  ///
  /// In uz, this message translates to:
  /// **'Geometrik'**
  String get catalog_filterPatternGeometrik;

  /// No description provided for @catalog_filterTransparency.
  ///
  /// In uz, this message translates to:
  /// **'Shaffoflik'**
  String get catalog_filterTransparency;

  /// No description provided for @catalog_filterTransparencyYopiq.
  ///
  /// In uz, this message translates to:
  /// **'Yopiq'**
  String get catalog_filterTransparencyYopiq;

  /// No description provided for @catalog_filterTransparencyYarimYorug.
  ///
  /// In uz, this message translates to:
  /// **'Yarim yorug\''**
  String get catalog_filterTransparencyYarimYorug;

  /// No description provided for @catalog_filterTransparencyYorug.
  ///
  /// In uz, this message translates to:
  /// **'Yorug\''**
  String get catalog_filterTransparencyYorug;

  /// No description provided for @catalog_filterSegment.
  ///
  /// In uz, this message translates to:
  /// **'Segment'**
  String get catalog_filterSegment;

  /// No description provided for @catalog_filterSegmentEconomy.
  ///
  /// In uz, this message translates to:
  /// **'Iqtisod'**
  String get catalog_filterSegmentEconomy;

  /// No description provided for @catalog_filterSegmentStandard.
  ///
  /// In uz, this message translates to:
  /// **'Standart'**
  String get catalog_filterSegmentStandard;

  /// No description provided for @catalog_filterSegmentPremium.
  ///
  /// In uz, this message translates to:
  /// **'Premium'**
  String get catalog_filterSegmentPremium;

  /// No description provided for @catalog_filterPrice.
  ///
  /// In uz, this message translates to:
  /// **'Narx'**
  String get catalog_filterPrice;

  /// No description provided for @catalog_filterPriceRange.
  ///
  /// In uz, this message translates to:
  /// **'{min} — {max} so\'m'**
  String catalog_filterPriceRange(int min, int max);

  /// No description provided for @catalog_filterPriceRangeFormatted.
  ///
  /// In uz, this message translates to:
  /// **'{min} — {max} so\'m'**
  String catalog_filterPriceRangeFormatted(String min, String max);

  /// No description provided for @product_category.
  ///
  /// In uz, this message translates to:
  /// **'Kategoriya'**
  String get product_category;

  /// No description provided for @product_properties.
  ///
  /// In uz, this message translates to:
  /// **'Xususiyatlar'**
  String get product_properties;

  /// No description provided for @product_askAi.
  ///
  /// In uz, this message translates to:
  /// **'AI\'dan so\'rash'**
  String get product_askAi;

  /// No description provided for @product_addToAccount.
  ///
  /// In uz, this message translates to:
  /// **'Hisobga qo\'shish'**
  String get product_addToAccount;

  /// No description provided for @product_variantSelected.
  ///
  /// In uz, this message translates to:
  /// **'Tanlangan'**
  String get product_variantSelected;

  /// No description provided for @product_colorLabel.
  ///
  /// In uz, this message translates to:
  /// **'Rang'**
  String get product_colorLabel;

  /// No description provided for @product_rollWidthValue.
  ///
  /// In uz, this message translates to:
  /// **'{value} {unit}'**
  String product_rollWidthValue(String value, String unit);

  /// No description provided for @product_fabricType.
  ///
  /// In uz, this message translates to:
  /// **'Mato turi'**
  String get product_fabricType;

  /// No description provided for @product_rollWidth.
  ///
  /// In uz, this message translates to:
  /// **'Rulon eni'**
  String get product_rollWidth;

  /// No description provided for @product_composition.
  ///
  /// In uz, this message translates to:
  /// **'Tarkib'**
  String get product_composition;

  /// No description provided for @product_care.
  ///
  /// In uz, this message translates to:
  /// **'Parvarish'**
  String get product_care;

  /// No description provided for @product_unitCm.
  ///
  /// In uz, this message translates to:
  /// **'sm'**
  String get product_unitCm;

  /// No description provided for @product_sewingRequired.
  ///
  /// In uz, this message translates to:
  /// **'Tikish kerak'**
  String get product_sewingRequired;

  /// No description provided for @product_askAiMessage.
  ///
  /// In uz, this message translates to:
  /// **'Shu mato ({name}, {color}) mehmonxonaga to\'g\'ri keladimi?'**
  String product_askAiMessage(String name, String color);

  /// No description provided for @product_addToAccountMessage.
  ///
  /// In uz, this message translates to:
  /// **'Hisobga qo\'sh: {variant}'**
  String product_addToAccountMessage(String variant);

  /// No description provided for @conversations_title.
  ///
  /// In uz, this message translates to:
  /// **'Suhbatlar'**
  String get conversations_title;

  /// No description provided for @conversations_searchHint.
  ///
  /// In uz, this message translates to:
  /// **'Suhbat yoki mijoz'**
  String get conversations_searchHint;

  /// No description provided for @conversations_filterAll.
  ///
  /// In uz, this message translates to:
  /// **'Hammasi'**
  String get conversations_filterAll;

  /// No description provided for @conversations_filterHasOrder.
  ///
  /// In uz, this message translates to:
  /// **'Hisob chiqarilgan'**
  String get conversations_filterHasOrder;

  /// No description provided for @conversations_filterInProgress.
  ///
  /// In uz, this message translates to:
  /// **'Yakunlanmagan'**
  String get conversations_filterInProgress;

  /// No description provided for @conversations_stageNeed.
  ///
  /// In uz, this message translates to:
  /// **'ehtiyoj'**
  String get conversations_stageNeed;

  /// No description provided for @conversations_stageRecommend.
  ///
  /// In uz, this message translates to:
  /// **'tavsiya'**
  String get conversations_stageRecommend;

  /// No description provided for @conversations_stageMeasure.
  ///
  /// In uz, this message translates to:
  /// **'o\'lchov'**
  String get conversations_stageMeasure;

  /// No description provided for @conversations_stageCalc.
  ///
  /// In uz, this message translates to:
  /// **'hisob'**
  String get conversations_stageCalc;

  /// No description provided for @conversations_stageVariants.
  ///
  /// In uz, this message translates to:
  /// **'variantlar'**
  String get conversations_stageVariants;

  /// No description provided for @conversations_stageOrder.
  ///
  /// In uz, this message translates to:
  /// **'buyurtma'**
  String get conversations_stageOrder;

  /// No description provided for @conversations_stageUnknown.
  ///
  /// In uz, this message translates to:
  /// **'noma\'lum'**
  String get conversations_stageUnknown;

  /// No description provided for @conversations_groupToday.
  ///
  /// In uz, this message translates to:
  /// **'Bugun'**
  String get conversations_groupToday;

  /// No description provided for @conversations_groupYesterday.
  ///
  /// In uz, this message translates to:
  /// **'Kecha'**
  String get conversations_groupYesterday;

  /// No description provided for @conversations_groupThisWeek.
  ///
  /// In uz, this message translates to:
  /// **'Bu hafta'**
  String get conversations_groupThisWeek;

  /// No description provided for @conversations_groupOlder.
  ///
  /// In uz, this message translates to:
  /// **'Oldingi'**
  String get conversations_groupOlder;

  /// No description provided for @conversations_new.
  ///
  /// In uz, this message translates to:
  /// **'Yangi suhbat'**
  String get conversations_new;

  /// No description provided for @conversations_emptyTitle.
  ///
  /// In uz, this message translates to:
  /// **'Hali suhbat yo\'q'**
  String get conversations_emptyTitle;

  /// No description provided for @conversations_emptyMessage.
  ///
  /// In uz, this message translates to:
  /// **'Yangi suhbat boshlang'**
  String get conversations_emptyMessage;

  /// No description provided for @conversations_emptyFilteredTitle.
  ///
  /// In uz, this message translates to:
  /// **'Natija topilmadi'**
  String get conversations_emptyFilteredTitle;

  /// No description provided for @conversations_emptyFilteredMessage.
  ///
  /// In uz, this message translates to:
  /// **'Filtrlarni o\'zgartiring'**
  String get conversations_emptyFilteredMessage;

  /// No description provided for @conversations_archive.
  ///
  /// In uz, this message translates to:
  /// **'Arxivlash'**
  String get conversations_archive;

  /// No description provided for @conversations_archiveDialogTitle.
  ///
  /// In uz, this message translates to:
  /// **'Suhbatni arxivlaysizmi?'**
  String get conversations_archiveDialogTitle;

  /// No description provided for @conversations_archiveDialogMessage.
  ///
  /// In uz, this message translates to:
  /// **'Suhbat arxivga ko\'chiriladi'**
  String get conversations_archiveDialogMessage;

  /// No description provided for @chat_emptyTitle.
  ///
  /// In uz, this message translates to:
  /// **'Mijoz nima izlayapti?'**
  String get chat_emptyTitle;

  /// No description provided for @chat_start_livingRoom.
  ///
  /// In uz, this message translates to:
  /// **'Mehmonxona'**
  String get chat_start_livingRoom;

  /// No description provided for @chat_start_bedroom.
  ///
  /// In uz, this message translates to:
  /// **'Yotoqxona'**
  String get chat_start_bedroom;

  /// No description provided for @chat_start_couple.
  ///
  /// In uz, this message translates to:
  /// **'Kelin-kuyov xonasi'**
  String get chat_start_couple;

  /// No description provided for @chat_start_kitchen.
  ///
  /// In uz, this message translates to:
  /// **'Oshxona'**
  String get chat_start_kitchen;

  /// No description provided for @chat_start_kids.
  ///
  /// In uz, this message translates to:
  /// **'Bolalar xonasi'**
  String get chat_start_kids;

  /// No description provided for @chat_start_office.
  ///
  /// In uz, this message translates to:
  /// **'Ofis'**
  String get chat_start_office;

  /// No description provided for @chat_thinking.
  ///
  /// In uz, this message translates to:
  /// **'O\'ylayapti…'**
  String get chat_thinking;

  /// No description provided for @chat_tool_running.
  ///
  /// In uz, this message translates to:
  /// **'{tool}…'**
  String chat_tool_running(String tool);

  /// No description provided for @chat_tool_result.
  ///
  /// In uz, this message translates to:
  /// **'Natija'**
  String get chat_tool_result;

  /// No description provided for @chat_inputHint.
  ///
  /// In uz, this message translates to:
  /// **'Xabar…'**
  String get chat_inputHint;

  /// No description provided for @chat_newMessages.
  ///
  /// In uz, this message translates to:
  /// **'↓ Yangi xabar'**
  String get chat_newMessages;

  /// No description provided for @chat_menuNew.
  ///
  /// In uz, this message translates to:
  /// **'Yangi suhbat'**
  String get chat_menuNew;

  /// No description provided for @chat_menuReset.
  ///
  /// In uz, this message translates to:
  /// **'Suhbatni tozalash'**
  String get chat_menuReset;

  /// No description provided for @chat_menuCustomerMode.
  ///
  /// In uz, this message translates to:
  /// **'Mijoz rejimi'**
  String get chat_menuCustomerMode;

  /// No description provided for @chat_menuPdf.
  ///
  /// In uz, this message translates to:
  /// **'PDF taklif'**
  String get chat_menuPdf;

  /// No description provided for @chat_menuShare.
  ///
  /// In uz, this message translates to:
  /// **'Ulashish'**
  String get chat_menuShare;

  /// No description provided for @chat_resetConfirmTitle.
  ///
  /// In uz, this message translates to:
  /// **'Tozalaysizmi?'**
  String get chat_resetConfirmTitle;

  /// No description provided for @chat_resetConfirmMessage.
  ///
  /// In uz, this message translates to:
  /// **'Kontekst o\'chiriladi.'**
  String get chat_resetConfirmMessage;

  /// No description provided for @chat_continue.
  ///
  /// In uz, this message translates to:
  /// **'Davom ettirish'**
  String get chat_continue;

  /// No description provided for @chat_retry.
  ///
  /// In uz, this message translates to:
  /// **'Qayta yuborish'**
  String get chat_retry;

  /// No description provided for @tool_label_product_search.
  ///
  /// In uz, this message translates to:
  /// **'Mahsulot qidirilmoqda'**
  String get tool_label_product_search;

  /// No description provided for @tool_label_curtain_calculate.
  ///
  /// In uz, this message translates to:
  /// **'Hisoblanmoqda'**
  String get tool_label_curtain_calculate;

  /// No description provided for @tool_label_price_quote.
  ///
  /// In uz, this message translates to:
  /// **'Narx chiqarilmoqda'**
  String get tool_label_price_quote;

  /// No description provided for @tool_label_order_draft.
  ///
  /// In uz, this message translates to:
  /// **'Buyurtma shakllantirilmoqda'**
  String get tool_label_order_draft;

  /// No description provided for @tool_label_variants.
  ///
  /// In uz, this message translates to:
  /// **'Variantlar tayyorlanmoqda'**
  String get tool_label_variants;

  /// No description provided for @tool_label_unknown.
  ///
  /// In uz, this message translates to:
  /// **'Ma\'lumot olinmoqda'**
  String get tool_label_unknown;

  /// No description provided for @chat_quote_fabrics.
  ///
  /// In uz, this message translates to:
  /// **'MATOLAR'**
  String get chat_quote_fabrics;

  /// No description provided for @chat_quote_accessories.
  ///
  /// In uz, this message translates to:
  /// **'BEZAKLAR'**
  String get chat_quote_accessories;

  /// No description provided for @chat_quote_services.
  ///
  /// In uz, this message translates to:
  /// **'XIZMATLAR'**
  String get chat_quote_services;

  /// No description provided for @chat_quote_more.
  ///
  /// In uz, this message translates to:
  /// **'Yana {count} ta bo\'lak'**
  String chat_quote_more(int count);

  /// No description provided for @chat_quote_total.
  ///
  /// In uz, this message translates to:
  /// **'JAMI'**
  String get chat_quote_total;

  /// No description provided for @chat_quote_howCalculated.
  ///
  /// In uz, this message translates to:
  /// **'Qanday hisoblandi?'**
  String get chat_quote_howCalculated;

  /// No description provided for @chat_quote_close.
  ///
  /// In uz, this message translates to:
  /// **'Yopish'**
  String get chat_quote_close;

  /// No description provided for @chat_quote_show.
  ///
  /// In uz, this message translates to:
  /// **'Ko\'rish'**
  String get chat_quote_show;

  /// No description provided for @chat_quote_addPart.
  ///
  /// In uz, this message translates to:
  /// **'Bo\'lak qo\'shish'**
  String get chat_quote_addPart;

  /// No description provided for @chat_quote_showOptions.
  ///
  /// In uz, this message translates to:
  /// **'Variantlarni ko\'rish'**
  String get chat_quote_showOptions;

  /// No description provided for @chat_options_select.
  ///
  /// In uz, this message translates to:
  /// **'Tanlash'**
  String get chat_options_select;

  /// No description provided for @chat_draft_edit.
  ///
  /// In uz, this message translates to:
  /// **'Tahrirlash'**
  String get chat_draft_edit;

  /// No description provided for @chat_draft_createOrder.
  ///
  /// In uz, this message translates to:
  /// **'Buyurtma yaratish'**
  String get chat_draft_createOrder;

  /// No description provided for @chat_draft_title.
  ///
  /// In uz, this message translates to:
  /// **'QORALAMA'**
  String get chat_draft_title;

  /// No description provided for @orders.
  ///
  /// In uz, this message translates to:
  /// **'Buyurtmalar'**
  String get orders;

  /// No description provided for @errorLoadingStatuses.
  ///
  /// In uz, this message translates to:
  /// **'Statuslarni yuklashda xatolik'**
  String get errorLoadingStatuses;

  /// No description provided for @orderDetail.
  ///
  /// In uz, this message translates to:
  /// **'Buyurtma tafsiloti'**
  String get orderDetail;

  /// No description provided for @dateLabel.
  ///
  /// In uz, this message translates to:
  /// **'Sana: {value}'**
  String dateLabel(String value);

  /// No description provided for @sellerLabel.
  ///
  /// In uz, this message translates to:
  /// **'Sotuvchi: {name}'**
  String sellerLabel(String name);

  /// No description provided for @customer.
  ///
  /// In uz, this message translates to:
  /// **'Mijoz'**
  String get customer;

  /// No description provided for @rooms.
  ///
  /// In uz, this message translates to:
  /// **'Xonalar'**
  String get rooms;

  /// No description provided for @corniceAndHeight.
  ///
  /// In uz, this message translates to:
  /// **'Karniz: {cornice} m, Balandlik: {height} m'**
  String corniceAndHeight(String cornice, String height);

  /// No description provided for @finance.
  ///
  /// In uz, this message translates to:
  /// **'Moliya'**
  String get finance;

  /// No description provided for @orders_financeTotal.
  ///
  /// In uz, this message translates to:
  /// **'Jami'**
  String get orders_financeTotal;

  /// No description provided for @orders_financePrepayment.
  ///
  /// In uz, this message translates to:
  /// **'Avans'**
  String get orders_financePrepayment;

  /// No description provided for @orders_financeBalance.
  ///
  /// In uz, this message translates to:
  /// **'Qoldiq'**
  String get orders_financeBalance;

  /// No description provided for @nameAndPhoneRequired.
  ///
  /// In uz, this message translates to:
  /// **'Ism va telefon majburiy'**
  String get nameAndPhoneRequired;

  /// No description provided for @errorOccurred.
  ///
  /// In uz, this message translates to:
  /// **'Xatolik: {message}'**
  String errorOccurred(String message);

  /// No description provided for @newOrder.
  ///
  /// In uz, this message translates to:
  /// **'Yangi buyurtma'**
  String get newOrder;

  /// No description provided for @discount.
  ///
  /// In uz, this message translates to:
  /// **'Chegirma'**
  String get discount;

  /// No description provided for @amount.
  ///
  /// In uz, this message translates to:
  /// **'Summa'**
  String get amount;

  /// No description provided for @prepayment.
  ///
  /// In uz, this message translates to:
  /// **'Avans'**
  String get prepayment;

  /// No description provided for @note.
  ///
  /// In uz, this message translates to:
  /// **'Izoh'**
  String get note;

  /// No description provided for @errorLoadingTransitions.
  ///
  /// In uz, this message translates to:
  /// **'O\'tishlarni yuklashda xatolik'**
  String get errorLoadingTransitions;

  /// No description provided for @cancelled.
  ///
  /// In uz, this message translates to:
  /// **'Bekor qilingan'**
  String get cancelled;

  /// No description provided for @profile_languageTitle.
  ///
  /// In uz, this message translates to:
  /// **'Til'**
  String get profile_languageTitle;

  /// No description provided for @profile_languageOptionUz.
  ///
  /// In uz, this message translates to:
  /// **'O\'zbek'**
  String get profile_languageOptionUz;

  /// No description provided for @profile_languageOptionCyrl.
  ///
  /// In uz, this message translates to:
  /// **'Кирилл'**
  String get profile_languageOptionCyrl;

  /// No description provided for @profile_languageOptionRu.
  ///
  /// In uz, this message translates to:
  /// **'Русский'**
  String get profile_languageOptionRu;

  /// No description provided for @profile_themeTitle.
  ///
  /// In uz, this message translates to:
  /// **'Mavzu'**
  String get profile_themeTitle;

  /// No description provided for @profile_themeSystem.
  ///
  /// In uz, this message translates to:
  /// **'Tizim'**
  String get profile_themeSystem;

  /// No description provided for @profile_themeLight.
  ///
  /// In uz, this message translates to:
  /// **'Yorug\''**
  String get profile_themeLight;

  /// No description provided for @profile_themeDark.
  ///
  /// In uz, this message translates to:
  /// **'Qorong\'i'**
  String get profile_themeDark;

  /// No description provided for @profile_logout.
  ///
  /// In uz, this message translates to:
  /// **'Chiqish'**
  String get profile_logout;

  /// No description provided for @profile_logoutConfirmTitle.
  ///
  /// In uz, this message translates to:
  /// **'Chiqish?'**
  String get profile_logoutConfirmTitle;

  /// No description provided for @profile_logoutConfirmMessage.
  ///
  /// In uz, this message translates to:
  /// **'Hisobingizdan chiqmoqchimisiz?'**
  String get profile_logoutConfirmMessage;

  /// No description provided for @profile_roleEmployee.
  ///
  /// In uz, this message translates to:
  /// **'Xodim'**
  String get profile_roleEmployee;

  /// No description provided for @profile_roleManager.
  ///
  /// In uz, this message translates to:
  /// **'Menejer'**
  String get profile_roleManager;

  /// No description provided for @profile_roleAdmin.
  ///
  /// In uz, this message translates to:
  /// **'Admin'**
  String get profile_roleAdmin;

  /// No description provided for @profile_roleUnknown.
  ///
  /// In uz, this message translates to:
  /// **'Noma\'lum'**
  String get profile_roleUnknown;

  /// No description provided for @profile_todaySpend.
  ///
  /// In uz, this message translates to:
  /// **'Bugungi sarf'**
  String get profile_todaySpend;

  /// No description provided for @profile_limitDailyReset.
  ///
  /// In uz, this message translates to:
  /// **'Kunlik limit soat 24:00 da yangilanadi'**
  String get profile_limitDailyReset;

  /// No description provided for @profile_limitNotSet.
  ///
  /// In uz, this message translates to:
  /// **'Limit o\'rnatilmagan'**
  String get profile_limitNotSet;

  /// No description provided for @profile_unlimited.
  ///
  /// In uz, this message translates to:
  /// **'Cheksiz'**
  String get profile_unlimited;

  /// No description provided for @currency_som.
  ///
  /// In uz, this message translates to:
  /// **'so\'m'**
  String get currency_som;

  /// No description provided for @management_periodToday.
  ///
  /// In uz, this message translates to:
  /// **'Bugun'**
  String get management_periodToday;

  /// No description provided for @management_periodWeek.
  ///
  /// In uz, this message translates to:
  /// **'Hafta'**
  String get management_periodWeek;

  /// No description provided for @management_periodMonth.
  ///
  /// In uz, this message translates to:
  /// **'Oy'**
  String get management_periodMonth;

  /// No description provided for @management_chartTitle.
  ///
  /// In uz, this message translates to:
  /// **'Kunlik sarf'**
  String get management_chartTitle;

  /// No description provided for @management_chartEmpty.
  ///
  /// In uz, this message translates to:
  /// **'Grafik uchun ma\'lumot yo\'q'**
  String get management_chartEmpty;

  /// No description provided for @management_statThreads.
  ///
  /// In uz, this message translates to:
  /// **'Suhbatlar'**
  String get management_statThreads;

  /// No description provided for @management_statOrders.
  ///
  /// In uz, this message translates to:
  /// **'Buyurtmalar'**
  String get management_statOrders;

  /// No description provided for @management_statConversion.
  ///
  /// In uz, this message translates to:
  /// **'Konversiya'**
  String get management_statConversion;

  /// No description provided for @management_statCost.
  ///
  /// In uz, this message translates to:
  /// **'Sarf'**
  String get management_statCost;

  /// No description provided for @management_rankingTitle.
  ///
  /// In uz, this message translates to:
  /// **'Xodimlar reytingi'**
  String get management_rankingTitle;

  /// No description provided for @management_rankingEmployeeCol.
  ///
  /// In uz, this message translates to:
  /// **'Xodim'**
  String get management_rankingEmployeeCol;

  /// No description provided for @management_rankingChatsCol.
  ///
  /// In uz, this message translates to:
  /// **'Suhbat'**
  String get management_rankingChatsCol;

  /// No description provided for @management_rankingCostCol.
  ///
  /// In uz, this message translates to:
  /// **'Sarf'**
  String get management_rankingCostCol;

  /// No description provided for @management_rankingOrdersCol.
  ///
  /// In uz, this message translates to:
  /// **'Buyurtma'**
  String get management_rankingOrdersCol;

  /// No description provided for @management_sectionEmployees.
  ///
  /// In uz, this message translates to:
  /// **'Xodimlar'**
  String get management_sectionEmployees;

  /// No description provided for @management_sectionProducts.
  ///
  /// In uz, this message translates to:
  /// **'Mahsulotlar'**
  String get management_sectionProducts;

  /// No description provided for @management_sectionPricing.
  ///
  /// In uz, this message translates to:
  /// **'Narx qoidalari'**
  String get management_sectionPricing;

  /// No description provided for @management_sectionKnowledge.
  ///
  /// In uz, this message translates to:
  /// **'Bilimlar'**
  String get management_sectionKnowledge;

  /// No description provided for @management_sectionSettings.
  ///
  /// In uz, this message translates to:
  /// **'Sozlamalar'**
  String get management_sectionSettings;

  /// No description provided for @management_employeesTitle.
  ///
  /// In uz, this message translates to:
  /// **'Xodimlar'**
  String get management_employeesTitle;

  /// No description provided for @management_employeesSearchHint.
  ///
  /// In uz, this message translates to:
  /// **'Xodim qidirish'**
  String get management_employeesSearchHint;

  /// No description provided for @management_employeeAdd.
  ///
  /// In uz, this message translates to:
  /// **'Xodim qo\'shish'**
  String get management_employeeAdd;

  /// No description provided for @management_employeeLastActive.
  ///
  /// In uz, this message translates to:
  /// **'Oxirgi faollik: {date}'**
  String management_employeeLastActive(String date);

  /// No description provided for @management_employeeTodayMeta.
  ///
  /// In uz, this message translates to:
  /// **'Suhbatlar {chats} · Xabarlar {messages}'**
  String management_employeeTodayMeta(int chats, int messages);

  /// No description provided for @management_employeeBlocked.
  ///
  /// In uz, this message translates to:
  /// **'Bloklangan'**
  String get management_employeeBlocked;

  /// No description provided for @management_createTitle.
  ///
  /// In uz, this message translates to:
  /// **'Xodim qo\'shish'**
  String get management_createTitle;

  /// No description provided for @management_createPhone.
  ///
  /// In uz, this message translates to:
  /// **'Telefon raqami'**
  String get management_createPhone;

  /// No description provided for @management_createName.
  ///
  /// In uz, this message translates to:
  /// **'Ism va familiya'**
  String get management_createName;

  /// No description provided for @management_createPassword.
  ///
  /// In uz, this message translates to:
  /// **'Boshlang\'ich parol'**
  String get management_createPassword;

  /// No description provided for @management_createRole.
  ///
  /// In uz, this message translates to:
  /// **'Rol'**
  String get management_createRole;

  /// No description provided for @management_employeeProfileTitle.
  ///
  /// In uz, this message translates to:
  /// **'Xodim profili'**
  String get management_employeeProfileTitle;

  /// No description provided for @management_limitTitle.
  ///
  /// In uz, this message translates to:
  /// **'Kunlik limit'**
  String get management_limitTitle;

  /// No description provided for @management_limitCost.
  ///
  /// In uz, this message translates to:
  /// **'Sarf so\'m'**
  String get management_limitCost;

  /// No description provided for @management_limitMessages.
  ///
  /// In uz, this message translates to:
  /// **'Xabarlar soni'**
  String get management_limitMessages;

  /// No description provided for @management_limitTokens.
  ///
  /// In uz, this message translates to:
  /// **'Tokenlar'**
  String get management_limitTokens;

  /// No description provided for @management_onExceedWarn.
  ///
  /// In uz, this message translates to:
  /// **'Ogohlantirish'**
  String get management_onExceedWarn;

  /// No description provided for @management_onExceedBlock.
  ///
  /// In uz, this message translates to:
  /// **'Bloklash'**
  String get management_onExceedBlock;

  /// No description provided for @management_limitSet.
  ///
  /// In uz, this message translates to:
  /// **'Limitni saqlash'**
  String get management_limitSet;

  /// No description provided for @management_employeeViewThreads.
  ///
  /// In uz, this message translates to:
  /// **'Suhbatlarini ko\'rish'**
  String get management_employeeViewThreads;

  /// No description provided for @management_employeeConversationsTitle.
  ///
  /// In uz, this message translates to:
  /// **'Xodim suhbatlari'**
  String get management_employeeConversationsTitle;

  /// No description provided for @management_employeeBlockConfirmTitle.
  ///
  /// In uz, this message translates to:
  /// **'Xodimni bloklash?'**
  String get management_employeeBlockConfirmTitle;

  /// No description provided for @management_employeeBlockConfirmMessage.
  ///
  /// In uz, this message translates to:
  /// **'Bloklangan xodim tizimga kira olmaydi. Davom etasizmi?'**
  String get management_employeeBlockConfirmMessage;

  /// No description provided for @management_employeeUnblockConfirmTitle.
  ///
  /// In uz, this message translates to:
  /// **'Xodimni faollashtirish?'**
  String get management_employeeUnblockConfirmTitle;

  /// No description provided for @management_employeeUnblockConfirmMessage.
  ///
  /// In uz, this message translates to:
  /// **'Xodim tizimga qayta kira oladi. Davom etasizmi?'**
  String get management_employeeUnblockConfirmMessage;

  /// No description provided for @management_conversationsEmptyTitle.
  ///
  /// In uz, this message translates to:
  /// **'Suhbatlar yo\'q'**
  String get management_conversationsEmptyTitle;

  /// No description provided for @management_conversationsEmptyMessage.
  ///
  /// In uz, this message translates to:
  /// **'Bu xodimning hozircha suhbatlari yo\'q'**
  String get management_conversationsEmptyMessage;

  /// No description provided for @management_transcriptTitle.
  ///
  /// In uz, this message translates to:
  /// **'Transkript'**
  String get management_transcriptTitle;

  /// No description provided for @management_transcriptEmpty.
  ///
  /// In uz, this message translates to:
  /// **'Xabarlar yo\'q'**
  String get management_transcriptEmpty;

  /// No description provided for @management_transcriptUser.
  ///
  /// In uz, this message translates to:
  /// **'Foydalanuvchi'**
  String get management_transcriptUser;

  /// No description provided for @management_transcriptAssistant.
  ///
  /// In uz, this message translates to:
  /// **'AI'**
  String get management_transcriptAssistant;

  /// No description provided for @management_transcriptTool.
  ///
  /// In uz, this message translates to:
  /// **'Asbob'**
  String get management_transcriptTool;

  /// No description provided for @management_employeeBlock.
  ///
  /// In uz, this message translates to:
  /// **'Bloklash'**
  String get management_employeeBlock;

  /// No description provided for @management_employeeUnblock.
  ///
  /// In uz, this message translates to:
  /// **'Faollashtirish'**
  String get management_employeeUnblock;

  /// No description provided for @management_employeesEmptyMessage.
  ///
  /// In uz, this message translates to:
  /// **'Jamoada hozircha xodimlar yo\'q'**
  String get management_employeesEmptyMessage;

  /// No description provided for @management_employeesEmptyTitle.
  ///
  /// In uz, this message translates to:
  /// **'Xodimlar topilmadi'**
  String get management_employeesEmptyTitle;

  /// No description provided for @management_employeesSearchEmptyMessage.
  ///
  /// In uz, this message translates to:
  /// **'Boshqa so\'z bilan qidirib ko\'ring'**
  String get management_employeesSearchEmptyMessage;

  /// No description provided for @management_employeesSearchEmptyTitle.
  ///
  /// In uz, this message translates to:
  /// **'Natija topilmadi'**
  String get management_employeesSearchEmptyTitle;

  /// No description provided for @management_limitPeriodDay.
  ///
  /// In uz, this message translates to:
  /// **'Kunlik'**
  String get management_limitPeriodDay;

  /// No description provided for @management_limitPeriodMonth.
  ///
  /// In uz, this message translates to:
  /// **'Oylik'**
  String get management_limitPeriodMonth;

  /// No description provided for @management_limitUnlimited.
  ///
  /// In uz, this message translates to:
  /// **'Cheksiz'**
  String get management_limitUnlimited;

  /// No description provided for @management_statsEmpty.
  ///
  /// In uz, this message translates to:
  /// **'Ma\'lumotlar hozircha yo\'q'**
  String get management_statsEmpty;

  /// No description provided for @management_sectionTitle.
  ///
  /// In uz, this message translates to:
  /// **'Bo\'limlar'**
  String get management_sectionTitle;

  /// No description provided for @management_createPhoneError.
  ///
  /// In uz, this message translates to:
  /// **'Telefon raqamini to\'liq kiriting'**
  String get management_createPhoneError;

  /// No description provided for @management_productFormTitle.
  ///
  /// In uz, this message translates to:
  /// **'Mahsulot shakli'**
  String get management_productFormTitle;

  /// No description provided for @management_productName.
  ///
  /// In uz, this message translates to:
  /// **'Nomi'**
  String get management_productName;

  /// No description provided for @management_productsTitle.
  ///
  /// In uz, this message translates to:
  /// **'Mahsulotlarni boshqarish'**
  String get management_productsTitle;

  /// No description provided for @management_productsList.
  ///
  /// In uz, this message translates to:
  /// **'Ro\'yxat'**
  String get management_productsList;

  /// No description provided for @management_knowledgeTitle.
  ///
  /// In uz, this message translates to:
  /// **'Bilim qoidalari'**
  String get management_knowledgeTitle;

  /// No description provided for @management_knowledgeList.
  ///
  /// In uz, this message translates to:
  /// **'Bilim qoidalari ro\'yxati'**
  String get management_knowledgeList;

  /// No description provided for @management_pricingTitle.
  ///
  /// In uz, this message translates to:
  /// **'Narx qoidalari'**
  String get management_pricingTitle;

  /// No description provided for @management_pricingCoefficients.
  ///
  /// In uz, this message translates to:
  /// **'Koeffitsientlar inline tahrir'**
  String get management_pricingCoefficients;

  /// No description provided for @management_pricingTiers.
  ///
  /// In uz, this message translates to:
  /// **'Chegirma darajalari jadvali'**
  String get management_pricingTiers;

  /// No description provided for @management_pricingDefaults.
  ///
  /// In uz, this message translates to:
  /// **'Standart qiymatlar'**
  String get management_pricingDefaults;

  /// No description provided for @management_pricingTest.
  ///
  /// In uz, this message translates to:
  /// **'Hisobni sinash'**
  String get management_pricingTest;

  /// No description provided for @management_pricingCoefs.
  ///
  /// In uz, this message translates to:
  /// **'Koeffitsientlar'**
  String get management_pricingCoefs;

  /// No description provided for @management_pricingTiersTitle.
  ///
  /// In uz, this message translates to:
  /// **'Chegirma bosqichlari'**
  String get management_pricingTiersTitle;

  /// No description provided for @management_pricingDefaultsTitle.
  ///
  /// In uz, this message translates to:
  /// **'Standart qiymatlar'**
  String get management_pricingDefaultsTitle;

  /// No description provided for @management_pricingAddTier.
  ///
  /// In uz, this message translates to:
  /// **'Bosqich qo\'shish'**
  String get management_pricingAddTier;

  /// No description provided for @management_pricingTierMinAmount.
  ///
  /// In uz, this message translates to:
  /// **'Eng kam summa'**
  String get management_pricingTierMinAmount;

  /// No description provided for @management_pricingTierPercent.
  ///
  /// In uz, this message translates to:
  /// **'Chegirma %'**
  String get management_pricingTierPercent;

  /// No description provided for @management_pricingTierSave.
  ///
  /// In uz, this message translates to:
  /// **'Saqlash'**
  String get management_pricingTierSave;

  /// No description provided for @management_pricingMaxManager.
  ///
  /// In uz, this message translates to:
  /// **'Maks chegirma (Manager)'**
  String get management_pricingMaxManager;

  /// No description provided for @management_pricingMaxEmployee.
  ///
  /// In uz, this message translates to:
  /// **'Maks chegirma (Xodim)'**
  String get management_pricingMaxEmployee;

  /// No description provided for @management_pricingAdvancePercent.
  ///
  /// In uz, this message translates to:
  /// **'Avans %'**
  String get management_pricingAdvancePercent;

  /// No description provided for @management_pricingDeliveryPrice.
  ///
  /// In uz, this message translates to:
  /// **'Yetkazish narxi'**
  String get management_pricingDeliveryPrice;

  /// No description provided for @management_pricingCalcPreviewHeight.
  ///
  /// In uz, this message translates to:
  /// **'Balandligi (m)'**
  String get management_pricingCalcPreviewHeight;

  /// No description provided for @management_pricingCalcPreviewWidth.
  ///
  /// In uz, this message translates to:
  /// **'Uzunligi (m)'**
  String get management_pricingCalcPreviewWidth;

  /// No description provided for @management_pricingCalcPreviewPieces.
  ///
  /// In uz, this message translates to:
  /// **'Bo\'lak soni'**
  String get management_pricingCalcPreviewPieces;

  /// No description provided for @management_pricingCalcPreviewCalc.
  ///
  /// In uz, this message translates to:
  /// **'Hisoblash'**
  String get management_pricingCalcPreviewCalc;

  /// No description provided for @management_knowledgeAddRule.
  ///
  /// In uz, this message translates to:
  /// **'Qoida qo\'shish'**
  String get management_knowledgeAddRule;

  /// No description provided for @management_knowledgeRuleType.
  ///
  /// In uz, this message translates to:
  /// **'Turi'**
  String get management_knowledgeRuleType;

  /// No description provided for @management_knowledgeRuleConditions.
  ///
  /// In uz, this message translates to:
  /// **'Shartlar'**
  String get management_knowledgeRuleConditions;

  /// No description provided for @management_knowledgeRuleRecommendation.
  ///
  /// In uz, this message translates to:
  /// **'Tavsiya'**
  String get management_knowledgeRuleRecommendation;

  /// No description provided for @management_knowledgeRulePriority.
  ///
  /// In uz, this message translates to:
  /// **'Ustuvorlik'**
  String get management_knowledgeRulePriority;

  /// No description provided for @management_knowledgeRuleIsActive.
  ///
  /// In uz, this message translates to:
  /// **'Faol'**
  String get management_knowledgeRuleIsActive;

  /// No description provided for @management_knowledgeRuleSave.
  ///
  /// In uz, this message translates to:
  /// **'Saqlash'**
  String get management_knowledgeRuleSave;

  /// No description provided for @management_knowledgeRuleTestAI.
  ///
  /// In uz, this message translates to:
  /// **'AI\'da sinash'**
  String get management_knowledgeRuleTestAI;

  /// No description provided for @management_bulkPriceTitle.
  ///
  /// In uz, this message translates to:
  /// **'Narxni o\'zgartirish'**
  String get management_bulkPriceTitle;

  /// No description provided for @management_bulkPricePercent10.
  ///
  /// In uz, this message translates to:
  /// **'+10%'**
  String get management_bulkPricePercent10;

  /// No description provided for @management_bulkPricePercent5.
  ///
  /// In uz, this message translates to:
  /// **'-5%'**
  String get management_bulkPricePercent5;

  /// No description provided for @management_bulkPriceAmount.
  ///
  /// In uz, this message translates to:
  /// **'Yangi narx'**
  String get management_bulkPriceAmount;

  /// No description provided for @management_bulkPricePercentHint.
  ///
  /// In uz, this message translates to:
  /// **'Foiz'**
  String get management_bulkPricePercentHint;

  /// No description provided for @management_bulkPriceAmountHint.
  ///
  /// In uz, this message translates to:
  /// **'Summa'**
  String get management_bulkPriceAmountHint;

  /// No description provided for @management_bulkPricePreview.
  ///
  /// In uz, this message translates to:
  /// **'Oldindan ko\'rish:'**
  String get management_bulkPricePreview;

  /// No description provided for @management_pricingPolicyHint.
  ///
  /// In uz, this message translates to:
  /// **'Qo\'lda maksimal chegirma limitlari. AI taklifi bu limitdan oshmaydi.'**
  String get management_pricingPolicyHint;

  /// No description provided for @management_pricingStackWithTier.
  ///
  /// In uz, this message translates to:
  /// **'Tier chegirma bilan jamlash'**
  String get management_pricingStackWithTier;

  /// No description provided for @management_pricingDeadlineDays.
  ///
  /// In uz, this message translates to:
  /// **'Muddat (kun)'**
  String get management_pricingDeadlineDays;

  /// No description provided for @management_pricingCoefsEmpty.
  ///
  /// In uz, this message translates to:
  /// **'Koeffitsientlar topilmadi'**
  String get management_pricingCoefsEmpty;

  /// No description provided for @management_pricingTiersEmpty.
  ///
  /// In uz, this message translates to:
  /// **'Chegirma bosqichlari hozircha yo\'q'**
  String get management_pricingTiersEmpty;

  /// No description provided for @management_pricingSaveError.
  ///
  /// In uz, this message translates to:
  /// **'Saqlashda xatolik yuz berdi'**
  String get management_pricingSaveError;

  /// No description provided for @management_pricingPreviewError.
  ///
  /// In uz, this message translates to:
  /// **'Hisoblashda xatolik yuz berdi'**
  String get management_pricingPreviewError;

  /// No description provided for @management_knowledgeEditTitle.
  ///
  /// In uz, this message translates to:
  /// **'Qoidani tahrirlash'**
  String get management_knowledgeEditTitle;

  /// No description provided for @management_knowledgeEmptyTitle.
  ///
  /// In uz, this message translates to:
  /// **'Qoidalar yo\'q'**
  String get management_knowledgeEmptyTitle;

  /// No description provided for @management_knowledgeEmptyMessage.
  ///
  /// In uz, this message translates to:
  /// **'Hozircha bilim qoidalari qo\'shilmagan'**
  String get management_knowledgeEmptyMessage;

  /// No description provided for @management_knowledgeErrorTitle.
  ///
  /// In uz, this message translates to:
  /// **'Yuklab bo\'lmadi'**
  String get management_knowledgeErrorTitle;

  /// No description provided for @management_knowledgeConditionHint.
  ///
  /// In uz, this message translates to:
  /// **'Shart qo\'shish'**
  String get management_knowledgeConditionHint;

  /// No description provided for @management_knowledgeRemove.
  ///
  /// In uz, this message translates to:
  /// **'O\'chirish'**
  String get management_knowledgeRemove;

  /// No description provided for @management_knowledgeRemoveConfirmTitle.
  ///
  /// In uz, this message translates to:
  /// **'Qoidani o\'chirish?'**
  String get management_knowledgeRemoveConfirmTitle;

  /// No description provided for @management_knowledgeRemoveConfirmMessage.
  ///
  /// In uz, this message translates to:
  /// **'Qoida butunlay o\'chiriladi. Davom etasizmi?'**
  String get management_knowledgeRemoveConfirmMessage;

  /// No description provided for @management_knowledgeRuleRemoved.
  ///
  /// In uz, this message translates to:
  /// **'Qoida o\'chirildi'**
  String get management_knowledgeRuleRemoved;

  /// No description provided for @management_knowledgeRulePriorityHint.
  ///
  /// In uz, this message translates to:
  /// **'Ustuvorlik'**
  String get management_knowledgeRulePriorityHint;

  /// No description provided for @management_knowledgeRulePriorityLabel.
  ///
  /// In uz, this message translates to:
  /// **'Ustuvorlik: {value}'**
  String management_knowledgeRulePriorityLabel(int value);

  /// No description provided for @management_productsSearchHint.
  ///
  /// In uz, this message translates to:
  /// **'Mahsulot nomi, SKU qidirish'**
  String get management_productsSearchHint;

  /// No description provided for @management_productsAll.
  ///
  /// In uz, this message translates to:
  /// **'Barchasi'**
  String get management_productsAll;

  /// No description provided for @management_productsEmptyTitle.
  ///
  /// In uz, this message translates to:
  /// **'Mahsulotlar topilmadi'**
  String get management_productsEmptyTitle;

  /// No description provided for @management_productsEmptyMessage.
  ///
  /// In uz, this message translates to:
  /// **'Qidiruv yoki filtr shartini o\'zgartirib ko\'ring'**
  String get management_productsEmptyMessage;

  /// No description provided for @management_productsLoadError.
  ///
  /// In uz, this message translates to:
  /// **'Yuklab bo\'lmadi'**
  String get management_productsLoadError;

  /// No description provided for @management_bulkApplied.
  ///
  /// In uz, this message translates to:
  /// **'Narx yangilandi'**
  String get management_bulkApplied;

  /// No description provided for @management_productsSelected.
  ///
  /// In uz, this message translates to:
  /// **'{count} ta tanlandi'**
  String management_productsSelected(int count);

  /// No description provided for @management_productFormEditTitle.
  ///
  /// In uz, this message translates to:
  /// **'Mahsulotni tahrirlash'**
  String get management_productFormEditTitle;

  /// No description provided for @management_productFormBasic.
  ///
  /// In uz, this message translates to:
  /// **'Asosiy'**
  String get management_productFormBasic;

  /// No description provided for @management_productFormName.
  ///
  /// In uz, this message translates to:
  /// **'Nomi'**
  String get management_productFormName;

  /// No description provided for @management_productFormCode.
  ///
  /// In uz, this message translates to:
  /// **'Kodi'**
  String get management_productFormCode;

  /// No description provided for @management_productFormCategory.
  ///
  /// In uz, this message translates to:
  /// **'Kategoriya'**
  String get management_productFormCategory;

  /// No description provided for @management_productFormDescription.
  ///
  /// In uz, this message translates to:
  /// **'Tavsif'**
  String get management_productFormDescription;

  /// No description provided for @management_productFormFabricType.
  ///
  /// In uz, this message translates to:
  /// **'Mato turi'**
  String get management_productFormFabricType;

  /// No description provided for @management_productFormComposition.
  ///
  /// In uz, this message translates to:
  /// **'Tarkibi'**
  String get management_productFormComposition;

  /// No description provided for @management_productFormCare.
  ///
  /// In uz, this message translates to:
  /// **'Parvarish qilish'**
  String get management_productFormCare;

  /// No description provided for @management_productFormSegment.
  ///
  /// In uz, this message translates to:
  /// **'Segment'**
  String get management_productFormSegment;

  /// No description provided for @management_productFormRecommendedRooms.
  ///
  /// In uz, this message translates to:
  /// **'Tavsiya qilinadigan xonalar'**
  String get management_productFormRecommendedRooms;

  /// No description provided for @management_productFormBasePrice.
  ///
  /// In uz, this message translates to:
  /// **'Asosiy narx'**
  String get management_productFormBasePrice;

  /// No description provided for @management_productFormPrice.
  ///
  /// In uz, this message translates to:
  /// **'Narx'**
  String get management_productFormPrice;

  /// No description provided for @management_productFormCost.
  ///
  /// In uz, this message translates to:
  /// **'Tannarx'**
  String get management_productFormCost;

  /// No description provided for @management_productFormVariants.
  ///
  /// In uz, this message translates to:
  /// **'Variantlar'**
  String get management_productFormVariants;

  /// No description provided for @management_productFormAddVariant.
  ///
  /// In uz, this message translates to:
  /// **'Variant qo\'shish'**
  String get management_productFormAddVariant;

  /// No description provided for @management_productFormVariantsEmpty.
  ///
  /// In uz, this message translates to:
  /// **'Hali variant qo\'shilmagan'**
  String get management_productFormVariantsEmpty;

  /// No description provided for @management_productFormVariantLabel.
  ///
  /// In uz, this message translates to:
  /// **'Variant {index}'**
  String management_productFormVariantLabel(int index);

  /// No description provided for @management_productFormRemoveVariantTitle.
  ///
  /// In uz, this message translates to:
  /// **'Variant o\'chirilsinmi?'**
  String get management_productFormRemoveVariantTitle;

  /// No description provided for @management_productFormRemoveVariantMessage.
  ///
  /// In uz, this message translates to:
  /// **'Bu amalni qaytarib bo\'lmaydi'**
  String get management_productFormRemoveVariantMessage;

  /// No description provided for @management_productFormRemoveVariant.
  ///
  /// In uz, this message translates to:
  /// **'O\'chirish'**
  String get management_productFormRemoveVariant;

  /// No description provided for @management_productFormSku.
  ///
  /// In uz, this message translates to:
  /// **'SKU'**
  String get management_productFormSku;

  /// No description provided for @management_productFormColorName.
  ///
  /// In uz, this message translates to:
  /// **'Rang nomi'**
  String get management_productFormColorName;

  /// No description provided for @management_productFormColorHex.
  ///
  /// In uz, this message translates to:
  /// **'Rang (hex)'**
  String get management_productFormColorHex;

  /// No description provided for @management_productFormWidth.
  ///
  /// In uz, this message translates to:
  /// **'Eni (m)'**
  String get management_productFormWidth;

  /// No description provided for @management_productFormIsActive.
  ///
  /// In uz, this message translates to:
  /// **'Faol'**
  String get management_productFormIsActive;

  /// No description provided for @management_productFormSaved.
  ///
  /// In uz, this message translates to:
  /// **'Saqlandi'**
  String get management_productFormSaved;

  /// No description provided for @chat_listening.
  ///
  /// In uz, this message translates to:
  /// **'Eshityapman...'**
  String get chat_listening;

  /// No description provided for @chat_stopVoice.
  ///
  /// In uz, this message translates to:
  /// **'To\'xtatish'**
  String get chat_stopVoice;

  /// No description provided for @chat_transcriptLabel.
  ///
  /// In uz, this message translates to:
  /// **'TRANSKRIPT'**
  String get chat_transcriptLabel;

  /// No description provided for @chat_voiceMode.
  ///
  /// In uz, this message translates to:
  /// **'Ovozli rejim'**
  String get chat_voiceMode;

  /// No description provided for @chat_textMode.
  ///
  /// In uz, this message translates to:
  /// **'Matnli rejim'**
  String get chat_textMode;

  /// No description provided for @chat_customerModeTitle.
  ///
  /// In uz, this message translates to:
  /// **'Mijoz rejimi'**
  String get chat_customerModeTitle;

  /// No description provided for @chat_enterPinTitle.
  ///
  /// In uz, this message translates to:
  /// **'PIN kodni kiriting'**
  String get chat_enterPinTitle;

  /// No description provided for @chat_setPinTitle.
  ///
  /// In uz, this message translates to:
  /// **'Mijoz rejimi uchun PIN o\'rnating'**
  String get chat_setPinTitle;

  /// No description provided for @chat_confirmPinTitle.
  ///
  /// In uz, this message translates to:
  /// **'PIN kodni tasdiqlang'**
  String get chat_confirmPinTitle;

  /// No description provided for @chat_pinMismatch.
  ///
  /// In uz, this message translates to:
  /// **'PIN kodlar mos tushmadi'**
  String get chat_pinMismatch;

  /// No description provided for @chat_pinIncorrect.
  ///
  /// In uz, this message translates to:
  /// **'PIN kod noto\'g\'ri'**
  String get chat_pinIncorrect;

  /// No description provided for @chat_pinAttemptsWait.
  ///
  /// In uz, this message translates to:
  /// **'Juda ko\'p xato urinishlar. {seconds} soniya kuting.'**
  String chat_pinAttemptsWait(int seconds);

  /// No description provided for @chat_pdfRequireOrder.
  ///
  /// In uz, this message translates to:
  /// **'Avval buyurtma yarating'**
  String get chat_pdfRequireOrder;

  /// No description provided for @orders_pdf.
  ///
  /// In uz, this message translates to:
  /// **'PDF'**
  String get orders_pdf;

  /// No description provided for @orders_share.
  ///
  /// In uz, this message translates to:
  /// **'Ulashish'**
  String get orders_share;

  /// No description provided for @settings_systemPromptTitle.
  ///
  /// In uz, this message translates to:
  /// **'Tizim prompti'**
  String get settings_systemPromptTitle;

  /// No description provided for @settings_currentPrompt.
  ///
  /// In uz, this message translates to:
  /// **'JORIY PROMPT'**
  String get settings_currentPrompt;

  /// No description provided for @settings_promptHint.
  ///
  /// In uz, this message translates to:
  /// **'Prompt matni'**
  String get settings_promptHint;

  /// No description provided for @settings_saveNewVersion.
  ///
  /// In uz, this message translates to:
  /// **'Yangi versiya saqlash'**
  String get settings_saveNewVersion;

  /// No description provided for @settings_versionHistory.
  ///
  /// In uz, this message translates to:
  /// **'VERSIYALAR TARIXI'**
  String get settings_versionHistory;

  /// No description provided for @settings_version.
  ///
  /// In uz, this message translates to:
  /// **'v{version}'**
  String settings_version(int version);

  /// No description provided for @settings_rollback.
  ///
  /// In uz, this message translates to:
  /// **'Qaytarish'**
  String get settings_rollback;

  /// No description provided for @settings_rollbackConfirmTitle.
  ///
  /// In uz, this message translates to:
  /// **'Versiyaga qaytish?'**
  String get settings_rollbackConfirmTitle;

  /// No description provided for @settings_rollbackConfirmMessage.
  ///
  /// In uz, this message translates to:
  /// **'Haqiqatan ham ushbu versiyaga qaytasizmi?'**
  String get settings_rollbackConfirmMessage;

  /// No description provided for @settings_authorUnknown.
  ///
  /// In uz, this message translates to:
  /// **'Noma\'lum'**
  String get settings_authorUnknown;

  /// No description provided for @settings_modelPricingsTitle.
  ///
  /// In uz, this message translates to:
  /// **'Model narxlari'**
  String get settings_modelPricingsTitle;

  /// No description provided for @settings_modelProviderModel.
  ///
  /// In uz, this message translates to:
  /// **'{provider} — {model}'**
  String settings_modelProviderModel(String provider, String model);

  /// No description provided for @settings_modelInput.
  ///
  /// In uz, this message translates to:
  /// **'Kirish (1M): {price}'**
  String settings_modelInput(double price);

  /// No description provided for @settings_modelOutput.
  ///
  /// In uz, this message translates to:
  /// **'Chiqish (1M): {price}'**
  String settings_modelOutput(double price);

  /// No description provided for @settings_modelCached.
  ///
  /// In uz, this message translates to:
  /// **'Kesh (1M): {price}'**
  String settings_modelCached(double price);

  /// No description provided for @settings_modelStt.
  ///
  /// In uz, this message translates to:
  /// **'STT (daqiqa): {price}'**
  String settings_modelStt(double price);

  /// No description provided for @settings_modelTts.
  ///
  /// In uz, this message translates to:
  /// **'TTS (1k belgi): {price}'**
  String settings_modelTts(double price);

  /// No description provided for @settings_modelUsdToUzs.
  ///
  /// In uz, this message translates to:
  /// **'USD → UZS: {value}'**
  String settings_modelUsdToUzs(double value);

  /// No description provided for @settings_active.
  ///
  /// In uz, this message translates to:
  /// **'Faol'**
  String get settings_active;

  /// No description provided for @settings_inactive.
  ///
  /// In uz, this message translates to:
  /// **'Nofaol'**
  String get settings_inactive;

  /// No description provided for @settings_delete.
  ///
  /// In uz, this message translates to:
  /// **'O\'chirish'**
  String get settings_delete;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ru', 'uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'uz':
      {
        switch (locale.scriptCode) {
          case 'Cyrl':
            return AppLocalizationsUzCyrl();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ru':
      return AppLocalizationsRu();
    case 'uz':
      return AppLocalizationsUz();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
