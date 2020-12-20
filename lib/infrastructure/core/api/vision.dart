part of ava.infrastructure.core.api;

class Vision extends ApiEndpointBase {
  Vision(AvaApiClient client) : super(client);

  String get _path => 'ocr?language=unk&detectOrientation=true';

  Future<OcrResponse> ocr(imageData) async {
    final Map<String, String> headers = <String, String>{};
    final body = imageData;

    final String response = await post(_path, headers, body);
    return OcrResponse.fromJson(json.decode(response));
  }
}
