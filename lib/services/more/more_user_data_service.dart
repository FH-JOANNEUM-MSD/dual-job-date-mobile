import 'dart:convert';

import 'package:dual_job_date_mobile/services/HttpHelper.dart';
import 'package:dual_job_date_mobile/services/more/more_user_data_response.dart';
import 'package:dual_job_date_mobile/tabs/more/more_event.dart';
import 'package:http/http.dart';

/// User Data Service handles the get and post requests for retrieving and
/// changing the users first and last name and email address
class UserDataService {

  static String _urlGet = 'User/GetName';
  static String _urlPost = 'User/ChangeName';

  ///Retrieves the current users firstname, lastname and email
  ///returns a UserDataResponse on success and null on failure
  Future<UserDataResponse?> getUserName() async {
    try {
      final response = await HTTPHelper.get(_urlGet);
      if (response == null) {
        //No response was created -> FAIL
        return null;
      }
      int sc = response.statusCode;
      switch (sc) {
        //check the HTTP status codes
        case 200: //OK
          return _handleSuccess(response);
        default:
          return null;
      }
    } catch (e) {
      //Exception handling
      return null;
    }
  }

  ///Constructs a UserDataResponse based on the http get response
  Future<UserDataResponse> _handleSuccess(Response response) async {
    Map<String, dynamic> responseMap = await jsonDecode(response.body.trim());
    responseMap['statusCode'] = response.statusCode;
    return UserDataResponse.fromJson(responseMap);
  }

  ///Change the user name, gets the new values from the ChangeEvent
  ///Returns true upon success, false upon failure
  Future<bool> postUserName(MoreChangeNameEvent event) async {
    String newUserFirstName = event.newUserFirstName;
    String newUserLastName = event.newUserLastName;
    Map<String, String> body = {
      'firstName': newUserFirstName,
      'lastName': newUserLastName,
    };
    try {
      final response = await HTTPHelper.post(_urlPost, body);
      if (response == null) {
        //No response was returned -> FAIL
        return false;
      }
      if (response.statusCode != 200) {
        //something went wrong on the Server Side -> FAIL
        return false;
      }
    } catch (e) {
      //An Exception was thrown -> FAIL
      return false;
    }

    return true; //Everything went as expected -> SUCCESS
  }
}
