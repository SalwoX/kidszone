import 'package:json_annotation/json_annotation.dart';

part 'attendance_model.g.dart';

@JsonSerializable()
class AttendanceModel {
  int? id;
  String? nameSurname;
  int? gender;
  List<AttendanceDetail>? detail;

  AttendanceModel({
    this.id,
    this.nameSurname,
    this.gender,
    this.detail,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return _$AttendanceModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AttendanceModelToJson(this);
}

@JsonSerializable()
class AttendanceDetail {
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
  int? studentId;
  String? receiver;
  String? submitter;
  DateTime? date;
  String? checkInTime;
  String? checkOutTime;

  AttendanceDetail({
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
    this.receiver,
    this.submitter,
    this.date,
    this.checkInTime,
    this.checkOutTime,
  });

  factory AttendanceDetail.fromJson(Map<String, dynamic> json) {
    return _$AttendanceDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AttendanceDetailToJson(this);
}
