// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthDetailModel _$HealthDetailModelFromJson(Map<String, dynamic> json) =>
    HealthDetailModel(
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
      healthId: json['healthId'] as int?,
      medicamentName: json['medicamentName'] as String?,
      dose: json['dose'] as String?,
      timeRange: json['timeRange'] as int?,
      medicamentStartTime: json['medicamentStartTime'] == null
          ? null
          : DateTime.parse(json['medicamentStartTime'] as String),
      medicamentEndTime: json['medicamentEndTime'] == null
          ? null
          : DateTime.parse(json['medicamentEndTime'] as String),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$HealthDetailModelToJson(HealthDetailModel instance) =>
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
      'healthId': instance.healthId,
      'medicamentName': instance.medicamentName,
      'dose': instance.dose,
      'timeRange': instance.timeRange,
      'medicamentStartTime': instance.medicamentStartTime?.toIso8601String(),
      'medicamentEndTime': instance.medicamentEndTime?.toIso8601String(),
      'description': instance.description,
    };
