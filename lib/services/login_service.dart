import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import '../rest/HttpHelper.dart';

class LoginService {
  static Future<int> login(String email, String password) async {
    var body = {
      'email': email,
      'password': password,
    };

    final response = await HTTPHelper.post('User/Login', body);

    if (response != null) {
      if (response.statusCode == 200) {
        Map<String, dynamic> decodedResponse = jsonDecode(response.body);
        await _storeTokens(decodedResponse);
      }
      return response.statusCode;
    } else {
      return -1;
    }
  }

  static Future<void> _storeTokens(Map<String, dynamic> decodedResponse) async {
    const storage = FlutterSecureStorage();
    await storage.write(
        key: 'bearer-token', value: decodedResponse['accessToken']);
    await storage.write(
        key: 'refresh-token', value: decodedResponse['refreshToken']);

    final DateTime now = DateTime.now();
    final int expiresIn = decodedResponse['expiresIn'];
    final DateTime expirationDate = now.add(Duration(seconds: expiresIn));
    await storage.write(
        key: 'bearer-token-expiration',
        value: expirationDate.toIso8601String());
  }

  static Future<bool> isTokenExpired() async {
    const storage = FlutterSecureStorage();
    final String? expirationDateString =
        await storage.read(key: "bearer-token-expiration");

    if (expirationDateString == null) return true;

    final DateTime expirationDate = DateTime.parse(expirationDateString);

    final bool isExpired = DateTime.now().isAfter(expirationDate);

    return isExpired;
  }

  static Future<bool> isAuthenticated() async {
    const storage = FlutterSecureStorage();

    final String? bearer = await storage.read(key: "bearer-token");
    final bool bearerExpired = await isTokenExpired();

    if (bearer != null && !bearerExpired) {
      return true;
    } else {
      return await refreshToken();
    }
  }

  static Future<bool> refreshToken() async {
    final String? refreshToken =
        await const FlutterSecureStorage().read(key: "refresh-token");
    print(refreshToken);

    final Logger logger = Logger();

    try {
      var body = {
        'refreshToken': refreshToken,
      };
      final response = await HTTPHelper.post('User/Refresh', body);
      if(response != null && response.statusCode == 200){
        Map<String, dynamic> decodedResponse = jsonDecode(response.body);
        _storeTokens(decodedResponse);
      }
      return response!.statusCode == 200;
    } catch (e) {
      logger.e('http POST failed: $e');
      return false;
    }
  }
}
