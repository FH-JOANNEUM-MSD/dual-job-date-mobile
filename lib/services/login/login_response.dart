import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String tokenType;
  final String accessToken;
  final int expiresIn;
  final String refreshToken;
  final bool isNew;
  final String userId;
  final String email;
  final int statusCode;

  LoginResponse(this.tokenType, this.accessToken, this.expiresIn,
      this.refreshToken, this.isNew,this.userId,this.email,this.statusCode);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
