import 'package:ava/infrastructure/ffdc/amount.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_balance.freezed.dart';
part 'account_balance.g.dart';

@freezed
abstract class AccountBalance with _$AccountBalance {
  const factory AccountBalance({
    @required String type,
    @required Amount amount,
  }) = _AccountBalance;

  factory AccountBalance.fromJson(Map<String, dynamic> json) =>
      _$AccountBalanceFromJson(json);
}
