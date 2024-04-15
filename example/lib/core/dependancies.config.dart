// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../layers/data/repositories/users/user_repository_imp.dart' as _i7;
import '../layers/data/services/clients/rest/endpoints/users_endpoint.dart'
    as _i5;
import '../layers/data/services/clients/rest/method/client_api.dart' as _i3;
import '../layers/domain/entities/user_entity.dart' as _i4;
import '../layers/domain/repositories/repository.dart' as _i8;
import '../layers/domain/repositories/users/find_user.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.Finds<_i4.UserEntity, String>>(() => _i5.ManyUsers());
    gh.lazySingleton<_i6.FindUsers>(
        () => _i7.FindUsersImp(gh<_i3.Finds<_i4.UserEntity, String>>()));
    gh.lazySingleton<_i3.ReadOnly<_i4.UserEntity>>(() => _i5.UsersEndpoint());
    gh.lazySingleton<_i3.Find<_i4.UserEntity, String>>(() => _i5.OneUsers());
    gh.lazySingleton<_i8.Repository<_i4.UserEntity, String>>(
        () => _i7.FindOneUserImp(gh<_i3.Find<_i4.UserEntity, String>>()));
    return this;
  }
}
