import 'package:json_annotation/json_annotation.dart';

part 'template_model.g.dart';

@JsonSerializable()
class TemplateModel {
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
  int? templateGroup;
  String? name;
  String? templateContent;
  String? description;
  bool? status;

  TemplateModel({
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
    this.templateGroup,
    this.name,
    this.templateContent,
    this.description,
    this.status,
  });

  factory TemplateModel.fromJson(Map<String, dynamic> json) {
    return _$TemplateModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TemplateModelToJson(this);
}
