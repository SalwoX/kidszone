// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homework_process_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeworkProcessModel _$HomeworkProcessModelFromJson(
        Map<String, dynamic> json) =>
    HomeworkProcessModel(
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
      modificationDate: json['modificationDate'] == null
          ? null
          : DateTime.parse(json['modificationDate'] as String),
      active: json['active'] as bool?,
      studentId: json['studentId'] as int?,
      lessonName: json['lessonName'] as String?,
      classroom: json['classroom'] as String?,
      homeworkHeader: json['homeworkHeader'] as String?,
      homeworkDescription: json['homeworkDescription'] as String?,
      imgUrl: json['imgUrl'] as String?,
    );

Map<String, dynamic> _$HomeworkProcessModelToJson(
        HomeworkProcessModel instance) =>
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
      'modificationDate': instance.modificationDate?.toIso8601String(),
      'active': instance.active,
      'studentId': instance.studentId,
      'lessonName': instance.lessonName,
      'classroom': instance.classroom,
      'homeworkHeader': instance.homeworkHeader,
      'homeworkDescription': instance.homeworkDescription,
      'imgUrl': instance.imgUrl,
    };
