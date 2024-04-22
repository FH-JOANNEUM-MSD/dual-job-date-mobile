import 'package:dual_job_date_mobile/services/login/login_response.dart';
import 'package:dual_job_date_mobile/services/login/login_service.dart';
import 'package:dual_job_date_mobile/static_helpers/strings.dart';
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

    await _reloginToSaveTokens(response, newPassword);

    return response!.statusCode == 200;
  }

  static Future<void> _reloginToSaveTokens(Response? response, String newPassword) async {
       if (response!.statusCode == 200) {
      LoginResponse loginResponse = await LoginService.login(
          await FlutterSecureStorage().read(key: AuthenticationTokens.email_key)
              as String,
          newPassword);

      if(loginResponse.statusCode == 200){
        await FlutterSecureStorage().delete(key: AuthenticationTokens.email_key);
      }
    }
  }
}
