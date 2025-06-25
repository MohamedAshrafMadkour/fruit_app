import 'package:equatable/equatable.dart';
import 'package:fruit_app/core/entity/product_entity.dart';

class CartItemEntity extends Equatable {
  final ProductEntity product;
  int quantity;

  CartItemEntity({required this.product, this.quantity = 0});
  num calculateTotalPrice() {
    return product.price * quantity;
  }

  num increaseQuantity() {
    return quantity++;
  }

  num decreaseQuantity() {
    if (quantity == 1) return quantity;
    return quantity--;
  }

  int calculateTotalWeight() {
    return product.unitAmount * quantity;
  }

  @override
  List<Object?> get props => [product];
}
