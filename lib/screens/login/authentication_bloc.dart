import 'package:bloc/bloc.dart';
import 'package:dual_job_date_mobile/screens/login/authentication_event.dart';
import 'package:dual_job_date_mobile/screens/login/authentication_state.dart';
import 'package:dual_job_date_mobile/services/login_service.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationStateInitial()) {
    {
      on<LoginEvent>((event, emit) async {
        var loggendIn = await LoginService.login(event.email, event.password);
        if (loggendIn) {
          emit(AuthenticationStateChanged(AuthenticationStatus.authenticated));
        } else {
          emit(
              AuthenticationStateChanged(AuthenticationStatus.unauthenticated));
        }
      });

      on<RefreshBearerEvent>((event, emit) async {
        //TODO communicate with backend: required is refresh token

      });

      on<LogoutEvent>((event, emit) async {
        //TODO delete toke from storage
        emit(AuthenticationStateChanged(AuthenticationStatus.unauthenticated));
      });
    }
  }
}
