import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/error/server_failure.dart';
import 'package:fruit_app/features/check_out/domain/entity/order_entity.dart';

abstract class OrderRepo {
  Future<Either<Failure, void>> addOrder({required OrderEntity orderEntity});
}
