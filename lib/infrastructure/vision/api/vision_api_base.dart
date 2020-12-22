part of ava.infrastructure.vision.api;

abstract class VisionApiBase {
  VisionApiBase(this._client) {
    _vision = Vision(this);
  }

  final http.Client _client;

  Vision _vision;
  Vision get vision => _vision;

  Future<String> post(String path,
      {Map<String, String> headers, dynamic body = ''}) async {
    String url = '$visionApiEndpoint/$path';
    final http.Response response =
        await _client.post(url, headers: _getHeaders(headers), body: body);
    return _checkResponse(response);
  }

  Map<String, String> _getHeaders(Map<String, String> headers) {
    headers['Content-Type'] = 'application/octet-stream"';
    headers['Ocp-Apim-Subscription-Key'] = 'f39e0d015de844eebf61672af275bbd4';
    return headers;
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
