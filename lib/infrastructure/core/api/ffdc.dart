part of ava.infrastructure.core.api;

class Ffdc extends ApiEndpointBase {
  Ffdc(AvaApiClient client) : super(client);

  String get _balance_path => 'accounts/0543123467001/balances';
  String get _payments_path => 'fund-transfers/external';

  Future<AccountBalanceDto> getBalance() async {
    final Map<String, String> headers = <String, String>{};

    final String response = await post(_balance_path, headers, {});
    return AccountBalanceDto.fromJson(json.decode(response));
  }

  Future<PaymentRequest> createPayment(
      String fromAccount, String toAccount, String payee) async {
    final Map<String, String> headers = <String, String>{};

    final String response = await post(_payments_path, headers, {});
    return PaymentRequest.fromJson(json.decode(response));
  }
}
