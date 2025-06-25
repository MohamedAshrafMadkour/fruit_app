import 'package:bloc/bloc.dart';
import 'package:fruit_app/core/entity/product_entity.dart';
import 'package:fruit_app/core/repo/product_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productRepo) : super(ProductsInitial());
  final ProductRepo productRepo;
  int sum = 0;
  Future<void> getProducts() async {
    emit(ProductsLoading());
    final failureOrProducts = await productRepo.getProducts();
    failureOrProducts.fold(
      (failure) => emit(ProductsFailure(errorMessage: failure.message)),
      (products) {
        sum = products.length;
        emit(ProductsSuccess(products));
      },
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final failureOrProducts = await productRepo.getBestSellingProducts();
    failureOrProducts.fold(
      (failure) => emit(ProductsFailure(errorMessage: failure.message)),
      (products) {
        sum = products.length;
        emit(ProductsSuccess(products));
      },
    );
  }
}
