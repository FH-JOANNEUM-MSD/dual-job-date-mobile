import 'package:dual_job_date_mobile/services/more/more_user_data_response.dart';

enum MoreStates{
  INITIAL,
  CHANGING,
  RETRIEVING,
  SUCCESS,
  FAIL
}

abstract class MoreState{
  late MoreStates state;
  late UserDataResponse? userData ;
}

class MoreStateInitial extends MoreState{
  get state => MoreStates.INITIAL;
}

class MoreStateRetrieve extends MoreState{
  MoreStateRetrieve(this.resp) ;

  final UserDataResponse resp;
  get state => MoreStates.RETRIEVING;
  get userData => resp;
}
class MoreStateChanged extends MoreState{
  MoreStateChanged(this.state);

  final MoreStates state;
}