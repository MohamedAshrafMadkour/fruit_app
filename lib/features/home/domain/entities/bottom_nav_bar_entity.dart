import 'package:fruit_app/core/util/app_image.dart';

class BottomNavBarEntity {
  final String activeImage, inactiveImage;
  final String name;

  BottomNavBarEntity({
    required this.activeImage,
    required this.inactiveImage,
    required this.name,
  });
}

List<BottomNavBarEntity> get bottomNavBarItems => [
  BottomNavBarEntity(
    activeImage: Assets.imagesBoldHome,
    inactiveImage: Assets.imagesOutlinedHome,
    name: 'الرئسية',
  ),
  BottomNavBarEntity(
    activeImage: Assets.imagesBoldProduct,
    inactiveImage: Assets.imagesOutlinedProduct,
    name: 'المنتجات',
  ),
  BottomNavBarEntity(
    activeImage: Assets.imagesBoldShoppingCart,
    inactiveImage: Assets.imagesOutlinedShoppingCart,
    name: 'سلة التسوق',
  ),
];
