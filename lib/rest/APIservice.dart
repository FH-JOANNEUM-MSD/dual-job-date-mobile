import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class APIService {
  static const String baseUrl = 'http://10.0.2.2:8000';
  static final storage = FlutterSecureStorage();

  static Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/User/Login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      await storage.write(key: 'token', value: decodedResponse['accessToken']);
      return true;
    } else {
      return false;
    }
  }
  static Future<bool> setNewPassword(String oldPassword, String newPassword) async {
    // Read the token from secure storage
    String? token = await storage.read(key: 'token');

    if (token == null) {
      print('Not Authorized!');
      return false;
    }
    log(token);
    log(oldPassword);
    log(newPassword);

    final response = await http.post(
      Uri.parse('$baseUrl/User/ChangePassword'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'oldPassword': oldPassword,
        'newPassword': newPassword,
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
