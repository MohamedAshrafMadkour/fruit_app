import 'package:bloc/bloc.dart';
import 'package:fruit_app/features/home/domain/entities/cart_item_entity.dart';

part 'update_item_state.dart';

class UpdateItemCubit extends Cubit<UpdateItemState> {
  UpdateItemCubit() : super(UpdateItemInitial());

  void updateItem(CartItemEntity carItemEntity) {
    emit(UpdateItemSuccess(cartItemEntity: carItemEntity));
  }
}
