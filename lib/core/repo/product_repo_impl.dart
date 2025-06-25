import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/constants/collection_firebase.dart';

import 'package:fruit_app/core/entity/product_entity.dart';
import 'package:fruit_app/core/error/server_failure.dart';
import 'package:fruit_app/core/model/product_model.dart';

import 'package:fruit_app/core/repo/product_repo.dart';
import 'package:fruit_app/core/services/database_service.dart';

class ProductRepoImpl extends ProductRepo {
  final DatabaseService databaseService;

  ProductRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var result =
          await databaseService.getData(
                path: CollectionFirebase.getProductEndPoint,
                query: {
                  'limit': 10,
                  'orderBy': 'sellingCount',
                  'descending': true,
                },
              )
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = result.map((e) {
        return ProductModel.fromJson(e).toEntity();
      }).toList();
      return Right(products);
    } catch (e) {
      return Left(ServerFailure(message: 'حدث خطا اثناء عرض البيانات'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var result =
          await databaseService.getData(
                path: CollectionFirebase.getProductEndPoint,
              )
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = result.map((e) {
        return ProductModel.fromJson(e).toEntity();
      }).toList();
      return Right(products);
    } catch (e) {
      return Left(ServerFailure(message: 'حدث خطا اثناء عرض البيانات'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> featuredProduct() async {
    try {
      var result =
          await databaseService.getData(
                path: CollectionFirebase.getProductEndPoint,
                query: {
                  'limit': 10,
                  'descending': false,
                  'orderBy': 'name',
                  'where': [
                    {'field': 'isFeaturedImage', 'isEqualTo': true},
                  ],
                },
              )
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = result.map((e) {
        return ProductModel.fromJson(e).toEntity();
      }).toList();
      return Right(products);
    } catch (e) {
      return Left(ServerFailure(message: 'حدث خطا اثناء عرض البيانات'));
    }
  }
}
