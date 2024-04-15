part of 'user_bloc.dart';

class UserState extends Equatable {
  final StatusBloc status;
  final Failure? failure;
  final List<UserEntity> users;
  final UserEntity? user;

  const UserState({
    this.failure,
    this.status = StatusBloc.initial,
    this.users = const [],
    this.user,
  });

  @override
  List<Object?> get props => [
        status,
        users,
        user,
        failure,
      ];

  UserState copyWith({
    StatusBloc? status,
    List<UserEntity>? users,
    UserEntity? user,
    Failure? failure,
  }) {
    return UserState(
      status: status ?? this.status,
      users: users ?? this.users,
      user: user ?? this.user,
      failure: failure ?? this.failure,
    );
  }
}
