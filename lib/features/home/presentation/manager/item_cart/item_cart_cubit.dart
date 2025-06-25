import 'package:bloc/bloc.dart';
import 'package:fruit_app/core/entity/product_entity.dart';
import 'package:fruit_app/features/home/domain/entities/cart_entity.dart';
import 'package:fruit_app/features/home/domain/entities/cart_item_entity.dart';
import 'package:meta/meta.dart';

part 'item_cart_state.dart';

class ItemCartCubit extends Cubit<ItemCartState> {
  ItemCartCubit() : super(ItemCartInitial());
  CartEntity cartEntity = CartEntity(cartList: []);
  void addItemToCart(ProductEntity productEntity) {
    bool isItemExisted = cartEntity.isItemExisted(productEntity);
    var cart = cartEntity.getItem(productEntity);
    if (isItemExisted) {
      cart.increaseQuantity();
    } else {
      cartEntity.cartList.add(
        CartItemEntity(quantity: 1, product: productEntity),
      );
    }
    emit(ItemCartAdded());
  }

  void removeItem(CartItemEntity cartItemEntity) {
    cartEntity.removeItem(cartItemEntity);
    emit(ItemCartRemoved());
  }
}
