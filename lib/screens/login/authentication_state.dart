enum AuthenticationStatus {
  UNKNONW,
  PENDING,
  FIRSTLOGIN,
  AUTHENTICATED,
  UNAUTHENTICATED
}

abstract class AuthenticationState {
  late AuthenticationStatus status;
}

class AuthenticationStateInitial extends AuthenticationState {
  get status => AuthenticationStatus.UNKNONW;
}

class AuthenticationStateChanged extends AuthenticationState {
  AuthenticationStateChanged(this.status);

  final AuthenticationStatus status;
}
