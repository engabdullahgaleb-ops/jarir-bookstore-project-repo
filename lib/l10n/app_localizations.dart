import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

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
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Jarir BookStore'**
  String get appName;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome To Jarir!'**
  String get welcome;

  /// No description provided for @chooseCity.
  ///
  /// In en, this message translates to:
  /// **'Choose City'**
  String get chooseCity;

  /// No description provided for @chooseDelivery.
  ///
  /// In en, this message translates to:
  /// **'Choose Delivery Method'**
  String get chooseDelivery;

  /// No description provided for @pickupFromJariStore.
  ///
  /// In en, this message translates to:
  /// **'Pickup from Store'**
  String get pickupFromJariStore;

  /// No description provided for @deliveryToMyLocation.
  ///
  /// In en, this message translates to:
  /// **'Delivery to Location'**
  String get deliveryToMyLocation;

  /// No description provided for @toBeSearched.
  ///
  /// In en, this message translates to:
  /// **'What do you want to search ?'**
  String get toBeSearched;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'home'**
  String get home;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @stores.
  ///
  /// In en, this message translates to:
  /// **'Stores'**
  String get stores;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @shoppingByCategory.
  ///
  /// In en, this message translates to:
  /// **'Shop By Category'**
  String get shoppingByCategory;

  /// No description provided for @cartPage.
  ///
  /// In en, this message translates to:
  /// **'Cart Page'**
  String get cartPage;

  /// No description provided for @storesPage.
  ///
  /// In en, this message translates to:
  /// **'Stores Page'**
  String get storesPage;

  /// No description provided for @signInDescription.
  ///
  /// In en, this message translates to:
  /// **'Sign in or register to access your account'**
  String get signInDescription;

  /// No description provided for @signInOrRegister.
  ///
  /// In en, this message translates to:
  /// **'Sign in / Register'**
  String get signInOrRegister;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @myOrders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get myOrders;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @mySpecialOrders.
  ///
  /// In en, this message translates to:
  /// **'My Special Orders'**
  String get mySpecialOrders;

  /// No description provided for @wishList.
  ///
  /// In en, this message translates to:
  /// **'WishList'**
  String get wishList;

  /// No description provided for @customCare.
  ///
  /// In en, this message translates to:
  /// **'Custom Care'**
  String get customCare;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @jarirServices.
  ///
  /// In en, this message translates to:
  /// **'Jarir Services'**
  String get jarirServices;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @chooseTheme.
  ///
  /// In en, this message translates to:
  /// **'Please Choose Theme Mode'**
  String get chooseTheme;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @chooseLang.
  ///
  /// In en, this message translates to:
  /// **'Please Choose Preferred Language '**
  String get chooseLang;

  /// No description provided for @arLang.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arLang;

  /// No description provided for @enLang.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get enLang;

  /// No description provided for @shoppingByBrand.
  ///
  /// In en, this message translates to:
  /// **'Shop By Brand'**
  String get shoppingByBrand;

  /// No description provided for @loginDescription.
  ///
  /// In en, this message translates to:
  /// **'Log in using your email or mobile number'**
  String get loginDescription;

  /// No description provided for @loginWithOTP.
  ///
  /// In en, this message translates to:
  /// **'Login with OTP'**
  String get loginWithOTP;

  /// No description provided for @loginWithPassword.
  ///
  /// In en, this message translates to:
  /// **'Login with Password'**
  String get loginWithPassword;

  /// No description provided for @phoneOrEmail.
  ///
  /// In en, this message translates to:
  /// **'Phone number or email address'**
  String get phoneOrEmail;

  /// No description provided for @phoneOrEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Phone Number or Email Address'**
  String get phoneOrEmailHint;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgetPassword;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @enableFaceID.
  ///
  /// In en, this message translates to:
  /// **'Enable Face ID'**
  String get enableFaceID;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @agreeTerms.
  ///
  /// In en, this message translates to:
  /// **'By logging in, you agree to the '**
  String get agreeTerms;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @sendOTP.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get sendOTP;
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
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
