import 'package:dual_job_date_mobile/services/companies/company.dart';

enum CompaniesStatus {
  INITIAL,
  LOADING,
  LOADED,
  ERROR,
}

abstract class CompaniesState {
  late CompaniesStatus status;
  late List<Company> companies;
  late List<StudentCompany> reactions;
}

class CompaniesStateInitial extends CompaniesState {
  get status => CompaniesStatus.INITIAL;

  get companies => [];
  get reactions => [];
}

class CompaniesStateLoading extends CompaniesState {
  get status => CompaniesStatus.LOADING;
}

class CompaniesStateLoaded extends CompaniesState {
  CompaniesStateLoaded(this.companies, this.reactions);

  final List<Company> companies;
  final List<StudentCompany> reactions;

  get status => CompaniesStatus.LOADED;
}

class CompaniesStateError extends CompaniesState {
  get status => CompaniesStatus.ERROR;
}
