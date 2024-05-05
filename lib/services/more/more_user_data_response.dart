import 'package:json_annotation/json_annotation.dart';

part 'more_user_data_response.g.dart';

@JsonSerializable()
class UserDataResponse {
  final String tokenType;
  final String accessToken;
  final int statusCode;

  UserDataResponse(this.tokenType, this.accessToken, this.statusCode);

  factory UserDataResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDataResponseFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserDataResponseToJson(this);
}
