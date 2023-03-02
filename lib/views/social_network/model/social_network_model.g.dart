// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_network_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialNetworkModel _$SocialNetworkModelFromJson(Map<String, dynamic> json) =>
    SocialNetworkModel(
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
      insertedBy: json['insertedBy'] as String?,
      addingDate: json['addingDate'] == null
          ? null
          : DateTime.parse(json['addingDate'] as String),
      content: json['content'] as String?,
      uploadDate: json['uploadDate'] == null
          ? null
          : DateTime.parse(json['uploadDate'] as String),
      url: json['url'] as String?,
      imgUrl: json['imgUrl'] as String?,
      videoUrl: json['videoUrl'] as String?,
      postType: json['postType'] as int?,
      postId: json['postId'] as String?,
    )..filesUrl = (json['filesUrl'] as List<dynamic>?)
        ?.map((e) => SocialFileModel.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$SocialNetworkModelToJson(SocialNetworkModel instance) =>
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
      'insertedBy': instance.insertedBy,
      'addingDate': instance.addingDate?.toIso8601String(),
      'content': instance.content,
      'uploadDate': instance.uploadDate?.toIso8601String(),
      'url': instance.url,
      'imgUrl': instance.imgUrl,
      'videoUrl': instance.videoUrl,
      'postType': instance.postType,
      'postId': instance.postId,
      'filesUrl': instance.filesUrl,
    };

SocialFileModel _$SocialFileModelFromJson(Map<String, dynamic> json) =>
    SocialFileModel(
      fileId: json['fileId'] as int?,
      fileUrl: json['fileUrl'] as String?,
    );

Map<String, dynamic> _$SocialFileModelToJson(SocialFileModel instance) =>
    <String, dynamic>{
      'fileId': instance.fileId,
      'fileUrl': instance.fileUrl,
    };
