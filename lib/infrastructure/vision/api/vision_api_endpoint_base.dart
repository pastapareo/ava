part of ava.infrastructure.vision.api;

abstract class VisionApiEndpointBase {
  VisionApiEndpointBase(this._client);

  final VisionApiClient _client;

  Future<String> post(String path, Map<String, String> headers, dynamic body) =>
      _client.post(path, headers: headers, body: body);
}
