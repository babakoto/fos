import 'package:fos/failure.dart';

class NetworkException implements Exception {
  final String? message;

  const NetworkException({
    this.message,
  });
}

class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message,
  });
}
