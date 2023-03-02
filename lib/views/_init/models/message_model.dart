import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  int? id;
  int? schoolId;
  int? termId;
  int? branchId;
  String? registrant;
  int? registrantId;
  DateTime? registrationDate;
  String? modifier;
  int? modifierId;
  DateTime? modifiedDate;
  bool? active;
  int? targetGroup;
  String? teacherName;
  @JsonKey(name: 'messageContent')
  String? messageContent;

  MessageModel({
    this.id,
    this.schoolId,
    this.termId,
    this.branchId,
    this.registrant,
    this.registrantId,
    this.registrationDate,
    this.modifier,
    this.modifierId,
    this.modifiedDate,
    this.active,
    this.targetGroup,
    this.teacherName,
    this.messageContent,
  });

  @override
  String toString() {
    return 'MessageModel(id: $id, schoolId: $schoolId, termId: $termId, branchId: $branchId, registrant: $registrant, registrantId: $registrantId, registrationDate: $registrationDate, modifier: $modifier, modifierId: $modifierId, modifiedDate: $modifiedDate, active: $active, targetGroup: $targetGroup, teacherName: $teacherName, messageContent: $messageContent)';
  }

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return _$MessageModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);

  MessageModel copyWith({
    int? id,
    int? schoolId,
    int? termId,
    int? branchId,
    String? registrant,
    int? registrantId,
    DateTime? registrationDate,
    String? modifier,
    int? modifierId,
    DateTime? modifiedDate,
    bool? active,
    int? targetGroup,
    String? teacherName,
    String? messageContent,
  }) {
    return MessageModel(
      id: id ?? this.id,
      schoolId: schoolId ?? this.schoolId,
      termId: termId ?? this.termId,
      branchId: branchId ?? this.branchId,
      registrant: registrant ?? this.registrant,
      registrantId: registrantId ?? this.registrantId,
      registrationDate: registrationDate ?? this.registrationDate,
      modifier: modifier ?? this.modifier,
      modifierId: modifierId ?? this.modifierId,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      active: active ?? this.active,
      targetGroup: targetGroup ?? this.targetGroup,
      teacherName: teacherName ?? this.teacherName,
      messageContent: messageContent ?? this.messageContent,
    );
  }
}
