// GENERATED CODE - DO NOT MODIFY BY HAND

part of ava.infrastructure.ffdc.api;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountBalanceDto _$_$_AccountBalanceDtoFromJson(Map<String, dynamic> json) {
  return _$_AccountBalanceDto(
    type: json['type'] as String,
    amount: json['amount'] == null
        ? null
        : Amount.fromJson(json['amount'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_AccountBalanceDtoToJson(
        _$_AccountBalanceDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'amount': instance.amount,
    };

_$_AccountBalance _$_$_AccountBalanceFromJson(Map<String, dynamic> json) {
  return _$_AccountBalance(
    type: json['type'] as String,
    amount: json['amount'] == null
        ? null
        : Amount.fromJson(json['amount'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_AccountBalanceToJson(_$_AccountBalance instance) =>
    <String, dynamic>{
      'type': instance.type,
      'amount': instance.amount,
    };

_$_Amount _$_$_AmountFromJson(Map<String, dynamic> json) {
  return _$_Amount(
    amount: json['amount'] as String,
    currency: json['currency'] as String,
  );
}

Map<String, dynamic> _$_$_AmountToJson(_$_Amount instance) => <String, dynamic>{
      'amount': instance.amount,
      'currency': instance.currency,
    };

_$_JwtToken _$_$_JwtTokenFromJson(Map<String, dynamic> json) {
  return _$_JwtToken(
    accessToken: json['accessToken'] as String,
  );
}

Map<String, dynamic> _$_$_JwtTokenToJson(_$_JwtToken instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
    };

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
