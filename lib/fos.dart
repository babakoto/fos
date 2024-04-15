library fos;

import 'package:equatable/equatable.dart';
import 'package:fos/errors/exceptions.dart';
import 'package:fos/errors/failures.dart';

export 'package:fos/errors/exceptions.dart';
export 'package:fos/errors/failures.dart';
export 'package:fos/fos.dart';
export 'package:fos/utils/utils.dart';

/// FOS = Failure or Success

typedef Success<R> = Future<Fos<Failure, R>>;

abstract class Fos<F extends Failure, S> {
  static Map<Object, Failure> get errors => _errors;
  static initErrors(Map<Object, Failure> errors) => _errors = errors;
  static Map<Object, Failure> _errors = {
    const FormatException(): const SerializationFailure(),
    const EmailAlreadyExistException(): const EmailAlreadyExistFailure(),
    const WrongPasswordException(): const WrongPasswordFailure(),
    const NetworkConnectionException(): const NetworkConnectionFailure(),
    const UnauthorizedException(): const UnauthorizedFailure(),
    const ServerException(): const ServerFailure(),
    const SerializationException(): const SerializationFailure(),
    const UnknownException(): const UnknownFailure(),
  };
  const Fos();

  factory Fos.failure(F failure) => _Failure(failure);

  factory Fos.success(S success) => _Success(success);

  static Future<Fos<Failure, R>> toFailure<R>(Object exception) async {
    final failure = errors.entries.firstWhere((element) => element.key == exception).value;
    return Fos.failure(failure);
  }

  bool get isError;

  bool get isSuccess;

  Result on<Result>(
    Result Function(F failure) onFailure,
    Result Function(S success) onSuccess,
  );
  dynamic get get;
}

class _Failure<F extends Failure, S> extends Fos<F, S> {
  final F _failure;

  const _Failure(this._failure);

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
  bool operator ==(Object other) => other is _Failure && other._failure == _failure;
}

class _Success<F extends Failure, S> extends Fos<F, S> {
  final S _success;

  const _Success(this._success);

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
  bool operator ==(Object other) => other is _Success && other._success == _success;
}

abstract class Failure extends Equatable {
  final String? message;
  final int? code;

  const Failure({
    this.message,
    this.code,
  });

  @override
  List<Object?> get props => [message, code];
}
