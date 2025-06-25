import 'package:fruit_app/features/check_out/data/models/product_order_model.dart';
import 'package:fruit_app/features/check_out/data/models/shipping_address_model.dart';
import 'package:fruit_app/features/check_out/domain/entity/order_entity.dart';
import 'package:uuid/uuid.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddress;
  final List<ProductOrderModel> productOrderModel;
  final String paymentMethod;

  final String orderId;
  OrderModel({
    required this.orderId,

    required this.paymentMethod,
    required this.totalPrice,
    required this.uId,
    required this.shippingAddress,
    required this.productOrderModel,
  });
  factory OrderModel.fromEntity(OrderEntity orderEntity) => OrderModel(
    orderId: const Uuid().v4(),

    paymentMethod: orderEntity.isPaypal! ? 'Cash' : 'Paypal',
    totalPrice: orderEntity.cartEntity.calculateTotalPrice(),
    uId: orderEntity.uId,
    shippingAddress: ShippingAddressModel.fromEntity(
      orderEntity.shippingAddress!,
    ),
    productOrderModel: orderEntity.cartEntity.cartList
        .map((e) => ProductOrderModel.fromEntity(e))
        .toList(),
  );
  Map<String, Object> toJson() {
    return {
      'orderId': orderId,
      'status': 'pending',
      'paymentMethod': paymentMethod,
      'totalPrice': totalPrice,
      'date': DateTime.now().toString(),
      'uId': uId,
      'shippingAddress': shippingAddress.toJson(),
      'productOrderModel': productOrderModel.map((e) => e.toJson()).toList(),
    };
  }
}
