import 'package:bloc/bloc.dart';
import 'package:dual_job_date_mobile/screens/set_new_password/set_new_password_event.dart';
import 'package:dual_job_date_mobile/screens/set_new_password/set_new_password_state.dart';
import 'package:dual_job_date_mobile/services/newpassword/new_password_service.dart';

class SetNewPasswordBloc
    extends Bloc<SetNewPasswordEvent, SetNewPasswordState> {
  SetNewPasswordBloc() : super(SetNewPasswordStateInitial()) {
    {
      on<SetNewPasswordEvent>((event, emit) async {
        var newPwSet = await NewPasswordService.setNewPassword(
            event.currentPassword, event.newPassword);
        if (newPwSet) {
          emit(SetNewPasswordStateChanged(SetNewPasswordStatus.newPasswordSet));
        } else {
          emit(SetNewPasswordStateChanged(
              SetNewPasswordStatus.newPasswordNotSet));
        }
      });
    }
  }
}
