import 'package:json_annotation/json_annotation.dart';

import 'student_accounting_detail_model.dart';

part 'student_accounting_model.g.dart';

@JsonSerializable()
class StudentAccountingModel {
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
  DateTime? agreementDate;
  double? startingPrice;
  double? agreementAmount;
  List<StudentAccountingDetailModel>? details;

  StudentAccountingModel({
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
    this.startingPrice,
    this.agreementDate,
    this.details,
    this.agreementAmount,
  });

  factory StudentAccountingModel.fromJson(Map<String, dynamic> json) {
    return _$StudentAccountingModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StudentAccountingModelToJson(this);
}
