import 'dart:convert';
import 'package:dual_job_date_mobile/static_helpers/strings.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class HTTPHelper {
  // static const String baseUrl = 'http://localhost:8000/';
  //static const String baseUrl = 'http://10.0.2.2:8000/'; // 10.0.2.2 is the IP of the host machine a.k.a. localhost
  static const String baseUrl =
      'https://dual-dating-backend.msd-moss-test.fh-joanneum.at/'; // live DB
  static const storage = FlutterSecureStorage();
  static final Logger logger = Logger();

  static Future<http.Response?> get(String url) async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl + url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${await storage.read(key: AuthenticationTokens.bearer_key)}',
        },
      ).timeout(const Duration(seconds: 2));

      return response;
    } catch (e) {
      logger.e('http GET failed: $e');
      return null;
    }
  }

  static Future<http.Response?> post(String url, dynamic body) async {
    try {
      final response = await http
          .post(Uri.parse(baseUrl + url),
              headers: {
                'Content-Type': 'application/json',
                'Authorization':
                    'Bearer ${await storage.read(key: AuthenticationTokens.bearer_key)}',
              },
              body: jsonEncode(body))
          .timeout(const Duration(seconds: 2));

      return response;
    } catch (e) {
      logger.e('http POST failed: $e');
      return null;
    }
  }
}
