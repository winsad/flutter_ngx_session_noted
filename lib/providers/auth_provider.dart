import 'package:flutter/cupertino.dart';
import 'package:flutter_mobile_application/preferences/app_preferences.dart';
import 'package:flutter_mobile_application/preferences/secure_storage.dart';
import 'package:flutter_mobile_application/services/auth_service.dart';

enum AuthStatus { nonLogin, loggedin, guest }

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final AppSecureStorage _appSecureStorage = AppSecureStorage();
  final AppPreferences _appPreferences = AppPreferences();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isGuestLoading = false;
  bool get isGuestLoading => _isGuestLoading;

  AuthStatus _authStatus = AuthStatus.nonLogin;
  AuthStatus get authStatus => _authStatus;

  AuthProvider() {
    _init();
  }

  void _init() async {
    _isLoading = false;
    _isGuestLoading = false;
    _errorMessage = null;
    _authStatus = await _appPreferences.getAuthStatus();
    notifyListeners();
  }

  void reset() {
    _isLoading = false;
    _isGuestLoading = false;
    _errorMessage = null;
    notifyListeners();
  }

  Future<bool> onClickedLogin(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    await Future.delayed(Duration(seconds: 1));

    try {
      final response = await _authService.login(email, password);

      await _appSecureStorage.saveToken(response.token);
      await _appPreferences.setName(response.user?.name ?? '');
      await _appPreferences.setEmail(response.user?.name ?? '');
      await _appPreferences.updateAuthStatus(AuthStatus.loggedin);
      _authStatus = AuthStatus.loggedin;
      _authService.setToken(response.token);

      _isLoading = false;
      notifyListeners();

      return true;
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<bool> onClickedSignUp(
    String name,
    String email,
    String password,
  ) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    await Future.delayed(Duration(seconds: 1));
    try {
      final response = await _authService.signup(name, email, password);

      await _appSecureStorage.saveToken(response.token);
      await _appPreferences.setName(response.user?.name ?? '');
      await _appPreferences.setEmail(response.user?.name ?? '');
      await _appPreferences.updateAuthStatus(AuthStatus.loggedin);
      _authService.setToken(response.token);
      _authStatus = AuthStatus.loggedin;

      return true;
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<bool> onClickedGuest() async {
    _isGuestLoading = true;
    _errorMessage = null;
    notifyListeners();

    await Future.delayed(Duration(seconds: 1));

    try {
      final response = await _authService.guest();
      await _appSecureStorage.saveToken(response.token);
      await _appPreferences.updateAuthStatus(AuthStatus.guest);
      _authService.setToken(response.token);
      _authStatus = AuthStatus.guest;

      return true;
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isGuestLoading = false;
    notifyListeners();
    return false;
  }

  Future<bool> onClickedLogout() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    return false;
  }
}
