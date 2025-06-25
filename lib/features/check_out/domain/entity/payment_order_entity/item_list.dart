import 'package:fruit_app/features/check_out/domain/entity/order_entity.dart';

import 'item.dart';

class ItemListEntity {
  List<ItemEntity>? items;

  ItemListEntity({this.items});

  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
  };
  factory ItemListEntity.fromEntity(OrderEntity orderEntity) => ItemListEntity(
    items: orderEntity.cartEntity.cartList
        .map((e) => ItemEntity.fromEntity(e))
        .toList(),
  );
}
