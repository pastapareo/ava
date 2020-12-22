part of ava.infrastructure.voice.api;

abstract class VoiceApiEndpointBase {
  VoiceApiEndpointBase(this._client);

  final VoiceApiClient _client;

  Future<String> post(String path, Map<String, String> headers, dynamic body) =>
      _client.post(path, headers: headers, body: body);
}
