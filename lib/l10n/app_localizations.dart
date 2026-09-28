import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_mr.dart';

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
    Locale('en'),
    Locale('hi'),
    Locale('mr')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Kabadiwala Connect'**
  String get appTitle;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @createLot.
  ///
  /// In en, this message translates to:
  /// **'Create Lot'**
  String get createLot;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @takePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take Photo'**
  String get takePhoto;

  /// No description provided for @takePhotoPrompt.
  ///
  /// In en, this message translates to:
  /// **'Take or Choose Material Photo'**
  String get takePhotoPrompt;

  /// No description provided for @retake.
  ///
  /// In en, this message translates to:
  /// **'Retake'**
  String get retake;

  /// No description provided for @retakePhoto.
  ///
  /// In en, this message translates to:
  /// **'Retake Photo'**
  String get retakePhoto;

  /// No description provided for @chooseGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from Gallery'**
  String get chooseGallery;

  /// No description provided for @continueToDetails.
  ///
  /// In en, this message translates to:
  /// **'Continue to Details'**
  String get continueToDetails;

  /// No description provided for @skipPhoto.
  ///
  /// In en, this message translates to:
  /// **'Skip Photo'**
  String get skipPhoto;

  /// No description provided for @material.
  ///
  /// In en, this message translates to:
  /// **'Material'**
  String get material;

  /// No description provided for @selectCategory.
  ///
  /// In en, this message translates to:
  /// **'Select Material Category'**
  String get selectCategory;

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weight;

  /// No description provided for @enterWeight.
  ///
  /// In en, this message translates to:
  /// **'Enter Weight (kg)'**
  String get enterWeight;

  /// No description provided for @condition.
  ///
  /// In en, this message translates to:
  /// **'Condition'**
  String get condition;

  /// No description provided for @selectCondition.
  ///
  /// In en, this message translates to:
  /// **'Select Condition'**
  String get selectCondition;

  /// No description provided for @conditionGood.
  ///
  /// In en, this message translates to:
  /// **'Working (Good)'**
  String get conditionGood;

  /// No description provided for @conditionAverage.
  ///
  /// In en, this message translates to:
  /// **'Used (Average)'**
  String get conditionAverage;

  /// No description provided for @conditionScrap.
  ///
  /// In en, this message translates to:
  /// **'Scrap (Broken)'**
  String get conditionScrap;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @saveLot.
  ///
  /// In en, this message translates to:
  /// **'Save Lot Locally'**
  String get saveLot;

  /// No description provided for @priceBoard.
  ///
  /// In en, this message translates to:
  /// **'Price Board'**
  String get priceBoard;

  /// No description provided for @indicativePrice.
  ///
  /// In en, this message translates to:
  /// **'Indicative Price'**
  String get indicativePrice;

  /// No description provided for @listen.
  ///
  /// In en, this message translates to:
  /// **'Listen'**
  String get listen;

  /// No description provided for @listening.
  ///
  /// In en, this message translates to:
  /// **'Playing Audio...'**
  String get listening;

  /// No description provided for @earnings.
  ///
  /// In en, this message translates to:
  /// **'Earnings'**
  String get earnings;

  /// No description provided for @earningsLedger.
  ///
  /// In en, this message translates to:
  /// **'Earnings Ledger'**
  String get earningsLedger;

  /// No description provided for @totalEarnings.
  ///
  /// In en, this message translates to:
  /// **'Total Earnings'**
  String get totalEarnings;

  /// No description provided for @currentMonthEarnings.
  ///
  /// In en, this message translates to:
  /// **'Current Month Earnings'**
  String get currentMonthEarnings;

  /// No description provided for @paid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get paid;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @paymentStatus.
  ///
  /// In en, this message translates to:
  /// **'Payment Status'**
  String get paymentStatus;

  /// No description provided for @offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offline;

  /// No description provided for @offlineModeActive.
  ///
  /// In en, this message translates to:
  /// **'Offline Mode Active • Saved in SQLite'**
  String get offlineModeActive;

  /// No description provided for @onlineConnected.
  ///
  /// In en, this message translates to:
  /// **'Online • Synced with Cloud'**
  String get onlineConnected;

  /// No description provided for @noInternet.
  ///
  /// In en, this message translates to:
  /// **'No Internet'**
  String get noInternet;

  /// No description provided for @waitingForInternet.
  ///
  /// In en, this message translates to:
  /// **'Waiting for internet'**
  String get waitingForInternet;

  /// No description provided for @synced.
  ///
  /// In en, this message translates to:
  /// **'Synced'**
  String get synced;

  /// No description provided for @syncing.
  ///
  /// In en, this message translates to:
  /// **'Syncing...'**
  String get syncing;

  /// No description provided for @failed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get failed;

  /// No description provided for @syncFailed.
  ///
  /// In en, this message translates to:
  /// **'Sync Failed'**
  String get syncFailed;

  /// No description provided for @pendingSync.
  ///
  /// In en, this message translates to:
  /// **'Pending Sync'**
  String get pendingSync;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @retrySync.
  ///
  /// In en, this message translates to:
  /// **'Retry Sync'**
  String get retrySync;

  /// No description provided for @syncNow.
  ///
  /// In en, this message translates to:
  /// **'Sync Now'**
  String get syncNow;

  /// No description provided for @lastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last updated'**
  String get lastUpdated;

  /// No description provided for @updatedToday.
  ///
  /// In en, this message translates to:
  /// **'Updated today'**
  String get updatedToday;

  /// No description provided for @noTransactions.
  ///
  /// In en, this message translates to:
  /// **'No transactions recorded yet.'**
  String get noTransactions;

  /// No description provided for @noLots.
  ///
  /// In en, this message translates to:
  /// **'No material lots recorded yet.\nTap \"Create Lot\" to start.'**
  String get noLots;

  /// No description provided for @recordedLots.
  ///
  /// In en, this message translates to:
  /// **'Recorded Lots'**
  String get recordedLots;

  /// No description provided for @source.
  ///
  /// In en, this message translates to:
  /// **'Source'**
  String get source;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @finalAmount.
  ///
  /// In en, this message translates to:
  /// **'Final Amount'**
  String get finalAmount;

  /// No description provided for @recycler.
  ///
  /// In en, this message translates to:
  /// **'Recycler'**
  String get recycler;

  /// No description provided for @refreshPrices.
  ///
  /// In en, this message translates to:
  /// **'Refresh Rates'**
  String get refreshPrices;

  /// No description provided for @refreshLedger.
  ///
  /// In en, this message translates to:
  /// **'Refresh Ledger'**
  String get refreshLedger;

  /// No description provided for @allTransactions.
  ///
  /// In en, this message translates to:
  /// **'All Transactions'**
  String get allTransactions;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @indicativeRates.
  ///
  /// In en, this message translates to:
  /// **'Indicative Market Rates'**
  String get indicativeRates;

  /// No description provided for @liveRates.
  ///
  /// In en, this message translates to:
  /// **'Live Market Rates'**
  String get liveRates;

  /// No description provided for @cachedOfflineRates.
  ///
  /// In en, this message translates to:
  /// **'Cached Offline Rates (SQLite)'**
  String get cachedOfflineRates;

  /// No description provided for @cachedOfflineLedger.
  ///
  /// In en, this message translates to:
  /// **'Cached Offline Ledger (SQLite)'**
  String get cachedOfflineLedger;

  /// No description provided for @liveLedger.
  ///
  /// In en, this message translates to:
  /// **'Live Transactions'**
  String get liveLedger;

  /// No description provided for @optionalNotes.
  ///
  /// In en, this message translates to:
  /// **'Optional Notes / Details'**
  String get optionalNotes;

  /// No description provided for @notesHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Copper wire bundle, 2 CRT monitors'**
  String get notesHint;

  /// No description provided for @analyzingAi.
  ///
  /// In en, this message translates to:
  /// **'Analyzing photo with AI...'**
  String get analyzingAi;

  /// No description provided for @suggestedAi.
  ///
  /// In en, this message translates to:
  /// **'Suggested by AI'**
  String get suggestedAi;

  /// No description provided for @validWeightError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid weight (> 0 kg)'**
  String get validWeightError;

  /// No description provided for @lotSavedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Material lot saved locally in SQLite!'**
  String get lotSavedSuccess;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @categoryPcb.
  ///
  /// In en, this message translates to:
  /// **'Motherboard / PCB'**
  String get categoryPcb;

  /// No description provided for @categoryCopper.
  ///
  /// In en, this message translates to:
  /// **'Copper Wire'**
  String get categoryCopper;

  /// No description provided for @categoryBattery.
  ///
  /// In en, this message translates to:
  /// **'Batteries'**
  String get categoryBattery;

  /// No description provided for @categoryDisplay.
  ///
  /// In en, this message translates to:
  /// **'Monitors & Displays'**
  String get categoryDisplay;

  /// No description provided for @categoryAppliances.
  ///
  /// In en, this message translates to:
  /// **'Heavy Electricals'**
  String get categoryAppliances;

  /// No description provided for @categoryMixed.
  ///
  /// In en, this message translates to:
  /// **'Mixed E-Waste'**
  String get categoryMixed;

  /// No description provided for @lotDetails.
  ///
  /// In en, this message translates to:
  /// **'Lot Details'**
  String get lotDetails;

  /// No description provided for @handoverToRecycler.
  ///
  /// In en, this message translates to:
  /// **'Handover to Recycler'**
  String get handoverToRecycler;

  /// No description provided for @selectRecycler.
  ///
  /// In en, this message translates to:
  /// **'Select Authorized Recycler'**
  String get selectRecycler;

  /// No description provided for @authorizedRecycler.
  ///
  /// In en, this message translates to:
  /// **'Authorized Recycler'**
  String get authorizedRecycler;

  /// No description provided for @confirmHandover.
  ///
  /// In en, this message translates to:
  /// **'Confirm Handover & Payment'**
  String get confirmHandover;

  /// No description provided for @handoverSuccess.
  ///
  /// In en, this message translates to:
  /// **'Material handed over successfully!'**
  String get handoverSuccess;

  /// No description provided for @viewInLedger.
  ///
  /// In en, this message translates to:
  /// **'View in Earnings Ledger'**
  String get viewInLedger;

  /// No description provided for @checkPriceBoard.
  ///
  /// In en, this message translates to:
  /// **'Check Market Price Board'**
  String get checkPriceBoard;

  /// No description provided for @estimatedValue.
  ///
  /// In en, this message translates to:
  /// **'Estimated Value'**
  String get estimatedValue;

  /// No description provided for @transactionStatus.
  ///
  /// In en, this message translates to:
  /// **'Transaction Status'**
  String get transactionStatus;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @handoverSummary.
  ///
  /// In en, this message translates to:
  /// **'Handover Summary'**
  String get handoverSummary;

  /// No description provided for @lotStatus.
  ///
  /// In en, this message translates to:
  /// **'Lot Status'**
  String get lotStatus;
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
      <String>['en', 'hi', 'mr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
    case 'mr':
      return AppLocalizationsMr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
