part of 'update_item_cubit.dart';

sealed class UpdateItemState {
  const UpdateItemState();
}

final class UpdateItemInitial extends UpdateItemState {}

final class UpdateItemSuccess extends UpdateItemState {
  final CartItemEntity cartItemEntity;

  const UpdateItemSuccess({required this.cartItemEntity});
}
