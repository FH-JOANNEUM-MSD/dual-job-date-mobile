enum SetNewPasswordStatus { newPasswordSet, newPasswordNotSet }

abstract class SetNewPasswordState {
  late SetNewPasswordStatus status;
}

class SetNewPasswordStateInitial extends SetNewPasswordState {
  @override
  get status => SetNewPasswordStatus.newPasswordNotSet ;
}

class SetNewPasswordStateChanged extends SetNewPasswordState {
  SetNewPasswordStateChanged(this.status);
  final SetNewPasswordStatus status;
}
