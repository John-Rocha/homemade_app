import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:homemade_app/app/core/exceptions/repository_exception.dart';
import 'package:homemade_app/app/core/rest_client/custom_dio.dart';
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
}
