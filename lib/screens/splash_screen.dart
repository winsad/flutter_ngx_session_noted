// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobile_application/app/app_colors.dart';
import 'package:flutter_mobile_application/i18n/translations.g.dart';
import 'package:flutter_mobile_application/providers/account_provider.dart';
import 'package:flutter_mobile_application/providers/auth_provider.dart';
import 'package:flutter_mobile_application/providers/splash_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _onNext();
  }

  void _onNext() async {
    final splash = context.read<SplashProvider>();
    final routeName = await splash.onCheckNavigation();

    // update user infos
    if (splash.authStatus != null && splash.authStatus != AuthStatus.nonLogin) {
      context.read<AccountProvider>().refreshUserInfo();
    }

    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          spacing: 20,
          children: [
            // app icons
            SizedBox(
              height: 100,
              width: 100,
              child: ClipOval(child: Image.asset('assets/images/app_icon.jpg')),
            ).animate().fadeIn(duration: 350.ms),

            // loading
            CircularProgressIndicator(
              strokeWidth: 2.7,
              color: Colors.white70,
            ).animate().fadeIn(duration: 350.ms, delay: 200.ms),

            // title
            Text(
              t.welcomeText,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white70,
              ),
            ).animate().fadeIn(duration: 350.ms, delay: 400.ms),
          ],
        ),
      ),
    );
  }
}
