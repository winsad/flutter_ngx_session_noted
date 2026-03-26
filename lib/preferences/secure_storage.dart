import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppSecureStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  // get token
  Future<String?> getToken() async {
    return await _storage.read(key: _token);
  }

  // save token
  Future<void> saveToken(String token) async {
    await _storage.write(key: _token, value: token);
  }

  Future clearOnLogout() async {
    await _storage.deleteAll();
  }

  // key
  static const String _token = 'key_token';
}
