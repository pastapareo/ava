part of ava.infrastructure.voice.api;

@lazySingleton
class VoiceApiClient extends VoiceApiBase {
  VoiceApiClient(IOClient client) : super(client);

  VoiceApiClient.fromClient(IOClient client) : super(client);

  @factoryMethod
  static Future<VoiceApiClient> getClient() async {
    final SecurityContext securityContext = SecurityContext();

    final HttpClient client = HttpClient(context: securityContext)
      ..badCertificateCallback = ((X509Certificate cert, String host, int port) => true);

    return VoiceApiClient.fromClient(IOClient(client));
  }
}
