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
