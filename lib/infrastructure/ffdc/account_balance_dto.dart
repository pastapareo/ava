import 'package:ava/infrastructure/ffdc/amount.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_balance_dto.freezed.dart';
part 'account_balance_dto.g.dart';

@freezed
abstract class AccountBalanceDto with _$AccountBalanceDto {
  const factory AccountBalanceDto({
    @required String type,
    @required Amount amount,
  }) = _AccountBalanceDto;

  factory AccountBalanceDto.fromJson(Map<String, dynamic> json) =>
      _$AccountBalanceDtoFromJson(json);
}
