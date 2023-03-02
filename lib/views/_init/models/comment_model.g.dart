// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
      phone: json['phone'] as String?,
      comment: json['comment'] as String?,
      timeStamp: json['timeStamp'] == null
          ? null
          : DateTime.parse(json['timeStamp'] as String),
      userDp: json['userDp'] as String?,
      userId: json['userId'] as int?,
    );

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'comment': instance.comment,
      'timeStamp': instance.timeStamp?.toIso8601String(),
      'userDp': instance.userDp,
      'userId': instance.userId,
    };
