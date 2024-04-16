import 'package:bloc/bloc.dart';
import 'package:dual_job_date_mobile/screens/login/authentication_event.dart';
import 'package:dual_job_date_mobile/screens/login/authentication_state.dart';
import 'package:dual_job_date_mobile/services/login_service.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationStateInitial()) {
    {
      on<LoginEvent>((event, emit) async {
        emit(
            AuthenticationStateChanged(AuthenticationStatus.PENDING));

        var statusCode = await LoginService.login(event.email, event.password);
        switch (statusCode) {
          case 200:
            emit(
                AuthenticationStateChanged(AuthenticationStatus.AUTHENTICATED));
            break;
          case 401:
          // TODO: Refresh token
            emit(
                AuthenticationStateChanged(
                    AuthenticationStatus.UNAUTHENTICATED));
            break;
          case 403:
          // TODO: Refresh
            emit(
                AuthenticationStateChanged(
                    AuthenticationStatus.UNAUTHENTICATED));
            break;
          default:
            emit(
                AuthenticationStateChanged(
                    AuthenticationStatus.UNAUTHENTICATED));
            break;
        }
      });

      on<RefreshBearerEvent>((event, emit) async {
        //TODO communicate with backend: required is refresh token

      });

      on<LogoutEvent>((event, emit) async {
        //TODO delete toke from storage
        emit(AuthenticationStateChanged(AuthenticationStatus.UNAUTHENTICATED));
      });
    }
  }
}
