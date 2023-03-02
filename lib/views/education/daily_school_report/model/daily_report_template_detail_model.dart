import 'package:json_annotation/json_annotation.dart';

part 'daily_report_template_detail_model.g.dart';

@JsonSerializable()
class DailyReportTemplateDetailModel {
  DailyReportTemplateDetailModel({
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
    this.dailyReportTemplateMasterId,
    this.contentType,
    this.reportType,
    this.options,
    this.rowNumber,
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
  int? dailyReportTemplateMasterId;
  int? rowNumber;
  String? title;
  List<String>? options;
  ReportType? reportType;
  ContentType? contentType;

  factory DailyReportTemplateDetailModel.fromJson(Map<String, dynamic> json) {
    return _$DailyReportTemplateDetailModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DailyReportTemplateDetailModelToJson(this);
}

enum ReportType {
  education(1),
  daily(2);

  final int value;
  const ReportType(this.value);
}

enum ContentType {
  haveOptions(1),
  haveWritten(2);

  final int value;
  const ContentType(this.value);
}
