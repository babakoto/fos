import 'package:fos/failure.dart';

class UnauthorizedException implements Exception {
  final String? message;
  final String? error;

  const UnauthorizedException({
    this.message,
    this.error,
  });
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({
    super.message,
    super.code,
  });
}
