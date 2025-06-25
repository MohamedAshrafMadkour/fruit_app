part of 'featured_product_cubit.dart';

sealed class FeaturedProductState extends Equatable {
  const FeaturedProductState();

  @override
  List<Object> get props => [];
}

final class FeaturedProductInitial extends FeaturedProductState {}

final class FeaturedProductLoading extends FeaturedProductState {}

final class FeaturedProductSuccess extends FeaturedProductState {
  final List<ProductEntity> products;

  const FeaturedProductSuccess(this.products);
}

final class FeaturedProductFailure extends FeaturedProductState {
  final String errorMessage;

  const FeaturedProductFailure({required this.errorMessage});
}
