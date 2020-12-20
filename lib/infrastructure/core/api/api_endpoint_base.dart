part of ava.infrastructure.core.api;

abstract class ApiEndpointBase {
  ApiEndpointBase(this._client);

  final AvaApiClient _client;

  Future<String> post(String path, Map<String, String> headers, dynamic body) =>
      _client.post(path, headers: headers, body: body);
}
