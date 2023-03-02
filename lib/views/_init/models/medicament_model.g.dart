// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicament_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicamentModel _$MedicamentModelFromJson(Map<String, dynamic> json) =>
    MedicamentModel(
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
      hour: json['hour'] as String?,
      title: json['title'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$MedicamentModelToJson(MedicamentModel instance) =>
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
      'hour': instance.hour,
      'title': instance.title,
      'message': instance.message,
    };
