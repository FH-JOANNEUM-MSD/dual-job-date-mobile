import 'package:bloc/bloc.dart';
import 'package:dual_job_date_mobile/tabs/more/more_event.dart';
import 'package:dual_job_date_mobile/tabs/more/more_state.dart';

import '../../services/more/more_user_data_service.dart';

class MoreBloc extends Bloc<MoreEvent,MoreState>{
  MoreBloc(): super(MoreStateInitial()){
    on<MoreGetNameEvent>((event,emit)async {
      //Get user name
      emit (MoreStateChanged(MoreStates.RETRIEVING));
      String? username = await UserDataService().getUserName();
      if(username == null){
        emit(MoreStateChanged(MoreStates.FAIL));
      } else {
        emit(MoreStateChanged(MoreStates.SUCCESS));
      }
    });

    on<MoreChangeNameEvent>((event,emit)async{
      //change user name
      emit(MoreStateChanged(MoreStates.CHANGING));
      bool success = await UserDataService().postUserName(event.newUserName);

      if(success){
        emit(MoreStateChanged(MoreStates.SUCCESS));
      }else{
        emit(MoreStateChanged(MoreStates.FAIL));
      }
    });
  }

}