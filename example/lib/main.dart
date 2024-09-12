import 'dart:math';

import 'package:fos/fos.dart';

/// create new Exception class [CustomAException]
/// and [CustomBException]
/// you can add more exceptions or use the default exceptions
/// like [UnknownException], [NetworkConnectionException], [ServerException] etc.

class CustomAException extends Exceptions {
  const CustomAException({
    super.message,
    super.error,
  });
}

class CustomBException extends Exceptions {
  const CustomBException({
    super.message,
    super.error,
  });
}

/// create new Failure class
class CustomAFailure extends Failure {
  const CustomAFailure({
    super.message,
  });
}

class CustomBFailure extends Failure {
  const CustomBFailure({
    super.message,
  });
}

void main() async {
  /// init Exceptions and Failures mapping
  /// you can add more errors
  Fos.initErrors({
    const CustomAException(): const CustomAFailure(),
    const CustomBException(): const CustomBFailure(),
    const UnknownException(): const UnknownFailure(),
  });

  final result = await getNumberRepository();

  result.on((failure) {
    print('❌ $failure');

    /// you can use this method to get the error message
  }, (success) {
    print('✅ $success');

    /// you can use this method to get the data
  });
}

/// Repositories
Success<int> getNumberRepository() async {
  try {
    final number = getNumberServices();
    return Fos.success(number);
  } catch (e) {
    /// you can use this method to convert exception to failure
    /// or return Failure object
    /// example:
    /// Fos.failure(NetworkConnectionFailure());
    /// Fos.failure(ServerFailure());
    /// Fos.failure(UnknownFailure());
    /// Fos.failure(NotFoundFailure());
    return Fos.toFailure(e);
  }
}

/// Services
int getNumberServices() {
  try {
    /// random 1 or 0
    final random = Random().nextInt(3);
    if (random == 0) {
      throw const CustomAException();
    } else if (random == 1) {
      throw const CustomBException();
    } else {
      return random;
    }
  } catch (e) {
    rethrow;
  }
}
