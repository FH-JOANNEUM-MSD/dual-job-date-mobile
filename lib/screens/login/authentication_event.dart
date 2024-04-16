abstract class AuthenticationEvent {}

class LoginEvent extends AuthenticationEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}

class RefreshBearerEvent extends AuthenticationEvent {
  final String refrehToken;

  RefreshBearerEvent(this.refrehToken);
}


class LogoutEvent extends AuthenticationEvent{}
