import 'dart:convert';
import 'package:dual_job_date_mobile/services/HttpHelper.dart';
import 'package:dual_job_date_mobile/services/companies/company.dart';

class CompanyService {
  static String getActiveCompaniesEndpoint = "Company/ActiveCompanies";
  static String postReactionToCompanyEndPoint =
      "StudentCompany/AddLikeOrDislike";

  static Future<List<Company>?> getActiveCompanies() async {
    try {
      var response = await HTTPHelper.get(getActiveCompaniesEndpoint);
      if (response!.statusCode == 200) {
        List<dynamic> jsonList = json.decode(response.body);
        List<Company> companies =
            jsonList.map((json) => Company.fromJson(json)).toList();
        return companies;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<bool> reactToCompany(int companyId, bool reaction) async {
    try {
      var query =
          '$postReactionToCompanyEndPoint?like=$reaction&companyId=$companyId';
      var response = await HTTPHelper.post(query, "");

      if (response!.statusCode == 200)
        return true;
      else
        return false;
    } catch (e) {
      return false;
    }
  }
}
