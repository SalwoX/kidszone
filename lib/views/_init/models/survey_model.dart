import 'package:json_annotation/json_annotation.dart';

part 'survey_model.g.dart';

@JsonSerializable()
class SurveyModel {
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
  String? studentId;
  int? targetGroup;
  String? targetGroupIdList;
  String? title;
  String? content;
  String? description;
  String? imgUrl;
  String? videoUrl;
  String? linkUrl;
  bool? isMandatory;

  SurveyModel({
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
    this.studentId,
    this.targetGroup,
    this.targetGroupIdList,
    this.title,
    this.content,
    this.description,
    this.imgUrl,
    this.videoUrl,
    this.linkUrl,
    this.isMandatory,
  });

  factory SurveyModel.fromJson(Map<String, dynamic> json) {
    return _$SurveyModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SurveyModelToJson(this);
}
