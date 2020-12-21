// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'account_balance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

AccountBalance _$AccountBalanceFromJson(Map<String, dynamic> json) {
  return _AccountBalance.fromJson(json);
}

mixin _$AccountBalance {
  String get type;
  Amount get amount;

  AccountBalance copyWith({String type, Amount amount});

  Map<String, dynamic> toJson();
}

class _$AccountBalanceTearOff {
  const _$AccountBalanceTearOff();

  _AccountBalance call({@required String type, @required Amount amount}) {
    return _AccountBalance(
      type: type,
      amount: amount,
    );
  }
}

const $AccountBalance = _$AccountBalanceTearOff();

@JsonSerializable()
class _$_AccountBalance implements _AccountBalance {
  const _$_AccountBalance({@required this.type, @required this.amount})
      : assert(type != null),
        assert(amount != null);

  factory _$_AccountBalance.fromJson(Map<String, dynamic> json) =>
      _$_$_AccountBalanceFromJson(json);

  @override
  final String type;
  @override
  final Amount amount;

  @override
  String toString() {
    return 'AccountBalance(type: $type, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AccountBalance &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(amount);

  @override
  _$_AccountBalance copyWith({
    Object type = freezed,
    Object amount = freezed,
  }) {
    return _$_AccountBalance(
      type: type == freezed ? this.type : type as String,
      amount: amount == freezed ? this.amount : amount as Amount,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AccountBalanceToJson(this);
  }
}

abstract class _AccountBalance implements AccountBalance {
  const factory _AccountBalance(
      {@required String type, @required Amount amount}) = _$_AccountBalance;

  factory _AccountBalance.fromJson(Map<String, dynamic> json) =
      _$_AccountBalance.fromJson;

  @override
  String get type;
  @override
  Amount get amount;

  @override
  _AccountBalance copyWith({String type, Amount amount});
}
