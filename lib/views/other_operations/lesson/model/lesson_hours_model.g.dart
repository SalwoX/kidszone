// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_hours_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonHoursModel _$LessonHoursModelFromJson(Map<String, dynamic> json) =>
    LessonHoursModel(
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
      daysMidweek: json['daysMidweek'] as String?,
      daysWeekend: json['daysWeekend'] as String?,
      totalLessonHoursPerMidweek: json['totalLessonHoursPerMidweek'] as String?,
      totalLessonHoursPerWeekend: json['totalLessonHoursPerWeekend'] as String?,
    );

Map<String, dynamic> _$LessonHoursModelToJson(LessonHoursModel instance) =>
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
      'daysMidweek': instance.daysMidweek,
      'daysWeekend': instance.daysWeekend,
      'totalLessonHoursPerMidweek': instance.totalLessonHoursPerMidweek,
      'totalLessonHoursPerWeekend': instance.totalLessonHoursPerWeekend,
    };
