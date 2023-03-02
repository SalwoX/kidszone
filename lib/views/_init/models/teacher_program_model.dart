import 'package:json_annotation/json_annotation.dart';

part 'teacher_program_model.g.dart';

@JsonSerializable()
class TeacherProgramModel {
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

  TeacherProgramModel({
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
  });

  @override
  String toString() {
    return 'TeacherProgramModel(id: $id, schoolId: $schoolId, termId: $termId, branchId: $branchId, registrant: $registrant, registrantId: $registrantId, registrationDate: $registrationDate, modifier: $modifier, modifierId: $modifierId, modifiedDate: $modifiedDate, active: $active, studentId: $studentId)';
  }

  factory TeacherProgramModel.fromJson(Map<String, dynamic> json) {
    return _$TeacherProgramModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TeacherProgramModelToJson(this);

}
