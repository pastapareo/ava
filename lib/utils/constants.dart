String apiEndpoint = 'https://eastus.api.cognitive.microsoft.com/vision/v3.1';

enum EyeModes {
  OCR,
  OBJECT,
  MONEY,
  PERSON,
}

EyeModes nextMode(EyeModes value) {
  final nextIndex = (value.index + 1) % EyeModes.values.length;
  return EyeModes.values[nextIndex];
}

EyeModes previousMode(EyeModes value) {
  final nextIndex = (value.index - 1) % EyeModes.values.length;
  return EyeModes.values[nextIndex];
}
