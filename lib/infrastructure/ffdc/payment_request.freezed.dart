// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'payment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

PaymentRequest _$PaymentRequestFromJson(Map<String, dynamic> json) {
  return _PaymentRequest.fromJson(json);
}

mixin _$PaymentRequest {
  String get fromAccount;
  String get toAccount;
  String get payee;
  Amount get amount;
  String get narrative;

  PaymentRequest copyWith(
      {String fromAccount,
      String toAccount,
      String payee,
      Amount amount,
      String narrative});

  Map<String, dynamic> toJson();
}

class _$PaymentRequestTearOff {
  const _$PaymentRequestTearOff();

  _PaymentRequest call(
      {@required String fromAccount,
      @required String toAccount,
      @required String payee,
      @required Amount amount,
      @required String narrative}) {
    return _PaymentRequest(
      fromAccount: fromAccount,
      toAccount: toAccount,
      payee: payee,
      amount: amount,
      narrative: narrative,
    );
  }
}

const $PaymentRequest = _$PaymentRequestTearOff();

@JsonSerializable()
class _$_PaymentRequest implements _PaymentRequest {
  const _$_PaymentRequest(
      {@required this.fromAccount,
      @required this.toAccount,
      @required this.payee,
      @required this.amount,
      @required this.narrative})
      : assert(fromAccount != null),
        assert(toAccount != null),
        assert(payee != null),
        assert(amount != null),
        assert(narrative != null);

  factory _$_PaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$_$_PaymentRequestFromJson(json);

  @override
  final String fromAccount;
  @override
  final String toAccount;
  @override
  final String payee;
  @override
  final Amount amount;
  @override
  final String narrative;

  @override
  String toString() {
    return 'PaymentRequest(fromAccount: $fromAccount, toAccount: $toAccount, payee: $payee, amount: $amount, narrative: $narrative)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PaymentRequest &&
            (identical(other.fromAccount, fromAccount) ||
                const DeepCollectionEquality()
                    .equals(other.fromAccount, fromAccount)) &&
            (identical(other.toAccount, toAccount) ||
                const DeepCollectionEquality()
                    .equals(other.toAccount, toAccount)) &&
            (identical(other.payee, payee) ||
                const DeepCollectionEquality().equals(other.payee, payee)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.narrative, narrative) ||
                const DeepCollectionEquality()
                    .equals(other.narrative, narrative)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(fromAccount) ^
      const DeepCollectionEquality().hash(toAccount) ^
      const DeepCollectionEquality().hash(payee) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(narrative);

  @override
  _$_PaymentRequest copyWith({
    Object fromAccount = freezed,
    Object toAccount = freezed,
    Object payee = freezed,
    Object amount = freezed,
    Object narrative = freezed,
  }) {
    return _$_PaymentRequest(
      fromAccount:
          fromAccount == freezed ? this.fromAccount : fromAccount as String,
      toAccount: toAccount == freezed ? this.toAccount : toAccount as String,
      payee: payee == freezed ? this.payee : payee as String,
      amount: amount == freezed ? this.amount : amount as Amount,
      narrative: narrative == freezed ? this.narrative : narrative as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PaymentRequestToJson(this);
  }
}

abstract class _PaymentRequest implements PaymentRequest {
  const factory _PaymentRequest(
      {@required String fromAccount,
      @required String toAccount,
      @required String payee,
      @required Amount amount,
      @required String narrative}) = _$_PaymentRequest;

  factory _PaymentRequest.fromJson(Map<String, dynamic> json) =
      _$_PaymentRequest.fromJson;

  @override
  String get fromAccount;
  @override
  String get toAccount;
  @override
  String get payee;
  @override
  Amount get amount;
  @override
  String get narrative;

  @override
  _PaymentRequest copyWith(
      {String fromAccount,
      String toAccount,
      String payee,
      Amount amount,
      String narrative});
}
