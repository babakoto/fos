import 'package:fos/fos.dart';

extension ExceptionToFailure on Exception {
  FailureResponse<Failure, dynamic> toFailure() {
    return FailureResponse(
      _mapExceptions[runtimeType] ?? UnknownFailure(message: "$this"),
    );
  }
}

void setMapExceptions(Map<Type, Failure> map) {
  _mapExceptions.addAll(map);
}

const Map<Type, Failure> _mapExceptions = {
  ServerException: ServerFailure(),
  NetworkConnectionException: NetworkConnectionFailure(),
  UnauthorizedException: UnauthorizedFailure(),
  SerializationException: SerializationFailure(),
  EmailAlreadyExistException: EmailAlreadyExistFailure(),
  WrongPasswordException: WrongPasswordFailure(),
};

Fos<Failure, T> exceptionToFailure<T>(dynamic e, {StackTrace? trace}) {
  return e.toFailure();
}
