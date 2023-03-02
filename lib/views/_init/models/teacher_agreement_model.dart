import 'package:json_annotation/json_annotation.dart';

part 'teacher_agreement_model.g.dart';

@JsonSerializable()
class TeacherAgreementModel {
  final int? id;
  final int? schoolId;
  final int? branchId;
  final String? registrant;
  final int? registrantId;
  final DateTime? registration;
  final String? modifier;
  final int? modifierId;
  final DateTime? modifiedDate;
  final bool? active;
  final int? termId;
  final int? teacherId;
  final String? startTime;
  final String? endTime;
  final bool? status;

  const TeacherAgreementModel({
    this.id,
    this.schoolId,
    this.branchId,
    this.registrant,
    this.registrantId,
    this.registration,
    this.modifier,
    this.modifierId,
    this.modifiedDate,
    this.active,
    this.termId,
    this.teacherId,
    this.startTime,
    this.endTime,
    this.status,
  });

  @override
  String toString() {
    return 'TeacherAgreementModel(id: $id, schoolId: $schoolId, branchId: $branchId, registrant: $registrant, registrantId: $registrantId, registration: $registration, modifier: $modifier, modifierId: $modifierId, modifiedDate: $modifiedDate, active: $active, termId: $termId, teacherId: $teacherId, startTime: $startTime, endTime: $endTime, status: $status)';
  }

  factory TeacherAgreementModel.fromJson(Map<String, dynamic> json) {
    return _$TeacherAgreementModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TeacherAgreementModelToJson(this);

}
