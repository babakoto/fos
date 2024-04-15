import 'package:example/layers/data/services/clients/rest/method/client_api.dart';
import 'package:example/layers/domain/entities/user_entity.dart';
import 'package:example/layers/domain/repositories/repository.dart';
import 'package:example/layers/domain/repositories/users/find_user.dart';
import 'package:fos/fos.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FindUsers)
class FindUsersImp implements FindUsers {
  final Finds<UserEntity, String> findUsers;

  const FindUsersImp(this.findUsers);

  @override
  Success<List<UserEntity>> call({String? params}) async {
    try {
      final users = await findUsers(params);
      return Fos.success(users);
    } catch (e) {
      return Fos.toFailure(e);
    }
  }
}

@LazySingleton(as: Repository<UserEntity, String>)
class FindOneUserImp implements Repository<UserEntity, String> {
  final Find<UserEntity, String> oneUsers;

  const FindOneUserImp(this.oneUsers);

  @override
  Success<UserEntity> call({String? params}) async {
    try {
      final user = await oneUsers("$params");
      return Fos.success(user);
    } catch (e) {
      return Fos.toFailure(e);
    }
  }
}
