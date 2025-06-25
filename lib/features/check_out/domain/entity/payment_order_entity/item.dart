import 'package:fruit_app/core/helper/get_currency.dart';
import 'package:fruit_app/features/home/domain/entities/cart_item_entity.dart';

class ItemEntity {
  String? name;
  int? quantity;
  double? price;
  String? currency;

  ItemEntity({this.name, this.quantity, this.price, this.currency});

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'price': price,
    'currency': currency,
  };
  factory ItemEntity.fromEntity(CartItemEntity cartItemEntity) => ItemEntity(
    name: cartItemEntity.product.name,
    quantity: cartItemEntity.quantity,
    price: cartItemEntity.product.price.toDouble(),
    currency: getCurrency(),
  );
}
