///Abstract Base Class
abstract class MoreEvent{

}

///Get does not need any params
class MoreGetNameEvent extends MoreEvent{

}


///Change Name takes a new First and Last name
class MoreChangeNameEvent extends MoreEvent{
  MoreChangeNameEvent(this.newUserFirstName, this.newUserLastName);
  final String newUserFirstName;
  final String newUserLastName;
}