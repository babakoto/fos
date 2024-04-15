import 'package:equatable/equatable.dart';

class Exceptions extends Equatable implements Exception {
  final String? message;
  final int? error;

  const Exceptions({
    this.message,
    this.error,
  });

  @override
  List<Object?> get props => [message, error];
}

class NetworkConnectionException extends Exceptions {
  const NetworkConnectionException({
    super.message,
    super.error,
  });
}

class ServerException extends Exceptions {
  const ServerException({
    super.message,
    super.error,
  });
}

/// should throw [UnknownException] when Exception not found.
/// Example:
/// Future<void> fetchUser() async {
///  try {
///  final response = await http.get(Uri.parse('https://example.com/whatsit/create'));
///  } catch (e) {
///  throw UnknownException(message: e.toString());
///  }
class UnknownException extends Exceptions {
  const UnknownException({
    super.message,
    super.error,
  });
}

class UnauthorizedException extends Exceptions {
  const UnauthorizedException({
    super.message,
    super.error,
  });
}

class SerializationException extends Exceptions {
  final StackTrace? track;

  const SerializationException({
    super.message,
    this.track,
  });
}

class EmailAlreadyExistException extends Exceptions {
  const EmailAlreadyExistException({
    super.message,
    super.error,
  });
}

class WrongPasswordException extends Exceptions {
  const WrongPasswordException({super.error, super.message});
}
