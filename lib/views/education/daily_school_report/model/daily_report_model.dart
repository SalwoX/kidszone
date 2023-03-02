import 'package:json_annotation/json_annotation.dart';

import 'reports.dart';

part 'daily_report_model.g.dart';

@JsonSerializable()
class DailyReportModel {
  int? id;
  int? schoolId;
  int? branchId;
  String? registrant;
  int? registrantId;
  DateTime? registrationDate;
  String? modifier;
  int? modifierId;
  DateTime? modifiedDate;
  bool? active;
  DateTime? dateToDay;
  String? teacherNote;
  List<Reports>? reports;

  DailyReportModel({
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
    this.dateToDay,
    this.teacherNote,
    this.reports,
  });

  @override
  String toString() {
    return 'DailyReportModel(id: $id, schoolId: $schoolId, branchId: $branchId, registrant: $registrant, registrantId: $registrantId, registrationDate: $registrationDate, modifier: $modifier, modifierId: $modifierId, modifiedDate: $modifiedDate, active: $active, dateToDay: $dateToDay, teacherNote: $teacherNote, reports: $reports)';
  }

  factory DailyReportModel.fromJson(Map<String, dynamic> json) {
    return _$DailyReportModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DailyReportModelToJson(this);

}
