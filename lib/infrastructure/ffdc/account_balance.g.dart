// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
