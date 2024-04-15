import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class UserEntity extends Equatable {
  final String id;
  final String name;
  final String createdAt;
  final String avatar;

  const UserEntity({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.avatar,
  });

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    try {
      return UserEntity(
        id: map['id'],
        name: map['name'],
        avatar: map['avatar'],
        createdAt: map['createdAt'],
      );
    } catch (e, trace) {
      throw const FormatException('Invalid format');
    }
  }

  @override
  List<Object> get props => [id, name, createdAt, avatar];
}
