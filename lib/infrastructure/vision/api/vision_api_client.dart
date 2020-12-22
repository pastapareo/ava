part of ava.infrastructure.vision.api;

@lazySingleton
class VisionApiClient extends VisionApiBase {
  VisionApiClient(IOClient client) : super(client);

  VisionApiClient.fromClient(IOClient client) : super(client);

  @factoryMethod
  static Future<VisionApiClient> getClient() async {
    final SecurityContext securityContext = SecurityContext();

    final HttpClient client = HttpClient(context: securityContext)
      ..badCertificateCallback = ((X509Certificate cert, String host, int port) => true);

    return VisionApiClient.fromClient(IOClient(client));
  }
}
