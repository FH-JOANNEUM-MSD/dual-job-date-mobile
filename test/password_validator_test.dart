import 'package:dual_job_date_mobile/static_helpers/strings.dart';
import 'package:dual_job_date_mobile/static_helpers/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  ///Test that expect null as a result from the validator
  group("Good Case Tests", () {

    //Valid input the set a new password
    test("Change Password", (){
      String oldPW = "Test_1234";
      String newPW  = "NewPass@FHJ2024";

      String? result = PasswordValidator().validateChange(oldPW, newPW, newPW);

      print("old: $oldPW new: $newPW: $result");
      expect(result, null);
    });

    //valid input to log in
    test("Enter Password (Login)", (){
      String password = "Test_1234";

      String? result = PasswordValidator().validatePassword(password);

      print("$password: $result");
      expect(result, null);
    });

    //checking a set of example passwords to make sure validator is working
    test("Testing a few valid passwords", (){
      List<String> passwords = [
        'Test_1234',
        'MyPassword1!',
        'Super*Safe_1234',
        r'Q$onkM3kC3$SFX',
        'Student!1'
      ];

      for(String password in passwords){
        String? result = PasswordValidator().validateNewPassword(password);
        print("$password: $result");

        expect(result, null);
      }
    });

  });

  ///Test that expect some error message from the validator
  group("Bad Case Tests", () {

    //old password was not entered to set_new_password
    test("Change Password: Missing old pw", (){
      String oldPW = "";
      String newPW  = "NewPass@FHJ2024";

      String? result = PasswordValidator().validateChange(oldPW, newPW, newPW);

      print("old: missing new: $newPW: $result");
      expect(result, StaticStrings.bothPasswordEmpty);
    });


    //new password was not entered to set_new_password
    test("Change Password: Missing new pw", (){
      String oldPW = "Test_1234";
      String newPW  = "";

      String? result = PasswordValidator().validateChange(oldPW, newPW, newPW);

      print("old: $oldPW new: missing: $result");
      expect(result, StaticStrings.bothPasswordEmpty);
    });

    //repeat new password was not entered to set_new_password
    test("Change Password: Missing new pw repeat", (){
      String oldPW = "Test_1234";
      String newPW  = "NewPass@FHJ2024";

      String? result = PasswordValidator().validateChange(oldPW, newPW, "");

      print("old: $oldPW new: missing: $result");
      expect(result, StaticStrings.bothPasswordEmpty);
    });

    //new password and repeat new password are not matching
    test("Change Password: new passwords not matching", (){
      String oldPW = "Test_1234";
      String newPW  = "NewPW@123";
      String newPWrepeat  = "New@123";

      String? result = PasswordValidator().validateChange(oldPW, newPW,newPWrepeat);

      print("old: $oldPW new: $newPW: $result");
      expect(result, StaticStrings.passwordsNotMatching);
    });

    // try to re-use the old password
    test("Change Password: new password same as old one", (){
      String oldPW = "Test_1234";
      String newPW  = oldPW;

      String? result = PasswordValidator().validateChange(oldPW, newPW, newPW);

      print("old: $oldPW new: $newPW: $result");
      expect(result, StaticStrings.samePasswords);
    });

    //Password Complexity: no special character
    test("Change Password: new password no special char", (){
      String oldPW = "Test_1234";
      String newPW  = "NewPass123";

      String? result = PasswordValidator().validateChange(oldPW, newPW, newPW);

      print("old: $oldPW new: $newPW: $result");
      expect(result, StaticStrings.passwordInvalid);
    });


    //Password Complexity: no number
    test("Change Password: new password no number", (){
      String oldPW = "Test_1234";
      String newPW  = "NewPass!!!!";

      String? result = PasswordValidator().validateChange(oldPW, newPW, newPW);

      print("old: $oldPW new: $newPW: $result");
      expect(result, StaticStrings.passwordInvalid);
    });


    //Password Complexity: no upper case letter
    test("Change Password: new password no upper case letter", (){
      String oldPW = "Test_1234";
      String newPW  = "newpass!123";

      String? result = PasswordValidator().validateChange(oldPW, newPW, newPW);

      print("old: $oldPW new: $newPW: $result");
      expect(result, StaticStrings.passwordInvalid);
    });


    //Password Complexity: no lower case letter
    test("Change Password: new password no lower case letter", (){
      String oldPW = "Test_1234";
      String newPW  = "NEWPASS!123";

      String? result = PasswordValidator().validateChange(oldPW, newPW, newPW);

      print("old: $oldPW new: $newPW: $result");
      expect(result, StaticStrings.passwordInvalid);
    });


    //Password Complexity: no letters
    test("Change Password: new password no letters", (){
      String oldPW = "Test_1234";
      String newPW  = "12345678!";

      String? result = PasswordValidator().validateChange(oldPW, newPW, newPW);

      print("old: $oldPW new: $newPW: $result");
      expect(result, StaticStrings.passwordInvalid);
    });

    //Login: No password entered
    test("Enter Password (Login): No password entered", (){
      String password = "";

      String? result = PasswordValidator().validatePassword(password);

      print("No password entered: $result");
      expect(result, StaticStrings.passwordEmpty);
    });

    //Login: Password entered is too short (so it is definitely wrong)
    test("Enter Password (Login): password entered too short", (){
      String password = "Test@12";

      String? result = PasswordValidator().validatePassword(password);

      print("$password: $result");
      expect(result, StaticStrings.passwordWrong);
    });
  });
}