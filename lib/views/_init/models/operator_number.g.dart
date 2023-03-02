// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operator_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperatorNumber _$OperatorNumberFromJson(Map<String, dynamic> json) =>
    OperatorNumber(
      eq: json['eq'] as String?,
      gt: json['gt'] as String?,
      gte: json['gte'] as String?,
      lt: json['lt'] as String?,
      lte: json['lte'] as String?,
      neq: json['neq'] as String?,
      isnull: json['isnull'] as String?,
      isNotNull: json['isNotNull'] as String?,
    );

Map<String, dynamic> _$OperatorNumberToJson(OperatorNumber instance) =>
    <String, dynamic>{
      'eq': instance.eq,
      'gt': instance.gt,
      'gte': instance.gte,
      'lt': instance.lt,
      'lte': instance.lte,
      'neq': instance.neq,
      'isnull': instance.isnull,
      'isNotNull': instance.isNotNull,
    };
