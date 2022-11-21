import 'package:equatable/equatable.dart';

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
