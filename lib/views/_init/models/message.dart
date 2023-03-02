import 'package:json_annotation/json_annotation.dart';

import 'enum/message_type.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  String? content;
  String? senderUid;
  MessageType? messageType;
  DateTime? time;

  Message({this.content, this.senderUid, this.messageType, this.time});
  factory Message.fromJson(Map<String, dynamic> json) {
    return _$MessageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
