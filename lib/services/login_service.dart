import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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

    final storage = FlutterSecureStorage();
    await storage.write(
        key: 'bearer-token', value: decodedResponse['accessToken']);
    await storage.write(
        key: 'refresh-token', value: decodedResponse['refreshToken']);
  }
}
