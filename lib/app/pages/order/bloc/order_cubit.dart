import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_app/app/dto/order_product_dto.dart';
import 'package:homemade_app/app/pages/order/bloc/order_state.dart';
import 'package:homemade_app/app/repositories/order/order_repository.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepository _orderRepository;

  OrderCubit({required OrderRepository orderRepository})
      : _orderRepository = orderRepository,
        super(const OrderState.initial());

  Future<void> load(List<OrderProductDto> products) async {
    emit(state.copyWith(status: OrderStatus.loading));

    try {
      final paymentTypes = await _orderRepository.getAllPaymentsTypes();

      emit(state.copyWith(
        orderProducts: products,
        status: OrderStatus.loaded,
        paymentTypes: paymentTypes,
      ));
    } catch (e, s) {
      log('Erro ao carregar página', error: e, stackTrace: s);
      emit(
        state.copyWith(
          status: OrderStatus.error,
          errorMessage: 'Erro ao carregar página',
        ),
      );
    }
  }
}
