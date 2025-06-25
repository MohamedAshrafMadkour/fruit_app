import 'package:fruit_app/features/check_out/domain/entity/shipping_address_entity.dart';
import 'package:fruit_app/features/home/domain/entities/cart_entity.dart';

class OrderEntity {
  final String uId;
  final CartEntity cartEntity;
  final String? status;
  bool? isPaypal;
  ShippingAddressEntity? shippingAddress;
  OrderEntity({
    this.isPaypal,
    this.status,
    required this.cartEntity,
    this.shippingAddress,
    required this.uId,
  });

  int calculateDiscount() {
    return 0;
  }

  double calculateShipping() {
    if (isPaypal == true) {
      return 30;
    } else {
      return 0;
    }
  }

  double calculateTotalPriceAfterDiscountAndShipping() {
    return cartEntity.calculateTotalPrice() +
        calculateShipping() -
        calculateDiscount();
  }

  @override
  String toString() {
    return 'OrderEntity{uID: $uId, cartEntity: $cartEntity, payWithCash: $isPaypal, shippingAddressEntity: $shippingAddress}';
  }
}
