part of ava.infrastructure.retailbanking.api;

abstract class RetailBankingApiEndpointBase {
  RetailBankingApiEndpointBase(this._client);

  final RetailBankingApiClient _client;

  Future<String> post(String path, Map<String, String> headers, dynamic body) =>
      _client.post(path, headers: headers, body: body);
}
