part of ava.infrastructure.core.api;

class Voice extends ApiEndpointBase {
  Voice(AvaApiClient client) : super(client);

  AudioPlayer _audioPlayer = AudioPlayer();
  String _regionIdentifier = 'eastus';
  String _subscriptionKey = '5483fc33543442deb1eb1296f5547d24';
  String _accessToken;
  DateTime _accessTokenTimestamp;

  String get _path => 'https://eastus.tts.speech.microsoft.com/cognitiveservices/v1';

  Future<void> speak(String text) async {
    final Map<String, String> headers = <String, String>{
      'Content-Type': 'application/ssml+xml',
      'X-Microsoft-OutputFormat': 'audio-16khz-128kbitrate-mono-mp3',
      'Authorization': 'Bearer ' + await _getAccessToken(),
    };

    xml.XmlBuilder builder = xml.XmlBuilder();
    builder.element('speak', nest: () {
      builder.attribute('version', '1.0');
      builder.attribute('xmlns', 'http://www.w3.org/2001/10/synthesis');
      builder.attribute('xmlns:mstts', 'https://www.w3.org/2001/mstts');
      builder.attribute('xml:lang', 'en-US');
      builder.element('voice', nest: () {
        builder.attribute('name', 'en-US-AriaNeural');
        builder.element('mstts:express-as', nest: () {
          builder.attribute('style', 'gentle');
          builder.element('p', nest: () {
            builder.element('s', nest: () {
              builder.text(text);
            });
          });
        });
      });
    });

    final String body = builder.build().toXmlString();

    http.Response request = await http.post(_path, headers: headers, body: body);

    Uint8List bytes = request.bodyBytes;

    final dir = await getApplicationDocumentsDirectory();
    final file = new File('${dir.path}/audio.mp3');

    await file.writeAsBytes(bytes);
    if (await file.exists()) {
      _audioPlayer.play(file.path);
    }
  }

  Future<String> _getAccessToken() async {
    if (_accessTokenTimestamp == null ||
        (_accessTokenTimestamp.difference(DateTime.now()).inMinutes >= 9)) {
      _accessTokenTimestamp = DateTime.now();
      await _updateAccessToken();
    }
    return _accessToken;
  }

  Future<void> _updateAccessToken() async {
    String url =
        "https://$_regionIdentifier.api.cognitive.microsoft.com/sts/v1.0/issueToken";
    Map<String, String> headers = {'Ocp-Apim-Subscription-Key': _subscriptionKey};
    http.Response response = await http.post(url, headers: headers);
    _accessToken = response.body;
  }
}
