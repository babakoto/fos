import 'package:fos/fos.dart';

Fos<Failure, T> exceptionToFailure<T>(e, {StackTrace? trace}) => switch (e) {
      ServerException() => FailureResponse(ServerFailure(message: e.message)),
      NetworkConnectionException() => FailureResponse(NetworkConnectionFailure(message: e.message)),
      UnauthorizedException() => FailureResponse(UnauthorizedFailure(message: e.message)),
      SerializationException() => FailureResponse(SerializationFailure(message: e.message)),
      EmailAlreadyExistException() => FailureResponse(EmailAlreadyExistFailure(message: e.message)),
      WrongPasswordException() => FailureResponse(WrongPasswordFailure(message: e.message)),
      _ => FailureResponse(
          UnknownFailure(
            message: "$e",
          ),
        ),
    };
