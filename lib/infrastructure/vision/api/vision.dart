part of ava.infrastructure.vision.api;

class Vision extends VisionApiEndpointBase {
  Vision(VisionApiClient client) : super(client);

  String get _path => 'ocr?language=unk&detectOrientation=true';

  Future<OcrResponse> ocr(imageData) async {
    final Map<String, String> headers = <String, String>{};
    final body = imageData;

    final String response = await post(_path, headers, body);
    return OcrResponse.fromJson(json.decode(response));
  }
}
