import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/constants/collection_firebase.dart';
import 'package:fruit_app/core/error/server_failure.dart';
import 'package:fruit_app/core/services/database_service.dart';
import 'package:fruit_app/features/check_out/data/models/order_model.dart';
import 'package:fruit_app/features/check_out/domain/entity/order_entity.dart';
import 'package:fruit_app/features/check_out/domain/repo/order_repo.dart';

class OrderRepoImpl extends OrderRepo {
  final DatabaseService databaseService;

  OrderRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, void>> addOrder({
    required OrderEntity orderEntity,
  }) async {
    try {
      var orderModel = OrderModel.fromEntity(orderEntity);
      await databaseService.addData(
        path: CollectionFirebase.addOrder,
        documentId: orderModel.orderId,
        data: orderModel.toJson(),
      );
      return const Right(null);
    } catch (e) {
      log(e.toString());
      return Left(
        ServerFailure(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.'),
      );
    }
  }
}
