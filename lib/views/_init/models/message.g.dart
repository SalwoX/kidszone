// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      content: json['content'] as String?,
      senderUid: json['senderUid'] as String?,
      messageType:
          $enumDecodeNullable(_$MessageTypeEnumMap, json['messageType']),
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'content': instance.content,
      'senderUid': instance.senderUid,
      'messageType': _$MessageTypeEnumMap[instance.messageType],
      'time': instance.time?.toIso8601String(),
    };

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.image: 'image',
};
