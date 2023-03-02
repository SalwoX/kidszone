import 'package:json_annotation/json_annotation.dart';

import 'daily_report_template_detail_model.dart';

part 'daily_report_template_model.g.dart';

@JsonSerializable()
class DailyReportTemplateModel {
  DailyReportTemplateModel({
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
    this.details,
    this.templateId,
    this.templateType,
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
  int? templateId;
  String? templateType;
  List<DailyReportTemplateDetailModel>? details;

  factory DailyReportTemplateModel.fromJson(Map<String, dynamic> json) {
    return _$DailyReportTemplateModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DailyReportTemplateModelToJson(this);
}
