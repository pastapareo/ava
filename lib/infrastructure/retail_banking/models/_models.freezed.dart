// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of ava.infrastructure.ffdc.api;

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

JwtToken _$JwtTokenFromJson(Map<String, dynamic> json) {
  return _JwtToken.fromJson(json);
}

mixin _$JwtToken {
  String get accessToken;

  JwtToken copyWith({String accessToken});

  Map<String, dynamic> toJson();
}

class _$JwtTokenTearOff {
  const _$JwtTokenTearOff();

  _JwtToken call({@required String accessToken}) {
    return _JwtToken(
      accessToken: accessToken,
    );
  }
}

const $JwtToken = _$JwtTokenTearOff();

@JsonSerializable()
class _$_JwtToken implements _JwtToken {
  const _$_JwtToken({@required this.accessToken}) : assert(accessToken != null);

  factory _$_JwtToken.fromJson(Map<String, dynamic> json) =>
      _$_$_JwtTokenFromJson(json);

  @override
  final String accessToken;

  @override
  String toString() {
    return 'JwtToken(accessToken: $accessToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _JwtToken &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(accessToken);

  @override
  _$_JwtToken copyWith({
    Object accessToken = freezed,
  }) {
    return _$_JwtToken(
      accessToken:
          accessToken == freezed ? this.accessToken : accessToken as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_JwtTokenToJson(this);
  }
}

abstract class _JwtToken implements JwtToken {
  const factory _JwtToken({@required String accessToken}) = _$_JwtToken;

  factory _JwtToken.fromJson(Map<String, dynamic> json) = _$_JwtToken.fromJson;

  @override
  String get accessToken;

  @override
  _JwtToken copyWith({String accessToken});
}

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
