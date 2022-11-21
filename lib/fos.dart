library fos;

import 'package:fos/failure.dart';

/// FOS = Failure or Success
abstract class Fos<F extends Failure, S> {
  const Fos();

  bool get isError;

  bool get isSuccess;

  Result on<Result>(
    Result Function(F failure) onFailure,
    Result Function(S success) onSuccess,
  );

  dynamic get get;
}

class FailureResponse<F extends Failure, S> extends Fos<F, S> {
  final F _failure;

  const FailureResponse(this._failure);

  @override
  get get => _failure;

  @override
  bool get isError => true;

  @override
  bool get isSuccess => false;

  @override
  Result on<Result>(
    Result Function(F failure) onFailure,
    Result Function(S success) onSuccess,
  ) {
    return onFailure(_failure);
  }

  @override
  int get hashCode => _failure.hashCode;

  @override
  bool operator ==(Object other) =>
      other is FailureResponse && other._failure == _failure;
}

class SuccessResponse<F extends Failure, S> extends Fos<F, S> {
  final S _success;

  const SuccessResponse(this._success);

  @override
  get get => _success;

  @override
  bool get isError => false;

  @override
  bool get isSuccess => true;

  @override
  R on<R>(R Function(F failure) onFailure, R Function(S success) onSuccess) {
    return onSuccess(_success);
  }

  @override
  int get hashCode => _success.hashCode;

  @override
  bool operator ==(Object other) =>
      other is SuccessResponse && other._success == _success;
}
