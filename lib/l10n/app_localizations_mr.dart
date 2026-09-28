// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'कबाडीवाला कनेक्ट';

  @override
  String get home => 'होम';

  @override
  String get createLot => 'नवीन माल नोंदवा';

  @override
  String get camera => 'कॅमेरा';

  @override
  String get takePhoto => 'फोटो काढा';

  @override
  String get takePhotoPrompt => 'मालाचा फोटो काढा किंवा निवडा';

  @override
  String get retake => 'पुन्हा घ्या';

  @override
  String get retakePhoto => 'दुसरा फोटो काढा';

  @override
  String get chooseGallery => 'गॅलरीतून निवडा';

  @override
  String get continueToDetails => 'पुढे जा';

  @override
  String get skipPhoto => 'फोटो न घेता पुढे जा';

  @override
  String get material => 'मालाचा प्रकार';

  @override
  String get selectCategory => 'मालाचा प्रकार निवडा';

  @override
  String get weight => 'वजन';

  @override
  String get enterWeight => 'वजन प्रविष्ट करा (किलो)';

  @override
  String get condition => 'स्थिती';

  @override
  String get selectCondition => 'मालाची स्थिती निवडा';

  @override
  String get conditionGood => 'चालू (चांगली)';

  @override
  String get conditionAverage => 'मध्यम (वापरलेले)';

  @override
  String get conditionScrap => 'स्क्रॅप (तुटलेले)';

  @override
  String get save => 'जतन करा';

  @override
  String get saveLot => 'माल जतन करा';

  @override
  String get priceBoard => 'दर फलक';

  @override
  String get indicativePrice => 'अंदाजे दर';

  @override
  String get listen => 'ऐका';

  @override
  String get listening => 'आवाज सुरू आहे...';

  @override
  String get earnings => 'कमाई';

  @override
  String get earningsLedger => 'कमाईचे खाते';

  @override
  String get totalEarnings => 'एकूण कमाई';

  @override
  String get currentMonthEarnings => 'या महिन्याची कमाई';

  @override
  String get paid => 'भरणा झाला';

  @override
  String get pending => 'प्रलंबित';

  @override
  String get paymentStatus => 'पेमेंट स्थिती';

  @override
  String get offline => 'ऑफलाइन';

  @override
  String get offlineModeActive =>
      'ऑफलाइन मोड सक्रिय • माल SQLite मध्ये जतन आहे';

  @override
  String get onlineConnected => 'ऑनलाइन • स्वयंचलित क्लाउड सिंक सुरू आहे';

  @override
  String get noInternet => 'इंटरनेट नाही';

  @override
  String get waitingForInternet => 'इंटरनेटची प्रतीक्षा आहे';

  @override
  String get synced => 'सिंक झाले';

  @override
  String get syncing => 'सिंक होत आहे...';

  @override
  String get failed => 'अयशस्वी';

  @override
  String get syncFailed => 'सिंक अयशस्वी';

  @override
  String get pendingSync => 'सिंक बाकी';

  @override
  String get retry => 'पुन्हा प्रयत्न करा';

  @override
  String get retrySync => 'पुन्हा प्रयत्न करा';

  @override
  String get syncNow => 'आता सिंक करा';

  @override
  String get lastUpdated => 'शेवटचे अपडेट';

  @override
  String get updatedToday => 'आज अपडेट केले';

  @override
  String get noTransactions => 'अद्याप कोणतेही व्यवहार नोंदवलेले नाहीत.';

  @override
  String get noLots =>
      'अद्याप कोणताही माल नोंदवलेला नाही.\n\"नवीन माल नोंदवा\" वर टॅप करा.';

  @override
  String get recordedLots => 'नोंदवलेला माल';

  @override
  String get source => 'स्रोत';

  @override
  String get location => 'ठिकाण';

  @override
  String get finalAmount => 'अंतिम रक्कम';

  @override
  String get recycler => 'रिसायकलर';

  @override
  String get refreshPrices => 'दर रिफ्रेश करा';

  @override
  String get refreshLedger => 'खाते रिफ्रेश करा';

  @override
  String get allTransactions => 'सर्व व्यवहार';

  @override
  String get all => 'सर्व';

  @override
  String get indicativeRates => 'अंदाजे बाजार दर';

  @override
  String get liveRates => 'ताजे बाजार दर';

  @override
  String get cachedOfflineRates => 'ऑफलाइन जतन केलेले दर (SQLite)';

  @override
  String get cachedOfflineLedger => 'ऑफलाइन जतन केलेले खाते (SQLite)';

  @override
  String get liveLedger => 'ताजे व्यवहार';

  @override
  String get optionalNotes => 'अधिक माहिती (पर्यायी)';

  @override
  String get notesHint => 'उदा. तांब्याची तार बंडल, 2 मॉनिटर';

  @override
  String get analyzingAi => 'एआय द्वारे फोटो तपासला जात आहे...';

  @override
  String get suggestedAi => 'एआय द्वारे सुचवलेले';

  @override
  String get validWeightError => 'कृपया योग्य वजन प्रविष्ट करा (> 0 किलो)';

  @override
  String get lotSavedSuccess => 'माल स्थानिक डेटाबेसमध्ये जतन झाला!';

  @override
  String get language => 'भाषा';

  @override
  String get categoryPcb => 'मदरबोर्ड / पीसीबी (Motherboard)';

  @override
  String get categoryCopper => 'तांब्याची तार (Copper Wire)';

  @override
  String get categoryBattery => 'बॅटरी (Battery)';

  @override
  String get categoryDisplay => 'मॉनिटर आणि स्क्रीन (Display)';

  @override
  String get categoryAppliances => 'विद्युत उपकरणे (Appliances)';

  @override
  String get categoryMixed => 'मिश्र ई-कचरा (Mixed E-Waste)';

  @override
  String get lotDetails => 'मालाचा तपशील';

  @override
  String get handoverToRecycler => 'रिसायकलरला माल द्या';

  @override
  String get selectRecycler => 'अधिकृत रिसायकलर निवडा';

  @override
  String get authorizedRecycler => 'अधिकृत रिसायकलर';

  @override
  String get confirmHandover => 'माल देणे व पेमेंट निश्चित करा';

  @override
  String get handoverSuccess => 'माल यशस्वीरित्या देण्यात आला!';

  @override
  String get viewInLedger => 'कमाईच्या खात्यात पहा';

  @override
  String get checkPriceBoard => 'बाजार दर फलक पहा';

  @override
  String get estimatedValue => 'अंदाजे मूल्य';

  @override
  String get transactionStatus => 'व्यवहार स्थिती';

  @override
  String get completed => 'पूर्ण';

  @override
  String get handoverSummary => 'हस्तांतरण सारांश';

  @override
  String get lotStatus => 'मालाची स्थिती';
}
