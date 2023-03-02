// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syllabus_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyllabusDetailModel _$SyllabusDetailModelFromJson(Map<String, dynamic> json) =>
    SyllabusDetailModel(
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
      syllabusId: json['syllabusId'] as int?,
      lessonId: json['lessonId'] as int?,
      dayId: json['dayId'] as int?,
      hourId: json['hourId'] as int?,
    );

Map<String, dynamic> _$SyllabusDetailModelToJson(
        SyllabusDetailModel instance) =>
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
      'syllabusId': instance.syllabusId,
      'lessonId': instance.lessonId,
      'dayId': instance.dayId,
      'hourId': instance.hourId,
    };
