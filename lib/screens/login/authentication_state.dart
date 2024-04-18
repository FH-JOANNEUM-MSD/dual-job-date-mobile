enum AuthenticationStatus { unknown, authenticated, unauthenticated }

abstract class AuthenticationState {
  late AuthenticationStatus status;
}

class AuthenticationStateInitial extends AuthenticationState {
  get status => AuthenticationStatus.unknown;
}

class AuthenticationStateChanged extends AuthenticationState {
  AuthenticationStateChanged(this.status);
  final AuthenticationStatus status;
}
