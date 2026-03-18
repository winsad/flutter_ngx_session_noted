import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  AppPreference._instance();
  static final instance = AppPreference._instance();
  factory AppPreference() => instance;

  SharedPreferences? _preferences;
  final _encryptedPreferences = EncryptedSharedPreferences();
  final _secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions.defaultOptions,
    iOptions: IOSOptions.defaultOptions,
  );

  // init
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // preference part
  Future<bool?> saveIsFirstOpen() async {
    return await _preferences?.setBool(_keyIsFirstOpen, false);
  }

  bool getIsFirstOpen() {
    return _preferences?.getBool(_keyIsFirstOpen) ?? true;
  }

  Future<bool?> saveTheme(bool value) async {
    return await _preferences?.setBool(_keyIsDarkTheme, value);
  }

  bool getTheme() {
    return _preferences?.getBool(_keyIsDarkTheme) ?? false;
  }

  Future<bool?> saveLanguage(String value) async {
    return await _preferences?.setString(_keyLanguage, value);
  }

  String? getLanguage() {
    return _preferences?.getString(_keyLanguage);
  }

  Future<bool?> saveListItem(List<String> value) async {
    return await _preferences?.setStringList(_keyListItem, value);
  }

  List<String> getListItem() {
    return _preferences?.getStringList(_keyListItem) ?? [];
  }

  // encrypted
  Future<void> saveUserName(String name) async {
    await _encryptedPreferences.setString(_keyUserName, name);
  }

  Future<String> getUserName() async {
    return await _encryptedPreferences.getString(_keyUserName);
  }

  // secure storage
  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: _keyToken, value: token);
  }

  Future<void> removeToken() async {
    await _secureStorage.delete(key: _keyToken);
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: _keyToken);
  }

  Future<void> clearAllSecureStorage() async {
    await _secureStorage.deleteAll();
  }

  // keys
  static const String _keyIsFirstOpen = 'key_isFirstOpen';
  static const String _keyIsDarkTheme = 'key_isDarkTheme';
  static const String _keyLanguage = 'key_language';
  static const String _keyUserName = 'key_userName';
  static const String _keyToken = 'key_token';
  static const String _keyListItem = 'key_listItem';
}
