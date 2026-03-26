import 'package:flutter/material.dart';
import 'package:flutter_mobile_application/app/app.dart';
import 'package:flutter_mobile_application/i18n/translations.g.dart';
import 'package:flutter_mobile_application/preferences/app_preferences.dart';
import 'package:flutter_mobile_application/providers/account_provider.dart';
import 'package:flutter_mobile_application/providers/auth_provider.dart';
import 'package:flutter_mobile_application/providers/bookmark_provider.dart';
import 'package:flutter_mobile_application/providers/dashboard_provider.dart';
import 'package:flutter_mobile_application/providers/home_provider.dart';
import 'package:flutter_mobile_application/providers/onboarding_provider.dart';
import 'package:flutter_mobile_application/providers/splash_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppPreferences().init();

  final language = await AppPreferences().getLanguage();
  LocaleSettings.useDeviceLocale();
  if (language != null) {
    LocaleSettings.setLocaleRaw(language);
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashProvider()),
        ChangeNotifierProvider(create: (context) => OnboardingProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => DashboardProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => BookmarkProvider()),
        ChangeNotifierProvider(create: (context) => AccountProvider()),
      ],
      child: TranslationProvider(child: const MyApp()),
    ),
  );
}
