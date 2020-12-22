String visionApiEndpoint = 'https://eastus.api.cognitive.microsoft.com/vision/v3.1';
String voiceApiEndpoint = 'https://eastus.tts.speech.microsoft.com/cognitiveservices/v1';
String ffdcApiEndpoint = 'https://api.fusionfabric.cloud/retail-banking';
String ffdcTokenEndpoint = 'https://api.fusionfabric.cloud/login/v1/sandbox/oidc/token';

enum EyeModes {
  OCR,
  OBJECT,
  CART,
  MONEY,
}

EyeModes nextMode(EyeModes value) {
  final nextIndex = (value.index + 1) % EyeModes.values.length;
  return EyeModes.values[nextIndex];
}

EyeModes previousMode(EyeModes value) {
  final nextIndex = (value.index - 1) % EyeModes.values.length;
  return EyeModes.values[nextIndex];
}

enum API {
  VISION,
  VOICE,
  FFDC,
  FFDCTOKEN,
}
