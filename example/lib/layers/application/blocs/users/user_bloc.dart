import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:example/layers/application/blocs/status_bloc.dart';
import 'package:example/layers/domain/entities/user_entity.dart';
import 'package:example/layers/domain/repositories/repository.dart';
import 'package:example/layers/domain/repositories/users/find_user.dart';
import 'package:fos/fos.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final FindUsers getMany;
  final Repository<UserEntity, String> getOne;
  UserBloc(this.getMany, this.getOne) : super(const UserState()) {
    on<OnFindUsersEvent>(_onFindUsersEvent);
    on<OnFindOneUserEvent>(_onFindOneUserEvent);
  }

  FutureOr<void> _onFindUsersEvent(OnFindUsersEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: StatusBloc.loading));
    final result = await getMany();
    result.on((failure) {
      log("Failure: $failure", name: "❌ UserBloc");
      emit(state.copyWith(failure: failure, status: StatusBloc.failure));
    }, (users) {
      log("success: $users", name: "✅ UserBloc");
      emit(state.copyWith(status: StatusBloc.success, users: users));
    });
  }

  FutureOr<void> _onFindOneUserEvent(OnFindOneUserEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: StatusBloc.loading));
    final result = await getOne(params: event.id);
    result.on((failure) {
      print("Failure: $failure");
      emit(state.copyWith(failure: failure, status: StatusBloc.failure));
    }, (user) {
      print("success: $user");
      emit(state.copyWith(status: StatusBloc.success, user: user));
    });
  }
}
