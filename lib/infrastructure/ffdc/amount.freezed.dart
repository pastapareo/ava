// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'amount.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Amount _$AmountFromJson(Map<String, dynamic> json) {
  return _Amount.fromJson(json);
}

mixin _$Amount {
  String get amount;
  String get currency;

  Amount copyWith({String amount, String currency});

  Map<String, dynamic> toJson();
}

class _$AmountTearOff {
  const _$AmountTearOff();

  _Amount call({@required String amount, @required String currency}) {
    return _Amount(
      amount: amount,
      currency: currency,
    );
  }
}

const $Amount = _$AmountTearOff();

@JsonSerializable()
class _$_Amount implements _Amount {
  const _$_Amount({@required this.amount, @required this.currency})
      : assert(amount != null),
        assert(currency != null);

  factory _$_Amount.fromJson(Map<String, dynamic> json) =>
      _$_$_AmountFromJson(json);

  @override
  final String amount;
  @override
  final String currency;

  @override
  String toString() {
    return 'Amount(amount: $amount, currency: $currency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Amount &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.currency, currency) ||
                const DeepCollectionEquality()
                    .equals(other.currency, currency)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(currency);

  @override
  _$_Amount copyWith({
    Object amount = freezed,
    Object currency = freezed,
  }) {
    return _$_Amount(
      amount: amount == freezed ? this.amount : amount as String,
      currency: currency == freezed ? this.currency : currency as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AmountToJson(this);
  }
}

abstract class _Amount implements Amount {
  const factory _Amount({@required String amount, @required String currency}) =
      _$_Amount;

  factory _Amount.fromJson(Map<String, dynamic> json) = _$_Amount.fromJson;

  @override
  String get amount;
  @override
  String get currency;

  @override
  _Amount copyWith({String amount, String currency});
}
