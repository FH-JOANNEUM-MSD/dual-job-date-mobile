import 'package:bloc/bloc.dart';
import 'package:dual_job_date_mobile/screens/login/authentication_event.dart';
import 'package:dual_job_date_mobile/screens/login/authentication_state.dart';
import 'package:dual_job_date_mobile/services/login/login_service.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationStateInitial()) {
    {
      on<LoginEvent>((event, emit) async {
        emit(AuthenticationStateChanged(AuthenticationStatus.PENDING));

        var loginResponse =
            await LoginService.login(event.email, event.password);
        switch (loginResponse.statusCode) {
          case 200:
            if (loginResponse.isNew) {
              emit(AuthenticationStateChanged(AuthenticationStatus.FIRSTLOGIN));
            } else {
              emit(AuthenticationStateChanged(
                  AuthenticationStatus.AUTHENTICATED));
            }
            break;
          case 401:
            emit(AuthenticationStateChanged(
                AuthenticationStatus.UNAUTHENTICATED));
            break;
          default:
            emit(AuthenticationStateChanged(
                AuthenticationStatus.SERVERNOTREACHABLE));
            break;
        }
      });

      on<RefreshBearerEvent>((event, emit) async {
        var isAuthenticated = await LoginService.isAuthenticated();
        if (isAuthenticated) {
          emit(AuthenticationStateChanged(AuthenticationStatus.AUTHENTICATED));
        } else {
          emit(
              AuthenticationStateChanged(AuthenticationStatus.UNAUTHENTICATED));
        }
      });

      on<LogoutEvent>((event, emit) async {
        await LoginService.flushStorage();
        emit(AuthenticationStateChanged(AuthenticationStatus.UNAUTHENTICATED));
      });
    }
  }
}
