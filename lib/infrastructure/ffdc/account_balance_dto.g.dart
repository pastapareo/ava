// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_balance_dto.dart';

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
