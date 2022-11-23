import 'package:fos/fos.dart';

class UnknownException implements Exception {
  final String? message;

  const UnknownException({
    this.message,
  });
}

class UnknownFailure extends Failure {
  const UnknownFailure({
    super.message,
  });
}
