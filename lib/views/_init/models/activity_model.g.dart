// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityModel _$ActivityModelFromJson(Map<String, dynamic> json) =>
    ActivityModel(
      json['type'] as String?,
      json['username'] as String?,
      json['userId'] as int?,
      json['userDp'] as String?,
      json['postId'] as int?,
      json['commentData'] as String?,
      json['mediaUrl'] as String?,
      json['timeStamp'] == null
          ? null
          : DateTime.parse(json['timeStamp'] as String),
    );

Map<String, dynamic> _$ActivityModelToJson(ActivityModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'username': instance.username,
      'userId': instance.userId,
      'userDp': instance.userDp,
      'postId': instance.postId,
      'mediaUrl': instance.mediaUrl,
      'commentData': instance.commentData,
      'timeStamp': instance.timeStamp?.toIso8601String(),
    };
