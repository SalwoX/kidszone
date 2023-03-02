// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_operator_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterOperatorList _$FilterOperatorListFromJson(Map<String, dynamic> json) =>
    FilterOperatorList(
      operatorDate: json['OperatorDate'] == null
          ? null
          : OperatorDate.fromJson(json['OperatorDate'] as Map<String, dynamic>),
      operatorEnums: json['OperatorEnums'] == null
          ? null
          : OperatorEnums.fromJson(
              json['OperatorEnums'] as Map<String, dynamic>),
      operatorNumber: json['OperatorNumber'] == null
          ? null
          : OperatorNumber.fromJson(
              json['OperatorNumber'] as Map<String, dynamic>),
      operatorString: json['OperatorString'] == null
          ? null
          : OperatorString.fromJson(
              json['OperatorString'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FilterOperatorListToJson(FilterOperatorList instance) =>
    <String, dynamic>{
      'OperatorDate': instance.operatorDate,
      'OperatorEnums': instance.operatorEnums,
      'OperatorNumber': instance.operatorNumber,
      'OperatorString': instance.operatorString,
    };
