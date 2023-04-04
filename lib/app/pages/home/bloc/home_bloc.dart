import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_app/app/pages/home/bloc/home_state.dart';
import 'package:homemade_app/app/repositories/products/products_repository.dart';

class HomeBloc extends Cubit<HomeState> {
  final ProductsRepository _productRepository;

  HomeBloc(
    this._productRepository,
  ) : super(HomeState.initial());

  Future<void> loadProducts() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      final products = await _productRepository.findAllProducts();
      throw Exception();
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
}
