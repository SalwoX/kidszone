import 'package:json_annotation/json_annotation.dart';
part 'notice_model.g.dart';

@JsonSerializable()
class NoticeModel {
  NoticeModel({
    this.id,
    this.schoolId,
    this.branchId,
    this.termId,
    this.registrant,
    this.registrantId,
    this.registrationDate,
    this.modifier,
    this.modifierId,
    this.modifiedDate,
    this.active,
    this.title,
    this.targetGroup,
    this.content,
    this.sharingDate,
    this.linkUrl,
    this.imgUrl,
    this.fileUrl,
    this.constant,
  });

  int? id;
  int? schoolId;
  int? branchId;
  int? termId;
  String? registrant;
  int? registrantId;
  DateTime? registrationDate;
  String? modifier;
  int? modifierId;
  DateTime? modifiedDate;
  bool? active;
  String? title;
  int? targetGroup;
  String? content;
  DateTime? sharingDate;
  String? linkUrl;
  String? imgUrl;
  String? fileUrl;
  bool? constant;

  factory NoticeModel.fromJson(Map<String, dynamic> json) => _$NoticeModelFromJson(json);
  Map<String, dynamic> toJson() => _$NoticeModelToJson(this);
}
