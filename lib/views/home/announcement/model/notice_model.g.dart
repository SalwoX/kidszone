// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeModel _$NoticeModelFromJson(Map<String, dynamic> json) => NoticeModel(
      id: json['id'] as int?,
      schoolId: json['schoolId'] as int?,
      branchId: json['branchId'] as int?,
      termId: json['termId'] as int?,
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
      title: json['title'] as String?,
      targetGroup: json['targetGroup'] as int?,
      content: json['content'] as String?,
      sharingDate: json['sharingDate'] == null
          ? null
          : DateTime.parse(json['sharingDate'] as String),
      linkUrl: json['linkUrl'] as String?,
      imgUrl: json['imgUrl'] as String?,
      fileUrl: json['fileUrl'] as String?,
      constant: json['constant'] as bool?,
    );

Map<String, dynamic> _$NoticeModelToJson(NoticeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'schoolId': instance.schoolId,
      'branchId': instance.branchId,
      'termId': instance.termId,
      'registrant': instance.registrant,
      'registrantId': instance.registrantId,
      'registrationDate': instance.registrationDate?.toIso8601String(),
      'modifier': instance.modifier,
      'modifierId': instance.modifierId,
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'active': instance.active,
      'title': instance.title,
      'targetGroup': instance.targetGroup,
      'content': instance.content,
      'sharingDate': instance.sharingDate?.toIso8601String(),
      'linkUrl': instance.linkUrl,
      'imgUrl': instance.imgUrl,
      'fileUrl': instance.fileUrl,
      'constant': instance.constant,
    };
