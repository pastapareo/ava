part of ava.infrastructure.ffdc.api;

@freezed
abstract class AccountBalance with _$AccountBalance {
  const factory AccountBalance({
    @required String type,
    @required Amount amount,
  }) = _AccountBalance;

  factory AccountBalance.fromJson(Map<String, dynamic> json) =>
      _$AccountBalanceFromJson(json);
}
