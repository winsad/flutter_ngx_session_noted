import 'dart:convert';

import 'package:flutter_mobile_application/models/news_model.dart';
import 'package:flutter_mobile_application/providers/account_provider.dart';
import 'package:flutter_mobile_application/providers/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static final AppPreferences _instance = AppPreferences._internal();
  factory AppPreferences() => _instance;
  AppPreferences._internal();

  SharedPreferences? _prefs;

  // init
  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<bool> isCompletedOnboarding() async {
    return _prefs?.getBool(_onboardingKey) ?? false;
  }

  Future<void> updateOnboarding(bool value) async {
    await _prefs?.setBool(_onboardingKey, value);
  }

  Future<AuthStatus> getAuthStatus() async {
    final response = _prefs?.getString(_authStatus);

    return AuthStatus.values.firstWhere(
      (element) => element.name == response,
      orElse: () => AuthStatus.nonLogin,
    );
  }

  Future<void> updateAuthStatus(AuthStatus value) async {
    await _prefs?.setString(_authStatus, value.name);
  }

  Future<void> setName(String value) async {
    await _prefs?.setString(_name, value);
  }

  Future<String?> getName() async {
    return _prefs?.getString(_name);
  }

  Future<void> setEmail(String value) async {
    await _prefs?.setString(_email, value);
  }

  Future<String?> getEmail() async {
    return _prefs?.getString(_email);
  }

  Future<void> setAvatar(Avatar value) async {
    await _prefs?.setString(_avatar, json.encode(value.toJson()));
  }

  Future<Avatar> getAvatar() async {
    final jsonStr = _prefs?.getString(_avatar);
    if (jsonStr == null) return AccountProvider.avatars.first;
    return Avatar.fromJson(json.decode(jsonStr));
  }

  Future<void> setLanguage(String value) async {
    await _prefs?.setString(_language, value);
  }

  Future<String?> getLanguage() async {
    return _prefs?.getString(_language);
  }

  Future<void> setNotificationEnabled(bool value) async {
    await _prefs?.setBool(_notificationsEnabled, value);
  }

  Future<bool?> getNotificationEnabled() async {
    return _prefs?.getBool(_notificationsEnabled);
  }

  Future<List<NewsModel>> getBookmarks() async {
    final jsonStr = _prefs?.getString(_bookmark);
    if (jsonStr == null) return [];
    final List<dynamic> jsonList = json.decode(jsonStr);
    return jsonList
        .map((e) => NewsModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> saveBookmarks(List<NewsModel> bookmarks) async {
    final jsonStr = json.encode(bookmarks.map((e) => e.toJson()).toList());
    await _prefs?.setString(_bookmark, jsonStr);
  }

  Future<void> clearUserInfo() async {
    await Future.wait([
      _prefs!.remove(_name),
      _prefs!.remove(_email),
      updateAuthStatus(AuthStatus.nonLogin),
      _prefs!.remove(_avatar),
      _prefs!.remove(_bookmark),
    ]);
  }

  // keys
  static const String _onboardingKey = "key_onboarding";
  static const String _name = "key_name";
  static const String _email = "key_email";
  static const String _authStatus = 'key_auth_status';
  static const String _bookmark = 'key_bookmark';
  static const String _avatar = 'key_avatar';
  static const String _language = 'key_language';
  static const String _notificationsEnabled = 'key_notifications_enabled';
}
