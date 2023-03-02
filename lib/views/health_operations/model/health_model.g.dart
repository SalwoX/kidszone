// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthModel _$HealthModelFromJson(Map<String, dynamic> json) => HealthModel(
      id: json['id'] as int?,
      schoolId: json['schoolId'] as int?,
      branchId: json['branchId'] as int?,
      registrant: json['registrant'] as String?,
      registrantId: json['registrantId'] as int?,
      registrationDate: json['registrationDate'] == null
          ? null
          : DateTime.parse(json['registrationDate'] as String),
      modifier: json['modifier'] as String?,
      modifierId: json['modifierId'] as int?,
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      active: json['active'] as bool?,
      studentId: json['studentId'] as int?,
      height: json['height'] as int?,
      weight: json['weight'] as int?,
      chronicIllness: json['chronicIllness'] as bool?,
      description: json['description'] as String?,
      healthDetailModels: (json['healthDetailModels'] as List<dynamic>?)
          ?.map((e) => HealthDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HealthModelToJson(HealthModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'schoolId': instance.schoolId,
      'branchId': instance.branchId,
      'registrant': instance.registrant,
      'registrantId': instance.registrantId,
      'registrationDate': instance.registrationDate?.toIso8601String(),
      'modifier': instance.modifier,
      'modifierId': instance.modifierId,
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'active': instance.active,
      'studentId': instance.studentId,
      'height': instance.height,
      'weight': instance.weight,
      'chronicIllness': instance.chronicIllness,
      'description': instance.description,
      'healthDetailModels': instance.healthDetailModels,
    };
