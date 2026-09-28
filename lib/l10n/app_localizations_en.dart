// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Kabadiwala Connect';

  @override
  String get home => 'Home';

  @override
  String get createLot => 'Create Lot';

  @override
  String get camera => 'Camera';

  @override
  String get takePhoto => 'Take Photo';

  @override
  String get takePhotoPrompt => 'Take or Choose Material Photo';

  @override
  String get retake => 'Retake';

  @override
  String get retakePhoto => 'Retake Photo';

  @override
  String get chooseGallery => 'Choose from Gallery';

  @override
  String get continueToDetails => 'Continue to Details';

  @override
  String get skipPhoto => 'Skip Photo';

  @override
  String get material => 'Material';

  @override
  String get selectCategory => 'Select Material Category';

  @override
  String get weight => 'Weight';

  @override
  String get enterWeight => 'Enter Weight (kg)';

  @override
  String get condition => 'Condition';

  @override
  String get selectCondition => 'Select Condition';

  @override
  String get conditionGood => 'Working (Good)';

  @override
  String get conditionAverage => 'Used (Average)';

  @override
  String get conditionScrap => 'Scrap (Broken)';

  @override
  String get save => 'Save';

  @override
  String get saveLot => 'Save Lot Locally';

  @override
  String get priceBoard => 'Price Board';

  @override
  String get indicativePrice => 'Indicative Price';

  @override
  String get listen => 'Listen';

  @override
  String get listening => 'Playing Audio...';

  @override
  String get earnings => 'Earnings';

  @override
  String get earningsLedger => 'Earnings Ledger';

  @override
  String get totalEarnings => 'Total Earnings';

  @override
  String get currentMonthEarnings => 'Current Month Earnings';

  @override
  String get paid => 'Paid';

  @override
  String get pending => 'Pending';

  @override
  String get paymentStatus => 'Payment Status';

  @override
  String get offline => 'Offline';

  @override
  String get offlineModeActive => 'Offline Mode Active • Saved in SQLite';

  @override
  String get onlineConnected => 'Online • Synced with Cloud';

  @override
  String get noInternet => 'No Internet';

  @override
  String get waitingForInternet => 'Waiting for internet';

  @override
  String get synced => 'Synced';

  @override
  String get syncing => 'Syncing...';

  @override
  String get failed => 'Failed';

  @override
  String get syncFailed => 'Sync Failed';

  @override
  String get pendingSync => 'Pending Sync';

  @override
  String get retry => 'Retry';

  @override
  String get retrySync => 'Retry Sync';

  @override
  String get syncNow => 'Sync Now';

  @override
  String get lastUpdated => 'Last updated';

  @override
  String get updatedToday => 'Updated today';

  @override
  String get noTransactions => 'No transactions recorded yet.';

  @override
  String get noLots =>
      'No material lots recorded yet.\nTap \"Create Lot\" to start.';

  @override
  String get recordedLots => 'Recorded Lots';

  @override
  String get source => 'Source';

  @override
  String get location => 'Location';

  @override
  String get finalAmount => 'Final Amount';

  @override
  String get recycler => 'Recycler';

  @override
  String get refreshPrices => 'Refresh Rates';

  @override
  String get refreshLedger => 'Refresh Ledger';

  @override
  String get allTransactions => 'All Transactions';

  @override
  String get all => 'All';

  @override
  String get indicativeRates => 'Indicative Market Rates';

  @override
  String get liveRates => 'Live Market Rates';

  @override
  String get cachedOfflineRates => 'Cached Offline Rates (SQLite)';

  @override
  String get cachedOfflineLedger => 'Cached Offline Ledger (SQLite)';

  @override
  String get liveLedger => 'Live Transactions';

  @override
  String get optionalNotes => 'Optional Notes / Details';

  @override
  String get notesHint => 'e.g. Copper wire bundle, 2 CRT monitors';

  @override
  String get analyzingAi => 'Analyzing photo with AI...';

  @override
  String get suggestedAi => 'Suggested by AI';

  @override
  String get validWeightError => 'Please enter a valid weight (> 0 kg)';

  @override
  String get lotSavedSuccess => 'Material lot saved locally in SQLite!';

  @override
  String get language => 'Language';

  @override
  String get categoryPcb => 'Motherboard / PCB';

  @override
  String get categoryCopper => 'Copper Wire';

  @override
  String get categoryBattery => 'Batteries';

  @override
  String get categoryDisplay => 'Monitors & Displays';

  @override
  String get categoryAppliances => 'Heavy Electricals';

  @override
  String get categoryMixed => 'Mixed E-Waste';

  @override
  String get lotDetails => 'Lot Details';

  @override
  String get handoverToRecycler => 'Handover to Recycler';

  @override
  String get selectRecycler => 'Select Authorized Recycler';

  @override
  String get authorizedRecycler => 'Authorized Recycler';

  @override
  String get confirmHandover => 'Confirm Handover & Payment';

  @override
  String get handoverSuccess => 'Material handed over successfully!';

  @override
  String get viewInLedger => 'View in Earnings Ledger';

  @override
  String get checkPriceBoard => 'Check Market Price Board';

  @override
  String get estimatedValue => 'Estimated Value';

  @override
  String get transactionStatus => 'Transaction Status';

  @override
  String get completed => 'Completed';

  @override
  String get handoverSummary => 'Handover Summary';

  @override
  String get lotStatus => 'Lot Status';
}
