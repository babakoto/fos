import 'package:example/layers/domain/entities/product_entity.dart';
import 'package:example/layers/domain/repositories/repository.dart';

abstract class ProductRepository extends Repository<ProductEntity, int> {}
