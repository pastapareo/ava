part of ava.infrastructure.retailbanking.api;

@lazySingleton
class RetailBankingApiClient extends RetailBankingApiBase {
  RetailBankingApiClient(IOClient client) : super(client);

  RetailBankingApiClient.fromClient(IOClient client) : super(client);

  @factoryMethod
  static Future<RetailBankingApiClient> getClient() async {
    final SecurityContext securityContext = SecurityContext();

    final HttpClient client = HttpClient(context: securityContext)
      ..badCertificateCallback = ((X509Certificate cert, String host, int port) => true);

    return RetailBankingApiClient.fromClient(IOClient(client));
  }
}
