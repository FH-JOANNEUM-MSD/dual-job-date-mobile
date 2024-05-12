
import 'package:dual_job_date_mobile/services/HttpHelper.dart';

class UserDataService{
static String email = "";
static String userID = "";
static String userName = "";

static String _urlGet = '/User/GetName';
static String _urlPost = '/User/ChangeName';

Future<String?> getUserName() async{ //TODO Error handling
  try{
    final response = await HTTPHelper.get(_urlGet); 
    if(response == null){
      return null;
    }
    int sc = response.statusCode; 
    switch(sc){
      case 200: 
        return response.body; 
      default:
        return null;
    }
  }catch(e){
    return null;
  }
}

Future<bool> postUserName(String newUserName) async{ //TODO Error handling
  String body = '';  //TODO: Find how body should look like
  try{
    final response = await HTTPHelper.post(_urlPost, body);
    if(response == null){
      return false;
    }
    if(response.statusCode != 200){
      return false;
    }
  }catch(e){
    return false; 
  }

  return true;
}
}