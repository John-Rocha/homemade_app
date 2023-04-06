import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_app/app/dto/order_product_dto.dart';
import 'package:homemade_app/app/pages/order/bloc/order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderState.initial());

  void load(List<OrderProductDto> products) {
    emit(state.copyWith(orderProducts: products));
  }
}
