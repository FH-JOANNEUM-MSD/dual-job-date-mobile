enum MoreStates{
  INITIAL,
  CHANGING,
  RETRIEVING,
  SUCCESS,
  FAIL
}

abstract class MoreState{
  late MoreStates state;
}

class MoreStateInitial extends MoreState{
  get state => MoreStates.INITIAL;
}

class MoreStateChanged extends MoreState{
  MoreStateChanged(this.state);

  final MoreStates state;
}