import 'package:fos/fos.dart';

/// Should be return [NetworkConnectionFailure] when layer
/// data throw [NetworkConnectionException].
class NetworkConnectionFailure extends Failure {
  const NetworkConnectionFailure({
    super.message,
  });
}

/// Should be return [ServerFailure] when layer data throw [ServerException].
class ServerFailure extends Failure {
  const ServerFailure({
    super.message,
    super.code,
  });
}

/// Should be return [UnknownFailure] when layer data throw [UnknownException].
class UnknownFailure extends Failure {
  const UnknownFailure({
    super.message,
  });
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({
    super.message,
    super.code,
  });
}

class SerializationFailure extends Failure {
  const SerializationFailure({
    super.message,
  });
}

class EmailAlreadyExistFailure extends Failure {
  const EmailAlreadyExistFailure({
    super.message,
  });
}

class WrongPasswordFailure extends Failure {
  const WrongPasswordFailure({
    super.message,
  });
}
