import 'package:flutter/material.dart';
import 'package:flutter_mobile_application/app/app_routes.dart';
import 'package:flutter_mobile_application/preferences/app_preferences.dart';
import 'package:flutter_mobile_application/preferences/secure_storage.dart';
import 'package:flutter_mobile_application/providers/auth_provider.dart';
import 'package:flutter_mobile_application/services/auth_service.dart';

class SplashProvider extends ChangeNotifier {
  final AppPreferences _appPreferences = AppPreferences();
  final AppSecureStorage _appSecureStorage = AppSecureStorage();
  final AuthService _authService = AuthService();

  AuthStatus? _authStatus;
  AuthStatus? get authStatus => _authStatus;

  Future<String> onCheckNavigation() async {
    await Future.delayed(Duration(seconds: 2));
    final bool isCompletedOnboarding = await _appPreferences
        .isCompletedOnboarding();

    if (!isCompletedOnboarding) {
      return AppRoutes.onboarding;
    }

    final token = await _appSecureStorage.getToken();
    _authStatus = await _appPreferences.getAuthStatus();

    notifyListeners();

    if (token != null && _authStatus != AuthStatus.nonLogin) {
      _authService.setToken(token);
      return AppRoutes.dashboard;
    } else {
      return AppRoutes.login;
    }
  }
}
