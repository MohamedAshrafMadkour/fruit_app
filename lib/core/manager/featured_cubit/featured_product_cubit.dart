import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_app/core/entity/product_entity.dart';
import 'package:fruit_app/core/repo/product_repo.dart';

part 'featured_product_state.dart';

class FeaturedProductCubit extends Cubit<FeaturedProductState> {
  FeaturedProductCubit(this.productRepo) : super(FeaturedProductInitial());
  final ProductRepo productRepo;
  Future<void> featuredProduct() async {
    emit(FeaturedProductLoading());
    final failureOrProducts = await productRepo.featuredProduct();
    failureOrProducts.fold(
      (failure) => emit(FeaturedProductFailure(errorMessage: failure.message)),
      (products) {
        emit(FeaturedProductSuccess(products));
      },
    );
  }
}
