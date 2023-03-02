// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyModel _$SurveyModelFromJson(Map<String, dynamic> json) => SurveyModel(
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
      studentId: json['studentId'] as String?,
      targetGroup: json['targetGroup'] as int?,
      targetGroupIdList: json['targetGroupIdList'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      description: json['description'] as String?,
      imgUrl: json['imgUrl'] as String?,
      videoUrl: json['videoUrl'] as String?,
      linkUrl: json['linkUrl'] as String?,
      isMandatory: json['isMandatory'] as bool?,
    );

Map<String, dynamic> _$SurveyModelToJson(SurveyModel instance) =>
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
      'studentId': instance.studentId,
      'targetGroup': instance.targetGroup,
      'targetGroupIdList': instance.targetGroupIdList,
      'title': instance.title,
      'content': instance.content,
      'description': instance.description,
      'imgUrl': instance.imgUrl,
      'videoUrl': instance.videoUrl,
      'linkUrl': instance.linkUrl,
      'isMandatory': instance.isMandatory,
    };
