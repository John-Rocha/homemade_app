import 'package:homemade_app/app/dto/order_product_dto.dart';

class OrderDto {
  final List<OrderProductDto> product;
  final String address;
  final String document;
  final int paymentMethodId;

  OrderDto({
    required this.product,
    required this.address,
    required this.document,
    required this.paymentMethodId,
  });
}
