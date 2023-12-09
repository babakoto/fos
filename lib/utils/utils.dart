import 'package:fos/fos.dart';

extension ExceptionToFailure on Exception {
  FailureResponse<Failure, dynamic> toFailure() {
    return FailureResponse(
      mapExceptions[runtimeType] ?? UnknownFailure(message: "$this"),
    );
  }
}

void setMapExceptions(Map<Type, Failure> map) {
  mapExceptions.addAll(map);
}

const Map<Type, Failure> mapExceptions = {
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
