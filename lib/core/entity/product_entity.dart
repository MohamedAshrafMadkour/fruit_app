import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String name;
  final num price;
  final String code;
  final String description;
  String? imageUrl;
  final bool isFeaturedImage;
  final int expirationMonths;
  final bool isOrganic;
  final num numberOfCalories;
  final int unitAmount;

  ProductEntity({
    required this.expirationMonths,
    this.isOrganic = false,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.name,
    required this.price,
    required this.code,
    required this.description,

    this.imageUrl,
    required this.isFeaturedImage,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [code];
}
