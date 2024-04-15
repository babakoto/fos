import 'package:equatable/equatable.dart';

class RegisterDto extends Equatable {
  final String? email;
  final String? password;

  const RegisterDto({
    this.email,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory RegisterDto.fromMap(Map<String, dynamic> map) {
    return RegisterDto(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  @override
  List<Object?> get props => [email, password];
}
