import 'dart:convert';
import 'package:dual_job_date_mobile/services/login/login_response.dart';
import 'package:dual_job_date_mobile/static_helpers/strings.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import '../../rest/HttpHelper.dart';

class LoginService {
  // Method to handle user login
  static Future<LoginResponse> login(String email, String password) async {
    var body = {
      'email': email,
      'password': password,
    };

    try {
      final response = await HTTPHelper.post('User/Login', body);

      if (response == null) {
        return _handleExceptionLogin(); // Handle null response
      } else if (response.statusCode == 200) {
        return _handleSuccessfulLogin(response); // Handle successful login
      } else {
        return _handleErrorLogin(response); // Handle error login
      }
    } catch (e) {
      return _handleExceptionLogin(); // Handle exceptions
    }
  }

  // Method to handle successful login response
  static LoginResponse _handleSuccessfulLogin(Response response) {
    Map<String, dynamic> decodedResponse = jsonDecode(response.body.trim());
    LoginResponse loginResponse =
        LoginResponse.fromJson(decodedResponse, response.statusCode);
    if (!loginResponse.isNew) {
      _storeTokens(loginResponse); // Store tokens securely
    }
    return loginResponse;
  }

  // Method to handle error login response
  static LoginResponse _handleErrorLogin(Response response) {
    return LoginResponse("null", "null", 0, "null", false, response.statusCode);
  }

  // Method to handle exceptions during login
  static LoginResponse _handleExceptionLogin() {
    return LoginResponse("null", "null", 0, "null", false, -1);
  }

  // Method to store tokens securely
  static Future<void> _storeTokens(LoginResponse response) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: AuthenticationTokens.bearer_key, value: response.accessToken);
    await storage.write(key: AuthenticationTokens.refresh_key, value: response.refreshToken);

    final DateTime now = DateTime.now();
    final int expiresIn = response.expiresIn;
    final DateTime expirationDate = now.add(Duration(seconds: expiresIn));
    await storage.write(
        key: AuthenticationTokens.expiration_key,
        value: expirationDate.toIso8601String());
  }

  // Method to check if the token is expired
  static Future<bool> isTokenExpired() async {
    const storage = FlutterSecureStorage();
    final String? expirationDateString =
        await storage.read(key: AuthenticationTokens.expiration_key);

    if (expirationDateString == null) return true;

    final DateTime expirationDate = DateTime.parse(expirationDateString);

    final bool isExpired = DateTime.now().isAfter(expirationDate);

    return isExpired;
  }

  // Method to check if user is already authenticated
  static Future<bool> isAuthenticated() async {
    const storage = FlutterSecureStorage();

    final String? bearer = await storage.read(key:AuthenticationTokens.bearer_key);
    final bool bearerExpired = await isTokenExpired();

    if (bearer != null && !bearerExpired) {
      return true; // User is authenticated
    } else {
      return await refreshToken(); // Refresh token if expired or not available
    }
  }

  // Method to refresh the token
  static Future<bool> refreshToken() async {
    final String? refreshToken = await const FlutterSecureStorage()
        .read(key: AuthenticationTokens.refresh_key);

    final Logger logger = Logger();

    try {
      var body = {
        'refreshToken': refreshToken,
      };
      final response = await HTTPHelper.post('User/Refresh', body);
      if (response != null && response.statusCode == 200) {
        Map<String, dynamic> decodedResponse = jsonDecode(response.body);
        var refreshResponse =
            LoginResponse.fromJson(decodedResponse, response.statusCode);
        _storeTokens(refreshResponse); // Store refreshed tokens
      }
      return response!.statusCode == 200;
    } catch (e) {
      logger.e('http POST failed: $e');
      return false;
    }
  }
}
