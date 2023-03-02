import 'package:json_annotation/json_annotation.dart';
part 'lesson_model.g.dart';

@JsonSerializable()
class LessonModel {
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
  int? teacherId;
  String? name;
  String? shortName;
  String? description;
  String? color;
  int? credit;

  LessonModel({
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
    this.teacherId,
    this.name,
    this.shortName,
    this.description,
    this.color,
    this.credit,
  });

  @override
  String toString() {
    return 'LessonModel(id: $id, schoolId: $schoolId, termId: $termId, branchId: $branchId, registrant: $registrant, registrantId: $registrantId, registrationDate: $registrationDate, modifier: $modifier, modifierId: $modifierId, modifiedDate: $modifiedDate, active: $active, classroomId: $classroomId, teacherId: $teacherId, name: $name, shortName: $shortName, description: $description, color: $color, credit: $credit)';
  }

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return _$LessonModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LessonModelToJson(this);
}
