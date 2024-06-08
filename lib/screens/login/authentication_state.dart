enum AuthenticationStatus {
  UNKNOWN,
  PENDING,
  FIRSTLOGIN,
  AUTHENTICATED,
  UNAUTHENTICATED,
  SERVERNOTREACHABLE
}

abstract class AuthenticationState {
  late AuthenticationStatus status;
}

class AuthenticationStateInitial extends AuthenticationState {
  get status => AuthenticationStatus.UNKNOWN;
}

class AuthenticationStateChanged extends AuthenticationState {
  AuthenticationStateChanged(this.status);

  final AuthenticationStatus status;
}
