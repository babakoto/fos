import 'package:fos/fos.dart';

abstract class Repository<T, P> {
  Success<T> call({P? params});
}
