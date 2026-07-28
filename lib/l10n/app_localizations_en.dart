// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Jarir BookStore';

  @override
  String get welcome => 'Welcome';

  @override
  String get chooseCity => 'Choose City';

  @override
  String get chooseDelivery => 'Choose Delivery Method';

  @override
  String get pickupFromJariStore => 'Pickup from Store';

  @override
  String get deliveryToMyLocation => 'Delivery to Location';

  @override
  String get toBeSearched => 'What do you want to search ?';

  @override
  String get home => 'home';

  @override
  String get category => 'Category';

  @override
  String get stores => 'Stores';

  @override
  String get cart => 'Cart';

  @override
  String get account => 'Account';

  @override
  String get shoppingByCategory => 'Shop By Category';
}
