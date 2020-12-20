class EndpointsException implements Exception {
  EndpointsException(
    this.code,
    this.message,
  );

  final int code;
  final String message;
}

class UnauthorizedException extends EndpointsException {
  UnauthorizedException([String message = 'Unauthorised']) : super(401, message);
}
