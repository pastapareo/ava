// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'account_balance_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

AccountBalanceDto _$AccountBalanceDtoFromJson(Map<String, dynamic> json) {
  return _AccountBalanceDto.fromJson(json);
}

mixin _$AccountBalanceDto {
  String get type;
  Amount get amount;

  AccountBalanceDto copyWith({String type, Amount amount});

  Map<String, dynamic> toJson();
}

class _$AccountBalanceDtoTearOff {
  const _$AccountBalanceDtoTearOff();

  _AccountBalanceDto call({@required String type, @required Amount amount}) {
    return _AccountBalanceDto(
      type: type,
      amount: amount,
    );
  }
}

const $AccountBalanceDto = _$AccountBalanceDtoTearOff();

@JsonSerializable()
class _$_AccountBalanceDto implements _AccountBalanceDto {
  const _$_AccountBalanceDto({@required this.type, @required this.amount})
      : assert(type != null),
        assert(amount != null);

  factory _$_AccountBalanceDto.fromJson(Map<String, dynamic> json) =>
      _$_$_AccountBalanceDtoFromJson(json);

  @override
  final String type;
  @override
  final Amount amount;

  @override
  String toString() {
    return 'AccountBalanceDto(type: $type, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AccountBalanceDto &&
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
  _$_AccountBalanceDto copyWith({
    Object type = freezed,
    Object amount = freezed,
  }) {
    return _$_AccountBalanceDto(
      type: type == freezed ? this.type : type as String,
      amount: amount == freezed ? this.amount : amount as Amount,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AccountBalanceDtoToJson(this);
  }
}

abstract class _AccountBalanceDto implements AccountBalanceDto {
  const factory _AccountBalanceDto(
      {@required String type, @required Amount amount}) = _$_AccountBalanceDto;

  factory _AccountBalanceDto.fromJson(Map<String, dynamic> json) =
      _$_AccountBalanceDto.fromJson;

  @override
  String get type;
  @override
  Amount get amount;

  @override
  _AccountBalanceDto copyWith({String type, Amount amount});
}
