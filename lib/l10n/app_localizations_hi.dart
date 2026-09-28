// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'कबाड़ीवाला कनेक्ट';

  @override
  String get home => 'होम';

  @override
  String get createLot => 'नया माल जोड़ें';

  @override
  String get camera => 'कैमरा';

  @override
  String get takePhoto => 'फोटो खींचें';

  @override
  String get takePhotoPrompt => 'माल की फोटो खींचें या चुनें';

  @override
  String get retake => 'पुनः लें';

  @override
  String get retakePhoto => 'दूसरी फोटो लें';

  @override
  String get chooseGallery => 'गैलरी से चुनें';

  @override
  String get continueToDetails => 'आगे बढ़ें';

  @override
  String get skipPhoto => 'बिना फोटो आगे बढ़ें';

  @override
  String get material => 'सामग्री / माल';

  @override
  String get selectCategory => 'माल का प्रकार चुनें';

  @override
  String get weight => 'वजन';

  @override
  String get enterWeight => 'वजन दर्ज करें (किग्रा)';

  @override
  String get condition => 'हालत / स्थिति';

  @override
  String get selectCondition => 'माल की हालत चुनें';

  @override
  String get conditionGood => 'चालू (अच्छा)';

  @override
  String get conditionAverage => 'मध्यम (पुराना)';

  @override
  String get conditionScrap => 'कबाड़ (टूटा हुआ)';

  @override
  String get save => 'सुरक्षित करें';

  @override
  String get saveLot => 'माल सुरक्षित करें';

  @override
  String get priceBoard => 'भाव बोर्ड';

  @override
  String get indicativePrice => 'अनुमानित भाव';

  @override
  String get listen => 'सुनें';

  @override
  String get listening => 'आवाज़ बज रही है...';

  @override
  String get earnings => 'कमाई';

  @override
  String get earningsLedger => 'कमाई का खाता';

  @override
  String get totalEarnings => 'कुल कमाई';

  @override
  String get currentMonthEarnings => 'इस महीने की कमाई';

  @override
  String get paid => 'भुगतान प्राप्त';

  @override
  String get pending => 'बाकी';

  @override
  String get paymentStatus => 'भुगतान स्थिति';

  @override
  String get offline => 'ऑफ़लाइन';

  @override
  String get offlineModeActive =>
      'ऑफ़लाइन मोड सक्रिय • माल SQLite में सुरक्षित है';

  @override
  String get onlineConnected => 'ऑनलाइन • स्वतः क्लाउड सिंक चालू है';

  @override
  String get noInternet => 'इंटरनेट नहीं है';

  @override
  String get waitingForInternet => 'इंटरनेट की प्रतीक्षा है';

  @override
  String get synced => 'सिंक हो गया';

  @override
  String get syncing => 'सिंक हो रहा है...';

  @override
  String get failed => 'विफल';

  @override
  String get syncFailed => 'सिंक विफल';

  @override
  String get pendingSync => 'सिंक बाकी';

  @override
  String get retry => 'पुनः प्रयास करें';

  @override
  String get retrySync => 'पुनः प्रयास करें';

  @override
  String get syncNow => 'अभी सिंक करें';

  @override
  String get lastUpdated => 'अंतिम अपडेट';

  @override
  String get updatedToday => 'आज अपडेट किया गया';

  @override
  String get noTransactions => 'अभी कोई लेन-देन दर्ज नहीं हुआ है।';

  @override
  String get noLots =>
      'कोई माल दर्ज नहीं हुआ है।\n\"नया माल जोड़ें\" पर टैप करें।';

  @override
  String get recordedLots => 'दर्ज माल';

  @override
  String get source => 'स्रोत';

  @override
  String get location => 'स्थान';

  @override
  String get finalAmount => 'अंतिम राशि';

  @override
  String get recycler => 'रिसायकलर';

  @override
  String get refreshPrices => 'भाव ताज़ा करें';

  @override
  String get refreshLedger => 'खाता ताज़ा करें';

  @override
  String get allTransactions => 'सभी लेन-देन';

  @override
  String get all => 'सभी';

  @override
  String get indicativeRates => 'अनुमानित बाजार भाव';

  @override
  String get liveRates => 'ताज़ा बाजार भाव';

  @override
  String get cachedOfflineRates => 'ऑफ़लाइन सुरक्षित भाव (SQLite)';

  @override
  String get cachedOfflineLedger => 'ऑफ़लाइन सुरक्षित खाता (SQLite)';

  @override
  String get liveLedger => 'ताज़ा लेन-देन';

  @override
  String get optionalNotes => 'अतिरिक्त जानकारी (वैकल्पिक)';

  @override
  String get notesHint => 'जैसे: तांबे का तार बंडल, 2 मॉनिटर';

  @override
  String get analyzingAi => 'एआई से फोटो की जांच हो रही है...';

  @override
  String get suggestedAi => 'एआई द्वारा सुझाया गया';

  @override
  String get validWeightError => 'कृपया सही वजन दर्ज करें (> 0 किग्रा)';

  @override
  String get lotSavedSuccess => 'माल स्थानीय डेटाबेस में सुरक्षित हो गया!';

  @override
  String get language => 'भाषा';

  @override
  String get categoryPcb => 'मदरबोर्ड / पीसीबी (Motherboard)';

  @override
  String get categoryCopper => 'तांबे का तार (Copper Wire)';

  @override
  String get categoryBattery => 'बैटरी (Battery)';

  @override
  String get categoryDisplay => 'मॉनिटर और स्क्रीन (Display)';

  @override
  String get categoryAppliances => 'बिजली उपकरण (Appliances)';

  @override
  String get categoryMixed => 'मिश्रित ई-कचरा (Mixed E-Waste)';

  @override
  String get lotDetails => 'माल का विवरण';

  @override
  String get handoverToRecycler => 'रिसायकलर को सौंपें';

  @override
  String get selectRecycler => 'अधिकृत रिसायकलर चुनें';

  @override
  String get authorizedRecycler => 'अधिकृत रिसायकलर';

  @override
  String get confirmHandover => 'माल सौंपें और भुगतान दर्ज करें';

  @override
  String get handoverSuccess => 'माल सफलतापूर्वक सौंप दिया गया!';

  @override
  String get viewInLedger => 'कमाई खाते में देखें';

  @override
  String get checkPriceBoard => 'बाजार भाव बोर्ड देखें';

  @override
  String get estimatedValue => 'अनुमानित मूल्य';

  @override
  String get transactionStatus => 'लेन-देन स्थिति';

  @override
  String get completed => 'पूर्ण';

  @override
  String get handoverSummary => 'हस्तांतरण सारांश';

  @override
  String get lotStatus => 'माल की स्थिति';
}
