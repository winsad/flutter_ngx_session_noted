import 'package:flutter/material.dart' show WidgetBuilder, ModalRoute;
import 'package:flutter_mobile_application/models/news_model.dart';
import 'package:flutter_mobile_application/screens/dashboard_screen.dart';
import 'package:flutter_mobile_application/screens/login_screen.dart';
import 'package:flutter_mobile_application/screens/news_detail_screen.dart';
import 'package:flutter_mobile_application/screens/onboarding_screen.dart';
import 'package:flutter_mobile_application/screens/sign_up_screen.dart';
import 'package:flutter_mobile_application/screens/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signUp = '/sign-up';
  static const String dashboard = '/dashboard';
  static const String newsDetail = '/news-detail';

  // routes
  static Map<String, WidgetBuilder> get routes => {
    splash: (_) => SplashScreen(),
    login: (_) => LoginScreen(),
    onboarding: (_) => OnboardingScreen(),
    signUp: (_) => SignUpScreen(),
    dashboard: (_) => DashboardScreen(),
    newsDetail: (context) {
      final news = ModalRoute.of(context)!.settings.arguments as NewsModel;

      return NewsDetailScreen(news: news);
    },
  };
}
