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
