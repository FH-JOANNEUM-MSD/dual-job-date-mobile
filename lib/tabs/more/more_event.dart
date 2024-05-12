abstract class MoreEvent{

}

class MoreGetNameEvent extends MoreEvent{

}

class MoreChangeNameEvent extends MoreEvent{
  MoreChangeNameEvent(this.newUserName);
  final String newUserName;
}