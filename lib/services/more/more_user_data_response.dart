import 'package:json_annotation/json_annotation.dart';

part 'more_user_data_response.g.dart';

///Parses the http response from json to a flutter object
@JsonSerializable()
class UserDataResponse {
  final String firstName;
  final String lastName;
  final String email;
  final int statusCode;

  UserDataResponse(this.firstName, this.lastName,this.email, this.statusCode);

  factory UserDataResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDataResponseFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserDataResponseToJson(this);
}
