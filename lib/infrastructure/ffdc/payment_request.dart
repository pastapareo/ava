import 'package:ava/infrastructure/ffdc/amount.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_request.freezed.dart';
part 'payment_request.g.dart';

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
