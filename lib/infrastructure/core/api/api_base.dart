part of ava.infrastructure.core.api;

abstract class ApiBase {
  ApiBase(this._client) {
    _vision = Vision(this);
    _voice = Voice(this);
  }

  final http.Client _client;

  Vision _vision;
  Vision get vision => _vision;

  Voice _voice;
  Voice get voice => _voice;

  Future<String> post(String path, {Map<String, String> headers, dynamic body = ''}) {
    print('$apiEndpoint/$path');
    return _postImpl('$apiEndpoint/$path', headers, body);
  }

  Future<String> _postImpl(String url, Map<String, String> headers, dynamic body) async {
    /*var uri = Uri.parse(url);
    var request = new http.Request("POST", uri)
      ..headers['Ocp-Apim-Subscription-Key'] = "f39e0d015de844eebf61672af275bbd4"
      ..headers['Content-Type'] = "application/octet-stream"
      ..bodyBytes = body;

    var response = await request.send();
    response.stream.transform(utf8.decoder).listen((value) {
      return (value);
    });*/

    final http.Response response = await _client.post(
      url,
      headers: _getHeaders(headers),
      body: body,
      //encoding: Encoding.getByName('utf-8'),
    );

    return _checkResponse(response);
  }

  Map<String, String> _getHeaders(Map<String, String> headers) {
    headers['Content-Type'] = 'application/octet-stream"';
    headers['Ocp-Apim-Subscription-Key'] = 'f39e0d015de844eebf61672af275bbd4';
    return headers;
  }

  String _checkResponse(http.Response response) {
    final String responseBody = utf8.decode(response.bodyBytes);
    print(responseBody);
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

    /*try {
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
    }*/

    // getIt<SimpleLogger>().severe('$code: $message');
    return message;
  }
}
