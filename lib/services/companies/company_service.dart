import 'dart:convert';
import 'package:dual_job_date_mobile/services/HttpHelper.dart';
import 'package:dual_job_date_mobile/services/companies/company.dart';


class CompanyService {
  static String getActiveCompaniesEndpoint = "Company/ActiveCompanies";

  static Future<List<Company>> getActiveCompanies() async {
    var response = await HTTPHelper.get(getActiveCompaniesEndpoint);

    if (response != null && response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      List<Company> companies = jsonList.map((json) => Company.fromJson(json)).toList();
      return companies;
    } else {
      return [];
    }
  }
}
