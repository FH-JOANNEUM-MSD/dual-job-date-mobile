import 'package:bloc/bloc.dart';

import '../../services/companies/company_service.dart';
import 'companies_event.dart';
import 'companies_state.dart';

class CompaniesBloc extends Bloc<CompaniesEvent, CompaniesState> {
  CompaniesBloc() : super(CompaniesStateInitial()) {
    on<CompaniesFetchEvent>((event, emit) async {
      if (event == CompaniesFetchEvent()) {
        emit(CompaniesStateLoading());

        var companies = await CompanyService.getActiveCompanies();
        if (companies != null) {
          emit(CompaniesStateLoaded(companies));
        } else {
          emit(CompaniesStateError());
        }
      }
    });
  }
}
