class Exceptions implements Exception {
  final String? message;
  final int? error;

  const Exceptions({
    this.message,
    this.error,
  });
}

class NetworkConnectionException extends Exceptions {}
