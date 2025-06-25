import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/entity/product_entity.dart';
import 'package:fruit_app/core/error/server_failure.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> featuredProduct();
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
}
