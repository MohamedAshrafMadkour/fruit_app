import 'package:fruit_app/core/entity/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: 'Apple',
    code: '123',
    description: 'Fresh apple',
    price: 2.5,

    expirationMonths: 6,
    numberOfCalories: 100,
    unitAmount: 1,
    isOrganic: true,
    isFeaturedImage: true,
    imageUrl: null,
  );
}

List<ProductEntity> getDummyProductsList() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}

ProductEntity getDummyFeaturedProduct() {
  return ProductEntity(
    name: 'Banana',
    code: '456',
    description: 'Delicious banana',
    price: 1.5,
    expirationMonths: 3,
    numberOfCalories: 90,
    unitAmount: 1,
    isOrganic: false,
    isFeaturedImage: true,
    imageUrl: null,
  );
}

List<ProductEntity> getDummyFeaturedProductsList() {
  return [
    getDummyFeaturedProduct(),
    getDummyFeaturedProduct(),
    getDummyFeaturedProduct(),
    getDummyFeaturedProduct(),
    getDummyFeaturedProduct(),
    getDummyFeaturedProduct(),
    getDummyFeaturedProduct(),
    getDummyFeaturedProduct(),
  ];
}
