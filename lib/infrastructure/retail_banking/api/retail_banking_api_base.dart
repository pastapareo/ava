part of ava.infrastructure.retailbanking.api;

abstract class RetailBankingApiBase {
  RetailBankingApiBase(this._client) {
    _accounts = Accounts(this);
  }

  final http.Client _client;

  Accounts _accounts;
  Accounts get accounts => _accounts;

  Future<String> post(String path,
      {Map<String, String> headers, dynamic body = ''}) async {
    String url = '$ffdcApiEndpoint/$path';
    final http.Response response = await _client.post(url, headers: body);
    return _checkResponse(response);
  }

  String _checkResponse(http.Response response) {
    final String responseBody = utf8.decode(response.bodyBytes);
    switch (response.statusCode) {
      case 200:
        return responseBody;
      case 401:
        throw UnauthorizedException();
      case 403:
        throw UnauthorizedException();
      default:
        final String message = _parseError(response.statusCode, response.body);
        throw EndpointsException(response.statusCode, message);
    }
  }

  String _parseError(int code, String response) {
    dynamic message = response;

    if (response.contains('DOCTYPE html')) {
      // getIt<SimpleLogger>().severe('An error occured');
      return 'An error occurred';
    }

    try {
      final dynamic jsonResponse = json.decode(response);

      message = jsonResponse['message'] ?? jsonResponse;

      if (jsonResponse['errors'] != null && (jsonResponse['errors'] as Map).isNotEmpty) {
        message += '\n';
        try {
          jsonResponse['errors'].forEach((String field, dynamic errors) {
            (errors as List<dynamic>)
                .forEach((dynamic error) => message += '\n • $error');
          });
        } catch (error) {
          // getIt<SimpleLogger>().severe('Failed to parse error: $error');
        }
      }
    } catch (error) {
      // getIt<SimpleLogger>().severe('Failed to parse error: $error');
    }

    // getIt<SimpleLogger>().severe('$code: $message');
    return message;
  }
}
