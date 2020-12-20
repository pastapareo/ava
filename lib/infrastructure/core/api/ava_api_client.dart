part of ava.infrastructure.core.api;

@lazySingleton
class AvaApiClient extends ApiBase {
  AvaApiClient(IOClient client) : super(client);

  AvaApiClient.fromClient(IOClient client) : super(client);

  @factoryMethod
  static Future<AvaApiClient> getClient() async {
    final SecurityContext securityContext = SecurityContext();

    /*
    final ByteData crtData = await rootBundle.load('assets/certs/lisa.pem');
    final ByteData prvKey = await rootBundle.load('assets/certs/lisa.key');
    final ByteData chain = await rootBundle.load('assets/certs/lisa.crt');
    securityContext.setTrustedCertificatesBytes(crtData.buffer.asUint8List(),
        password: EnvironmentConfig.chainKey);
    securityContext.setClientAuthoritiesBytes(crtData.buffer.asUint8List(),
        password: EnvironmentConfig.chainKey);
    securityContext.useCertificateChainBytes(chain.buffer.asUint8List(),
        password: EnvironmentConfig.chainKey);
    securityContext.usePrivateKeyBytes(prvKey.buffer.asUint8List(),
        password: EnvironmentConfig.prvKey);
  */

    final HttpClient client = HttpClient(context: securityContext)
      ..badCertificateCallback = ((X509Certificate cert, String host, int port) => true);

    return AvaApiClient.fromClient(IOClient(client));
  }
}
