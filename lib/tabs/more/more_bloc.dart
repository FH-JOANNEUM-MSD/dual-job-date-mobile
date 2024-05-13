import 'package:bloc/bloc.dart';
import 'package:dual_job_date_mobile/services/more/more_user_data_response.dart';
import 'package:dual_job_date_mobile/tabs/more/more_event.dart';
import 'package:dual_job_date_mobile/tabs/more/more_state.dart';

import '../../services/more/more_user_data_service.dart';

///BLOC class for the More Screen. Handles retrieving and changing
/// the User names and email
class MoreBloc extends Bloc<MoreEvent,MoreState>{
  MoreBloc(): super(MoreStateInitial()){
    ///Get the user data
    on<MoreGetNameEvent>((event,emit)async {
      //Get user name
      emit (MoreStateChanged(MoreStates.RETRIEVING));
      UserDataResponse? username = await UserDataService().getUserName();
      if(username == null){ //if null is returned, that means something went wrong
        emit(MoreStateChanged(MoreStates.FAIL));
      } else { //Success - Yaaay
        emit(MoreStateChanged(MoreStates.SUCCESS));
        UserDataService.userName = username.firstName;
        UserDataService.email = username.email;
      }
    });

    ///change the user data (first and last name)
    on<MoreChangeNameEvent>((event,emit)async{
      //change user name
      emit(MoreStateChanged(MoreStates.CHANGING));
      bool success = await UserDataService().postUserName(event);

      if(success){
        emit(MoreStateChanged(MoreStates.SUCCESS));
      }else{
        emit(MoreStateChanged(MoreStates.FAIL));
      }
    });
  }

}