// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterModel _$FilterModelFromJson(Map<String, dynamic> json) => FilterModel(
      fields: (json['fields'] as List<dynamic>)
          .map((e) => Field.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int,
      pageSize: json['pageSize'] as int,
      sort: json['sort'] as String?,
    );

Map<String, dynamic> _$FilterModelToJson(FilterModel instance) =>
    <String, dynamic>{
      'fields': instance.fields,
      'page': instance.page,
      'pageSize': instance.pageSize,
      'sort': instance.sort,
    };

Field _$FieldFromJson(Map<String, dynamic> json) => Field(
      fieldName: json['fieldName'] as String?,
      fieldOperator: json['fieldOperator'] as String?,
      fieldValue: json['fieldValue'] as String?,
    );

Map<String, dynamic> _$FieldToJson(Field instance) => <String, dynamic>{
      'fieldName': instance.fieldName,
      'fieldOperator': instance.fieldOperator,
      'fieldValue': instance.fieldValue,
    };
