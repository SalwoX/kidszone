// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      id: json['id'] as int?,
      postId: json['postId'] as String?,
      ownerId: json['ownerId'] as int?,
      location: json['location'] as String?,
      description: json['description'] as String?,
      mediaUrl: json['mediaUrl'] as String?,
      phone: json['phone'] as String?,
      timeStamp: json['timeStamp'] == null
          ? null
          : DateTime.parse(json['timeStamp'] as String),
      postType: json['postType'] as int?,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'id': instance.id,
      'postId': instance.postId,
      'ownerId': instance.ownerId,
      'phone': instance.phone,
      'location': instance.location,
      'description': instance.description,
      'mediaUrl': instance.mediaUrl,
      'timeStamp': instance.timeStamp?.toIso8601String(),
      'postType': instance.postType,
    };
