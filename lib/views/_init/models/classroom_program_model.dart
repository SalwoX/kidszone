import 'package:json_annotation/json_annotation.dart';

part 'classroom_program_model.g.dart';

@JsonSerializable()
class ClassroomProgramModel {
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

  ClassroomProgramModel({
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
  });

  factory ClassroomProgramModel.fromJson(Map<String, dynamic> json) {
    return _$ClassroomProgramModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ClassroomProgramModelToJson(this);
}
