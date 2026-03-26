import 'package:flutter_mobile_application/models/api_reponse.dart';
import 'package:flutter_mobile_application/models/guest_login_model.dart';
import 'package:flutter_mobile_application/models/register_model.dart';
import 'package:flutter_mobile_application/services/base/api_service.dart';

class AuthService {
  final ApiService _apiService = ApiService();

  void setToken(String? token) => _apiService.setToken(token);

  // login
  Future<RegisterModel> login(String email, String password) async {
    final response = await _apiService.post(
      '/auth/login',
      body: {'email': email, 'password': password},
    );

    final model = ApiReponse<RegisterModel>.fromJson(
      response,
      (json) => RegisterModel.fromJson(json),
    );

    return model.data!;
  }

  // signup
  Future<RegisterModel> signup(
    String name,
    String email,
    String password,
  ) async {
    final response = await _apiService.post(
      '/auth/register',
      body: {'name': name, 'email': email, 'password': password},
    );

    final model = ApiReponse<RegisterModel>.fromJson(
      response,
      (json) => RegisterModel.fromJson(json),
    );

    return model.data!;
  }

  // guest login
  Future<GuestLoginModel> guest() async {
    final response = await _apiService.post('/auth/guest', body: {});

    final model = ApiReponse<GuestLoginModel>.fromJson(
      response,
      (json) => GuestLoginModel.fromJson(json),
    );

    return model.data!;
  }

  Future<dynamic> logout() async {
    await _apiService.post('/auth/logout', body: {});
    setToken(null);
  }
}
