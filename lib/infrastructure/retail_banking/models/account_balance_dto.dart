part of ava.infrastructure.ffdc.api;

@freezed
abstract class AccountBalanceDto with _$AccountBalanceDto {
  const factory AccountBalanceDto({
    @required String type,
    @required Amount amount,
  }) = _AccountBalanceDto;

  factory AccountBalanceDto.fromJson(Map<String, dynamic> json) =>
      _$AccountBalanceDtoFromJson(json);
}
