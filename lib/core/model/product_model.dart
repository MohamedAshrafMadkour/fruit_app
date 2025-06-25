import 'package:fruit_app/core/entity/product_entity.dart';

class ProductModel {
  final String name;
  final num price;
  final String code;
  final String description;
  final String? imageUrl;
  final bool isFeaturedImage;
  final int expirationMonths;
  final bool isOrganic;
  final num numberOfCalories;
  final int unitAmount;

  final num sellingCount;

  ProductModel({
    required this.sellingCount,

    required this.expirationMonths,
    this.isOrganic = false,
    this.numberOfCalories = 0,
    this.unitAmount = 0,
    required this.name,
    required this.price,
    required this.code,
    required this.description,
    this.imageUrl,
    required this.isFeaturedImage,
  });
  ProductEntity toEntity() => ProductEntity(
    name: name,
    price: price,
    code: code,
    description: description,
    imageUrl: imageUrl,
    isFeaturedImage: isFeaturedImage,
    expirationMonths: expirationMonths,
    isOrganic: isOrganic,
    numberOfCalories: numberOfCalories,
    unitAmount: unitAmount,
  );
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    sellingCount: json['sellingCount'],
    name: json['name'],
    price: json['price'],
    code: json['code'],
    description: json['description'],

    imageUrl: json['imageUrl'],
    isFeaturedImage: json['isFeaturedImage'],
    expirationMonths: json['expirationMonths'],
    isOrganic: json['isOrganic'],
    numberOfCalories: json['numberOfCalories'],
    unitAmount: json['unitAmount'],
  );
  Map<String, Object?> toJson() => {
    'name': name,
    'price': price,
    'code': code,
    'description': description,
    'imageUrl': imageUrl,
    'isFeaturedImage': isFeaturedImage,
    'expirationMonths': expirationMonths,
    'isOrganic': isOrganic,
    'numberOfCalories': numberOfCalories,
    'unitAmount': unitAmount,
  };
}
