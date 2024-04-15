import 'package:example/core/mixing/method_mixin.dart';
import 'package:example/layers/data/services/clients/rest/method/client_api.dart';
import 'package:example/layers/domain/entities/user_entity.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: Finds<UserEntity, String>)
class ManyUsers with Get<UserEntity> implements Finds<UserEntity, String> {
  @override
  Future<List<UserEntity>> call(String? path) async {
    try {
      final users = await get("/users", UserEntity.fromMap);
      return users;
    } catch (e) {
      rethrow;
    }
  }
}

@LazySingleton(as: Find<UserEntity, String>)
class OneUsers with Get<UserEntity> implements Find<UserEntity, String> {
  @override
  Future<UserEntity> call(String? path) async {
    try {
      final user = await get("/users/$path", UserEntity.fromMap);
      return user;
    } catch (e) {
      rethrow;
    }
  }
}

@LazySingleton(as: ReadOnly<UserEntity>)
class UsersEndpoint with Get<UserEntity> implements ReadOnly<UserEntity> {
  @override
  Future<UserEntity> read(String path) async {
    try {
      final user = await get("/users", UserEntity.fromMap);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<UserEntity>> reads(String path) async {
    try {
      final users = await reads("/users");
      return users;
    } catch (e) {
      rethrow;
    }
  }
}
