import 'package:json_annotation/json_annotation.dart';

part 'syllabus_model.g.dart';

@JsonSerializable()
class SyllabusModel {
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
  String? classroomId;

  SyllabusModel({
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
    this.classroomId,
  });

  @override
  String toString() {
    return 'SyllabusModel(id: $id, schoolId: $schoolId, termId: $termId, branchId: $branchId, registrant: $registrant, registrantId: $registrantId, registrationDate: $registrationDate, modifier: $modifier, modifierId: $modifierId, modifiedDate: $modifiedDate, active: $active, classroomId: $classroomId)';
  }

  factory SyllabusModel.fromJson(Map<String, dynamic> json) {
    return _$SyllabusModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SyllabusModelToJson(this);
}
