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
}

class CompaniesStateInitial extends CompaniesState {
  get status => CompaniesStatus.INITIAL;

  get companies => [];
}

class CompaniesStateLoading extends CompaniesState {
  get status => CompaniesStatus.LOADING;
}

class CompaniesStateLoaded extends CompaniesState {
  CompaniesStateLoaded(this.companies);

  final List<Company> companies;

  get status => CompaniesStatus.LOADED;
}

class CompaniesStateError extends CompaniesState {
  get status => CompaniesStatus.ERROR;
}
