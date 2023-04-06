import 'package:json_annotation/json_annotation.dart';

part 'payment_type_model.g.dart';

@JsonSerializable()
class PaymentTypeModel {
  final int id;
  final String name;
  final String acronym;
  final bool enabled;

  PaymentTypeModel({
    required this.id,
    required this.name,
    required this.acronym,
    required this.enabled,
  });

  factory PaymentTypeModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentTypeModelToJson(this);
}
