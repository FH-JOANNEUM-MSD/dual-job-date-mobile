import '../rest/HttpHelper.dart';

class NewPasswordService {
  static Future<bool> setNewPassword(String oldPassword, String newPassword) async {
    var body = {
      'oldPassword': oldPassword,
      'newPassword': newPassword,
    };

    final response = await HTTPHelper.post('User/ChangePassword', body);
    return response != null;
  }
}