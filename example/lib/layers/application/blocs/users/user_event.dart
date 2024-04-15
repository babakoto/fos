part of 'user_bloc.dart';

sealed class UserEvent {
  const UserEvent();
}

class OnFindUsersEvent extends UserEvent {}

class OnFindOneUserEvent extends UserEvent {
  final String id;

  OnFindOneUserEvent(this.id);
}
