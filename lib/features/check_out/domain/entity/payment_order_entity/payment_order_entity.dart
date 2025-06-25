import 'package:fruit_app/features/check_out/domain/entity/order_entity.dart';

import 'amount.dart';
import 'item_list.dart';

class PaymentOrderEntity {
  AmountEntity? amount;
  String? description;
  ItemListEntity? itemList;

  PaymentOrderEntity({this.amount, this.description, this.itemList});

  Map<String, dynamic> toJson() => {
    'amount': amount?.toJson(),
    'description': description,
    'item_list': itemList?.toJson(),
  };

  factory PaymentOrderEntity.fromEntity(OrderEntity orderEntity) =>
      PaymentOrderEntity(
        amount: AmountEntity.fromEntity(orderEntity),
        description: 'The payment transaction description.',
        itemList: ItemListEntity.fromEntity(orderEntity),
      );
}
