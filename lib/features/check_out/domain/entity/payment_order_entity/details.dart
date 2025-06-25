import 'package:fruit_app/features/check_out/domain/entity/order_entity.dart';

class DetailsEntity {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  DetailsEntity({this.subtotal, this.shipping, this.shippingDiscount});

  Map<String, dynamic> toJson() => {
    'subtotal': subtotal,
    'shipping': shipping,
    'shipping_discount': shippingDiscount,
  };
  factory DetailsEntity.fromEntity(OrderEntity orderEntity) => DetailsEntity(
    subtotal: orderEntity.cartEntity.calculateTotalPrice().toString(),
    shipping: orderEntity.calculateShipping().toString(),
    shippingDiscount: orderEntity.calculateDiscount(),
  );
}
