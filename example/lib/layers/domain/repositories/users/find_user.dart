import 'package:example/layers/domain/entities/user_entity.dart';
import 'package:example/layers/domain/repositories/repository.dart';

abstract class FindUsers extends Repository<List<UserEntity>, String> {}

abstract class FindUser extends Repository<UserEntity, int> {}
