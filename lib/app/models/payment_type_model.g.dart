// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentTypeModel _$PaymentTypeModelFromJson(Map<String, dynamic> json) =>
    PaymentTypeModel(
      id: json['id'] as int,
      name: json['name'] as String,
      acronym: json['acronym'] as String,
      enabled: json['enabled'] as bool,
    );

Map<String, dynamic> _$PaymentTypeModelToJson(PaymentTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'acronym': instance.acronym,
      'enabled': instance.enabled,
    };
