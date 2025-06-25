import 'package:fruit_app/features/home/domain/entities/cart_item_entity.dart';

class ProductOrderModel {
  final String name;
  final String code;
  final String imageUrl;
  final double price;
  final int quantity;

  ProductOrderModel({
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  factory ProductOrderModel.fromEntity(CartItemEntity cartItemEntity) {
    return ProductOrderModel(
      name: cartItemEntity.product.name,
      code: cartItemEntity.product.code,
      imageUrl: cartItemEntity.product.imageUrl!,
      price: cartItemEntity.product.price.toDouble(),
      quantity: cartItemEntity.quantity,
    );
  }
  Map<String, Object> toJson() {
    return {'name': name, 'code': code, 'imageUrl': imageUrl, 'price': price};
  }
}
