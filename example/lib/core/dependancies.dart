import 'package:dio/dio.dart';
import 'package:example/layers/data/services/clients/interceptor/decoder_inteceptor.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'dependancies.config.dart';

final getIt = GetIt.instance;

final dio = Dio(
  BaseOptions(
    baseUrl: 'https://661c23e8e7b95ad7fa69cc50.mockapi.io/api/v1',
    contentType: 'application/json',
  ),
);
@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() {
  dio.interceptors.add(AppInterceptors());
  getIt.registerSingleton(dio);

  getIt.init();
}
