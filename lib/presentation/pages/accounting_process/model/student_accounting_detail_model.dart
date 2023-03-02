import 'package:json_annotation/json_annotation.dart';

part 'student_accounting_detail_model.g.dart';

@JsonSerializable()
class StudentAccountingDetailModel {
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
  int? studentAccountingId;
  DateTime? date;
  double? amount;
  double? paid;
  double? remaining;

  StudentAccountingDetailModel({
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
    this.studentAccountingId,
    this.amount,
    this.date,
    this.remaining,
    this.paid,
  });

  factory StudentAccountingDetailModel.fromJson(Map<String, dynamic> json) {
    return _$StudentAccountingDetailModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StudentAccountingDetailModelToJson(this);
}
