// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homework_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeworkModel _$HomeworkModelFromJson(Map<String, dynamic> json) =>
    HomeworkModel(
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
      teacherId: json['teacherId'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      imgUrl: json['imgUrl'] as String?,
    );

Map<String, dynamic> _$HomeworkModelToJson(HomeworkModel instance) =>
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
      'teacherId': instance.teacherId,
      'title': instance.title,
      'description': instance.description,
      'imgUrl': instance.imgUrl,
    };
