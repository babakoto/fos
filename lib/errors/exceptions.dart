class NetworkConnectionException implements Exception {
  final String? message;

  const NetworkConnectionException({
    this.message,
  });
}

class ServerException implements Exception {
  final String? message;
  final int? error;

  const ServerException({
    this.message,
    this.error,
  });
}

/// should throw [UnknownException] when Exception not found.
/// Example:
/// Future<void> fetchUser() async {
///  try {
///  final response = await http.get(Uri.parse('https://example.com/whatsit/create'));
///  } catch (e) {
///  throw UnknownException(message: e.toString());
///  }
class UnknownException implements Exception {
  final String? message;

  const UnknownException({
    this.message,
  });
}

class UnauthorizedException implements Exception {
  final String? message;
  final int? error;
  const UnauthorizedException({
    this.message,
    this.error,
  });
}

class SerializationException implements Exception {
  final String? message;
  final StackTrace? track;

  const SerializationException({
    this.message,
    this.track,
  });
}

class EmailAlreadyExistException implements Exception {
  final String message;

  const EmailAlreadyExistException({
    required this.message,
  });
}

class WrongPasswordException implements Exception {
  final String message;
  final String? track;

  const WrongPasswordException({this.message = "ERROR.incorrect-login", this.track});
}
