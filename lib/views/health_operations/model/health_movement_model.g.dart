// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_movement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthMovementModel _$HealthMovementModelFromJson(Map<String, dynamic> json) =>
    HealthMovementModel(
      id: json['id'] as int?,
      schoolId: json['schoolId'] as int?,
      termId: json['termId'] as int?,
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
      healthDetailId: json['healthDetailId'] as int?,
      isReceive: json['isReceive'] as bool?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$HealthMovementModelToJson(
        HealthMovementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'schoolId': instance.schoolId,
      'termId': instance.termId,
      'branchId': instance.branchId,
      'registrant': instance.registrant,
      'registrantId': instance.registrantId,
      'registrationDate': instance.registrationDate?.toIso8601String(),
      'modifier': instance.modifier,
      'modifierId': instance.modifierId,
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'active': instance.active,
      'healthDetailId': instance.healthDetailId,
      'isReceive': instance.isReceive,
      'date': instance.date?.toIso8601String(),
      'description': instance.description,
    };
