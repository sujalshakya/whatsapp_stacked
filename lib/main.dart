import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_stacked/app/app.bottomsheets.dart';
import 'package:whatsapp_stacked/app/app.dialogs.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';
import 'package:whatsapp_stacked/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked/base/theme_provider.dart';
import 'package:whatsapp_stacked/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool themeBool = prefs.getBool("isDark") ?? false;
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (context) => ThemeProvider(isDark: themeBool)),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeProvider.getTheme,
        initialRoute: Routes.startupView,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        navigatorObservers: [
          StackedService.routeObserver,
        ],
      );
    });
  }
}
