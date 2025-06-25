import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_app/features/check_out/domain/entity/order_entity.dart';
import 'package:fruit_app/features/check_out/domain/repo/order_repo.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.orderRepo) : super(AddOrderInitial());
  final OrderRepo orderRepo;

  Future<void> addOrder(OrderEntity orderEntity) async {
    emit(AddOrderLoading());
    final failureOrOrder = await orderRepo.addOrder(orderEntity: orderEntity);
    failureOrOrder.fold(
      (failure) => emit(AddOrderFailure(error: failure.message)),
      (order) => emit(AddOrderSuccess()),
    );
  }
}
