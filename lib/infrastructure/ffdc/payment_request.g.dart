// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentRequest _$_$_PaymentRequestFromJson(Map<String, dynamic> json) {
  return _$_PaymentRequest(
    fromAccount: json['fromAccount'] as String,
    toAccount: json['toAccount'] as String,
    payee: json['payee'] as String,
    amount: json['amount'] == null
        ? null
        : Amount.fromJson(json['amount'] as Map<String, dynamic>),
    narrative: json['narrative'] as String,
  );
}

Map<String, dynamic> _$_$_PaymentRequestToJson(_$_PaymentRequest instance) =>
    <String, dynamic>{
      'fromAccount': instance.fromAccount,
      'toAccount': instance.toAccount,
      'payee': instance.payee,
      'amount': instance.amount,
      'narrative': instance.narrative,
    };
