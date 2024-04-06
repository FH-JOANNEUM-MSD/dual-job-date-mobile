
import 'package:dual_job_date_mobile/static_helpers/strings.dart';

///Class containing E-Mail Validator
class EmailValidator{

  /// Validate e-mail against a regex
  /// String mail: The user input of the E-Mail
   String? validate(String? mail){

    // Commonly used e-mail regex
    RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');


    //check first if any string was passed
    if(mail == null||mail.isEmpty){
      return StaticStrings.emailEmpty;
    }

    // check if the entered E-Mail address is valid against the regex
    if(!regex.hasMatch(mail)){
      return StaticStrings.emailInvalid;
    }

    //If all checks above worked, the e-mail is valid
    return null;
  }
}

///Class Containing Password Validator
class PasswordValidator{


  String? validateChange(String oldPW, String newPW, String newPasswordRepeat){



    if(newPW.isEmpty || oldPW.isEmpty || newPasswordRepeat.isEmpty){ //all password fields must have an input
      return StaticStrings.bothPasswordEmpty;
    }
    if(oldPW == newPW){ //new password must not be the same as the old one (rule 5)
      return StaticStrings.samePasswords;
    }

    if(newPW != newPasswordRepeat){
      return StaticStrings.passwordsNotMatching;
    }
    return validateNewPassword(newPW);
  }

   String? validatePassword(String? password){
    if(password == null||password.isEmpty){ //Check if a password was entered
      return StaticStrings.passwordEmpty;
    }

    if(password.length < 8){ // A password must be at least 8 characters long
      return StaticStrings.passwordWrong;
    }
    return null;
  }

  ///Validates Password against the following rules:
  /// 1.) Password must be at least 8 characters long
  /// 2.) Password must contain at least 1 upper case and 1 lowercase character
  /// 3.) Password must contain at least 1 special character
  /// 4.) Password must contain at least 1 number
  /// 5.) New Password must be different from old password
  String? validateNewPassword(String? newPW){
    //Regex checking rules 1-4
    RegExp regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&_])[A-Za-z\d@$!%*?&_]{8,}$');

    if(newPW==null||newPW.isEmpty){
      return StaticStrings.passwordEmpty;
    }
    if(!regex.hasMatch(newPW)){ // check against regex
      return StaticStrings.passwordInvalid;
    }
    return null;
  }


}