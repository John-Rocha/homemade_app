import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_app/app/dto/order_product_dto.dart';
import 'package:homemade_app/app/pages/home/bloc/home_state.dart';
import 'package:homemade_app/app/repositories/products/products_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProductsRepository _productRepository;

  HomeCubit(
    this._productRepository,
  ) : super(HomeState.initial());

  Future<void> loadProducts() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      final products = await _productRepository.findAllProducts();
      emit(state.copyWith(products: products, status: HomeStateStatus.loaded));
    } catch (e, s) {
      log('Erro ao carregar os produtos', error: e, stackTrace: s);
      emit(
        state.copyWith(
          status: HomeStateStatus.error,
          errorMessage: 'Erro ao buscar os produtos',
        ),
      );
    }
  }

  Future<void> addOrUpdateBag(OrderProductDto orderProduct) async {
    final shoppingBag = [...state.shoppingBag];

    final orderIndex = shoppingBag.indexWhere(
      (orderP) => orderP.product == orderProduct.product,
    );

    if (orderIndex > -1) {
      if (orderProduct.amount == 0) {
        shoppingBag.removeAt(orderIndex);
      } else {
        shoppingBag[orderIndex] = orderProduct;
      }
    } else {
      shoppingBag.add(orderProduct);
    }

    emit(state.copyWith(shoppingBag: shoppingBag));
  }

  void updateBag(List<OrderProductDto> updadeBag) {
    emit(state.copyWith(shoppingBag: updadeBag));
  }
}
