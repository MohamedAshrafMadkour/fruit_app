import 'package:fruit_app/core/helper/get_currency.dart';
import 'package:fruit_app/features/check_out/domain/entity/order_entity.dart';

import 'details.dart';

class AmountEntity {
  String? total;
  String? currency;
  DetailsEntity? details;

  AmountEntity({this.total, this.currency, this.details});

  Map<String, dynamic> toJson() => {
    'total': total,
    'currency': currency,
    'details': details?.toJson(),
  };

  factory AmountEntity.fromEntity(OrderEntity entity) {
    return AmountEntity(
      total: entity.calculateTotalPriceAfterDiscountAndShipping().toString(),
      currency: getCurrency(),
      details: DetailsEntity.fromEntity(entity),
    );
  }
}
