import 'package:json_annotation/json_annotation.dart';

import 'daily_report_template_detail_model.dart';

part 'reports.g.dart';

@JsonSerializable()
class Reports {
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
  int? dailyReportId;
  int? rowNumber;
  String? title;
  List<String>? options;
  ReportType? reportType;
  ContentType? contentType;
  String? value;

  Reports({
    this.id,
    this.schoolId,
    this.branchId,
    this.registrant,
    this.registrantId,
    this.registrationDate,
    this.modifier,
    this.modifierId,
    this.modifiedDate,
    this.active,
    this.dailyReportId,
    this.rowNumber,
    this.title,
    this.value,
    this.options,
    this.termId,
    this.contentType,
    this.reportType,
  });

  factory Reports.fromJson(Map<String, dynamic> json) {
    return _$ReportsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReportsToJson(this);
}
