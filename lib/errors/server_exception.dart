import 'package:fos/failure.dart';

class ServerException implements Exception {
  final String? message;
  final String? error;

  const ServerException({
    this.message,
    this.error,
  });
}

class ServerFailure extends Failure {
  const ServerFailure({
    super.message,
    super.code,
  });
}
