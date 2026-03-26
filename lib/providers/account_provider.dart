import 'package:flutter/material.dart';
import 'package:flutter_mobile_application/i18n/translations.g.dart';
import 'package:flutter_mobile_application/preferences/app_preferences.dart';
import 'package:flutter_mobile_application/preferences/secure_storage.dart';
import 'package:flutter_mobile_application/providers/auth_provider.dart';
import 'package:flutter_mobile_application/services/auth_service.dart';

class Avatar {
  final String name;
  final String path;

  const Avatar(this.name, this.path);

  // from json
  factory Avatar.fromJson(Map<String, dynamic> json) {
    return Avatar(json['name'], json['path']);
  }

  // to json
  Map<String, dynamic> toJson() {
    return {'name': name, 'path': path};
  }
}

class AccountProvider extends ChangeNotifier {
  final AppPreferences _appPreferences = AppPreferences();
  final AppPreferences _prefs = AppPreferences();
  final AppSecureStorage _secureStorage = AppSecureStorage();
  final AuthService _authService = AuthService();

  AuthStatus? _authStatus;
  String? _name;
  String? _email;
  Avatar? _avatar;
  String _language = 'en';
  bool _notificationsEnabled = false;

  AuthStatus? get authStatus => _authStatus;
  bool get isGuest => _authStatus == AuthStatus.guest;
  String? get name => _name;
  String? get email => _email;
  Avatar? get avatar => _avatar;
  String get language => _language;
  bool get notificationsEnabled => _notificationsEnabled;

  static List<Avatar> avatars = [
    Avatar('Chicken', 'assets/images/account_icons/chicken.png'),
    Avatar('Dog', 'assets/images/account_icons/dog.png'),
    Avatar('Dragon', 'assets/images/account_icons/dragon.png'),
    Avatar('Goat', 'assets/images/account_icons/goat.png'),
    Avatar('Monkey', 'assets/images/account_icons/monkey.png'),
    Avatar('Mouse', 'assets/images/account_icons/mouse.png'),
    Avatar('Ox', 'assets/images/account_icons/ox.png'),
    Avatar('Rabbit', 'assets/images/account_icons/rabbit.png'),
    Avatar('Snake', 'assets/images/account_icons/snake.png'),
    Avatar('Tiger', 'assets/images/account_icons/tiger.png'),
  ];

  AccountProvider() {
    _loadAccount();
  }

  void _loadAccount() async {
    _avatar = await _appPreferences.getAvatar();
    _language = await _appPreferences.getLanguage() ?? _language;
    _notificationsEnabled =
        await _appPreferences.getNotificationEnabled() ?? false;
    notifyListeners();
  }

  void onClickedAvatar(Avatar avatar) async {
    if (isGuest) return;
    _avatar = avatar;
    await _appPreferences.setAvatar(_avatar!);
    notifyListeners();
  }

  Future<void> setLanguage(String locale) async {
    _language = locale;
    notifyListeners();
    await _prefs.setLanguage(locale);
    LocaleSettings.setLocaleRaw(locale);
  }

  Future<void> toggleNotifications() async {
    _notificationsEnabled = !_notificationsEnabled;
    notifyListeners();
    await _prefs.setNotificationEnabled(_notificationsEnabled);
  }

  void refreshUserInfo() async {
    _name = await _appPreferences.getName();
    _email = await _appPreferences.getEmail();
    _authStatus = await _appPreferences.getAuthStatus();
    notifyListeners();
  }

  Future<void> logout() async {
    _name = null;
    _email = null;
    _authStatus = AuthStatus.nonLogin;
    _avatar = null;

    // await _authService.logout();

    await _appPreferences.clearUserInfo();
    await _secureStorage.clearOnLogout();

    notifyListeners();
  }
}
