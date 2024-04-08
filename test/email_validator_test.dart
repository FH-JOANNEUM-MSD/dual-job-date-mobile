import 'package:dual_job_date_mobile/static_helpers/strings.dart';
import 'package:dual_job_date_mobile/static_helpers/validators.dart';
import 'package:flutter_test/flutter_test.dart';

///Test the Email address validation
void main(){
  ///Tests that should receive null from the email validator
  group("Good Case Tests", () {
    //Example Student E-Mail address
   test('FH Student mail', (){
     String testmail = "student.msd@edu.fh-jonneum.at";
     String? result = EmailValidator().validate(testmail);
     print("$testmail: $result");
     expect(result, null);

   });

   //E-Mail address formatted like a common company mail address
   test("Company Email Address", (){

     String testmail = "first.second@company.com";
     String? result = EmailValidator().validate(testmail);
     print("$testmail: $result");
     expect(result, null);

   });

   //E-Mail address consisting of three parts
   test("Basic Three Part Email Address", (){

     String testmail = "first.second.third@gmail.de";
     String? result = EmailValidator().validate(testmail);
     print("$testmail: $result");
     expect(result, null);

   });

   //Most basic possible e-mail address
   test("Simplest possible E-Mail Address", (){

     String testmail = "first@gmail.de";
     String? result = EmailValidator().validate(testmail);
     print("$testmail: $result");
     expect(result, null);

   });

   //Tests the two example e-mail addresses given by the backend team
   test("Test Example E-Mails from backend", (){
     List<String> emails = [
       'student1@fh-jonneum.at',
       'student2@fh-joanneum.at'
     ];

     for(String email in emails){
       String? result = EmailValidator().validate(email);

       print('$email: $result');

       expect(result, null);
     }

   });
  });

  ///Tests that should receive some error message from the Email validator
group("Bad Case Tests", () {
  //No Email-Address was entered
  test("Empty E-Mail", (){
    String testmail = "";
    String? result = EmailValidator().validate(testmail);
    print("No E-Mail passed to validator: $result");
    expect(result, StaticStrings.emailEmpty);
  });
//Only the first part of an e-mail address was entered
  test("missing second half", (){
    String testmail = "student.msd";
    String? result = EmailValidator().validate(testmail);
    print("$testmail: $result");
    expect(result, StaticStrings.emailInvalid);
  });

  //Only the second half of an e-mail address was entered
  test("Missing first half", (){
    String testmail = "@fh-jonneum.at";
    String? result = EmailValidator().validate(testmail);
    print("$testmail: $result");
    expect(result, StaticStrings.emailInvalid);
  });

  //the .countrycode is missing (like .at, .com, etc)
  test("Missing .com", (){
    String testmail = "student.msd@fh-jonneum";
    String? result = EmailValidator().validate(testmail);
    print("$testmail: $result");
    expect(result, StaticStrings.emailInvalid);
  });

  //the . is present but the country code is missing (like at, com, etc)
  test("Missing com", (){
    String testmail = "student.msd@fh-jonneum.";
    String? result = EmailValidator().validate(testmail);
    print("$testmail: $result");
    expect(result, StaticStrings.emailInvalid);
  });
});

}


