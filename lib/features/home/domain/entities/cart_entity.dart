import 'package:fruit_app/core/entity/product_entity.dart';
import 'package:fruit_app/features/home/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartList;

  CartEntity({required this.cartList});

  void addItem(CartItemEntity cartItemEntity) {
    cartList.add(cartItemEntity);
  }

  bool isItemExisted(ProductEntity productEntity) {
    for (var item in cartList) {
      if (item.product == productEntity) {
        return true;
      }
    }
    return false;
  }

  void removeItem(CartItemEntity cartItemEntity) {
    cartList.remove(cartItemEntity);
  }

  double calculateTotalPrice() {
    double price = 0;
    for (var item in cartList) {
      price += item.calculateTotalPrice();
    }
    return price;
  }

  CartItemEntity getItem(ProductEntity productEntity) {
    for (var item in cartList) {
      if (item.product == productEntity) {
        return item;
      }
    }
    return CartItemEntity(quantity: 1, product: productEntity);
  }
}
