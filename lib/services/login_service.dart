import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../rest/HttpHelper.dart';

class LoginService {
  static Future<bool> login(String email, String password) async {
    var body = {
      'email': email,
      'password': password,
    };

    final response = await HTTPHelper.post('User/Login', body);

    if (response != null) {
      Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      await FlutterSecureStorage()
          .write(key: 'token', value: decodedResponse['accessToken']);
      return true;
    }
    return false;
  }
}