import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../rest/HttpHelper.dart';
import 'package:http/src/response.dart';

class NewPasswordService {
  static Future<bool> setNewPassword(
      String oldPassword, String newPassword) async {
    var body = {
      'oldPassword': oldPassword,
      'newPassword': newPassword,
    };

    final response = await HTTPHelper.post('User/ChangePassword', body);

    await _deleteTokensOnError(response);

    return response!.statusCode == 200;
  }

  static Future<void> _deleteTokensOnError(Response? response) async {
    if (response!.statusCode != 200) {
      await FlutterSecureStorage().deleteAll();
    }
  }
}
