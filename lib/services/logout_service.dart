import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

class LogoutService {
  static Future<void> flushStorage() async {
    try {
      await const FlutterSecureStorage().deleteAll();
    } catch (e) {
      Logger().e('Failed to flush secure storage: $e');
    }
  }
}