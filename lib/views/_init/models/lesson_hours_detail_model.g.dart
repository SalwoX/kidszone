// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_hours_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonHoursDetailModel _$LessonHoursDetailModelFromJson(
        Map<String, dynamic> json) =>
    LessonHoursDetailModel(
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
      lessonHoursId: json['lessonHoursId'] as int?,
      type: json['type'] as int?,
      startingTime: json['startingTime'] as String?,
      endTime: json['endTime'] as String?,
    );

Map<String, dynamic> _$LessonHoursDetailModelToJson(
        LessonHoursDetailModel instance) =>
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
      'lessonHoursId': instance.lessonHoursId,
      'type': instance.type,
      'startingTime': instance.startingTime,
      'endTime': instance.endTime,
    };
