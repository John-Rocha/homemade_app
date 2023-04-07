import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:homemade_app/app/core/exceptions/repository_exception.dart';
import 'package:homemade_app/app/core/rest_client/custom_dio.dart';
import 'package:homemade_app/app/dto/order_dto.dart';
import 'package:homemade_app/app/models/payment_type_model.dart';

import './order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final CustomDio dio;

  OrderRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<PaymentTypeModel>> getAllPaymentsTypes() async {
    try {
      final result = await dio.auth().get('/payment-types');
      return result.data
          .map<PaymentTypeModel>(
            (p) => PaymentTypeModel.fromJson(p),
          )
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar formas de pagamentos', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar formas de pagamento');
    }
  }

  @override
  Future<void> saveOrder(OrderDto order) async {
    try {
      await dio.auth().post('/orders', data: {
        'products': order.product
            .map((p) => {
                  'id': p.product.id,
                  'amount': p.amount,
                  'total_price': p.totalPrice,
                })
            .toList(),
        'user_id': '#userAuthRef',
        'address': order.address,
        'CPF': order.document,
        'payment_method_id': order.paymentMethodId,
      });
    } on DioError catch (e, s) {
      log(
        'Erro ao registrar pedido',
        error: e,
        stackTrace: s,
      );

      throw RepositoryException(message: 'Erro ao resgitrar pedido');
    }
  }
}
