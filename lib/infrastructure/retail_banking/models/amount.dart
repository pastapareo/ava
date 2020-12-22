part of ava.infrastructure.ffdc.api;

@freezed
abstract class Amount with _$Amount {
  const factory Amount({
    @required String amount,
    @required String currency,
  }) = _Amount;

  factory Amount.fromJson(Map<String, dynamic> json) => _$AmountFromJson(json);
}
