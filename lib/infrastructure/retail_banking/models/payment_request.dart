part of ava.infrastructure.ffdc.api;

@freezed
abstract class PaymentRequest with _$PaymentRequest {
  const factory PaymentRequest({
    @required String fromAccount,
    @required String toAccount,
    @required String payee,
    @required Amount amount,
    @required String narrative,
  }) = _PaymentRequest;

  factory PaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentRequestFromJson(json);
}
