import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'core/localization/app_localizations.dart';
import 'core/localization/locale_controller.dart';
import 'core/theme/app_theme.dart';
import 'screens/camera/camera_screen.dart';
import 'screens/earnings/earnings_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/lot/create_lot_screen.dart';
import 'screens/prices/prices_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/lot/lot_details_screen.dart';
import 'screens/recycler/recycler_handover_screen.dart';
import 'screens/recycler/recycler_matching_screen.dart';
import 'screens/safety/safety_screen.dart';
import 'screens/notifications/notifications_screen.dart';
import 'models/e_waste_lot.dart';

import 'repositories/lot_repository.dart';
import 'repositories/price_repository.dart';
import 'repositories/transaction_repository.dart';
import 'services/connectivity_service.dart';
import 'services/database_service.dart';
import 'services/sync_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  // Initialize persisted language preference from SQLite
  final localeController = LocaleController.instance;
  await localeController.initialize();

  // Startup Database Verification
  try {
    final db = await DatabaseService.instance.database;
    final tables = await db.rawQuery("SELECT name FROM sqlite_master WHERE type='table'");
    final tableNames = tables.map((t) => t['name'] as String).toList();
    debugPrint('=== [DB STARTUP CHECK] ===');
    debugPrint('DB Path: ${db.path}');
    debugPrint('DB Version: ${await db.getVersion()}');
    debugPrint('DB Tables: $tableNames');
    debugPrint('Notifications table exists: ${tableNames.contains("notifications")}');
    debugPrint('===========================');
  } catch (e) {
    debugPrint('=== [DB STARTUP ERROR] === $e');
  }

  runApp(KabadiwalaConnectApp(localeController: localeController));
}

class KabadiwalaConnectApp extends StatelessWidget {
  final LocaleController? localeController;
  final LotRepository? lotRepository;
  final TransactionRepository? transactionRepository;
  final PriceRepository? priceRepository;
  final SyncService? syncService;
  final ConnectivityService? connectivityService;

  const KabadiwalaConnectApp({
    super.key,
    this.localeController,
    this.lotRepository,
    this.transactionRepository,
    this.priceRepository,
    this.syncService,
    this.connectivityService,
  });

  @override
  Widget build(BuildContext context) {
    final controller = localeController ?? LocaleController.instance;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final currentLocale = controller.currentLocale;

        return MaterialApp(
          title: 'Kabadiwala Connect',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.themeData,
          locale: currentLocale,
          supportedLocales: const [
            Locale('en', ''),
            Locale('hi', ''),
            Locale('mr', ''),
          ],
          localizationsDelegates: const [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          initialRoute: '/',
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(
                  settings: settings,
                  builder: (context) => HomeScreen(
                    onLanguageChanged: controller.setLocale,
                    currentLocale: currentLocale,
                    lotRepository: lotRepository,
                    transactionRepository: transactionRepository,
                    syncService: syncService,
                    connectivityService: connectivityService,
                  ),
                );
              case '/splash':
                return MaterialPageRoute(
                  settings: settings,
                  builder: (context) => SplashScreen(
                    onInitializationComplete: () => Navigator.pushReplacementNamed(context, '/'),
                  ),
                );
              case '/camera':
                return MaterialPageRoute(
                  settings: settings,
                  builder: (context) => const CameraScreen(),
                );
              case '/create-lot':
                return MaterialPageRoute(
                  settings: settings,
                  builder: (context) => CreateLotScreen(
                    lotRepository: lotRepository,
                  ),
                );
              case '/lot-details':
                final lot = settings.arguments as EWasteLot;
                return MaterialPageRoute(
                  settings: settings,
                  builder: (context) => LotDetailsScreen(lot: lot),
                );
              case '/recycler-handover':
                final lot = settings.arguments as EWasteLot;
                return MaterialPageRoute(
                  settings: settings,
                  builder: (context) => RecyclerHandoverScreen(
                    lot: lot,
                    lotRepository: lotRepository,
                    transactionRepository: transactionRepository,
                  ),
                );
              case '/recyclers':
                final lot = settings.arguments as EWasteLot?;
                return MaterialPageRoute(
                  settings: settings,
                  builder: (context) => RecyclerMatchingScreen(lot: lot),
                );
              case '/safety':
                return MaterialPageRoute(
                  settings: settings,
                  builder: (context) => const SafetyScreen(),
                );
              case '/notifications':
                return MaterialPageRoute(
                  settings: settings,
                  builder: (context) => const NotificationsScreen(),
                );
              case '/prices':
                return MaterialPageRoute(
                  settings: settings,
                  builder: (context) => PricesScreen(
                    currentLocale: currentLocale,
                    priceRepository: priceRepository,
                    connectivityService: connectivityService,
                  ),
                );
              case '/earnings':
                return MaterialPageRoute(
                  settings: settings,
                  builder: (context) => EarningsScreen(repository: transactionRepository),
                );
              default:
                return MaterialPageRoute(
                  settings: settings,
                  builder: (context) => HomeScreen(
                    onLanguageChanged: controller.setLocale,
                    currentLocale: currentLocale,
                    lotRepository: lotRepository,
                    transactionRepository: transactionRepository,
                    syncService: syncService,
                    connectivityService: connectivityService,
                  ),
                );
            }
          },
        );
      },
    );
  }
}
