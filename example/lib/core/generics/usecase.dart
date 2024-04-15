import 'package:fos/fos.dart';

abstract class UseCase<Dto, Result> {
  Future<Fos<Failure, Result>> call({Dto? dto});
}
