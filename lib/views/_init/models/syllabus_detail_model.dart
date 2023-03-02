import 'package:json_annotation/json_annotation.dart';

part 'syllabus_detail_model.g.dart';

@JsonSerializable()
class SyllabusDetailModel {
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
  int? syllabusId;
  int? lessonId;
  int? dayId;
  int? hourId;

  SyllabusDetailModel({
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
    this.syllabusId,
    this.lessonId,
    this.dayId,
    this.hourId,
  });

  @override
  String toString() {
    return 'SyllabusDetailModel(id: $id, schoolId: $schoolId, termId: $termId, branchId: $branchId, registrant: $registrant, registrantId: $registrantId, registrationDate: $registrationDate, modifier: $modifier, modifierId: $modifierId, modifiedDate: $modifiedDate, active: $active, syllabusId: $syllabusId, lessonId: $lessonId, dayId: $dayId, hourId: $hourId)';
  }

  factory SyllabusDetailModel.fromJson(Map<String, dynamic> json) {
    return _$SyllabusDetailModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SyllabusDetailModelToJson(this);
}
