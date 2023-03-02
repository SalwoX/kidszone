// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_widget_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterWidgetModel _$FilterWidgetModelFromJson(Map<String, dynamic> json) =>
    FilterWidgetModel(
      fieldName: json['fieldName'] as String,
      type: json['type'] as String,
      fieldValue: json['fieldValue'] as String,
      fieldLabel: json['fieldLabel'] as String,
    );

Map<String, dynamic> _$FilterWidgetModelToJson(FilterWidgetModel instance) =>
    <String, dynamic>{
      'fieldName': instance.fieldName,
      'type': instance.type,
      'fieldValue': instance.fieldValue,
      'fieldLabel': instance.fieldLabel,
    };
