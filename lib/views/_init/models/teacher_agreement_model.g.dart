// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_agreement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherAgreementModel _$TeacherAgreementModelFromJson(
        Map<String, dynamic> json) =>
    TeacherAgreementModel(
      id: json['id'] as int?,
      schoolId: json['schoolId'] as int?,
      branchId: json['branchId'] as int?,
      registrant: json['registrant'] as String?,
      registrantId: json['registrantId'] as int?,
      registration: json['registration'] == null
          ? null
          : DateTime.parse(json['registration'] as String),
      modifier: json['modifier'] as String?,
      modifierId: json['modifierId'] as int?,
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      active: json['active'] as bool?,
      termId: json['termId'] as int?,
      teacherId: json['teacherId'] as int?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$TeacherAgreementModelToJson(
        TeacherAgreementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'schoolId': instance.schoolId,
      'branchId': instance.branchId,
      'registrant': instance.registrant,
      'registrantId': instance.registrantId,
      'registration': instance.registration?.toIso8601String(),
      'modifier': instance.modifier,
      'modifierId': instance.modifierId,
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'active': instance.active,
      'termId': instance.termId,
      'teacherId': instance.teacherId,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'status': instance.status,
    };
