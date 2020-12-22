part of ava.infrastructure.ffdc.api;

@freezed
abstract class JwtToken with _$JwtToken {
  const factory JwtToken({
    @required String accessToken,
  }) = _JwtToken;

  factory JwtToken.fromJson(Map<String, dynamic> json) => _$JwtTokenFromJson(json);
}
