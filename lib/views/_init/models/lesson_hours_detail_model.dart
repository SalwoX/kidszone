import 'package:json_annotation/json_annotation.dart';

part 'lesson_hours_detail_model.g.dart';

@JsonSerializable()
class LessonHoursDetailModel {
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
  int? lessonHoursId;
  int? type;
  String? startingTime;
  String? endTime;

  LessonHoursDetailModel({
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
    this.lessonHoursId,
    this.type,
    this.startingTime,
    this.endTime,
  });

  @override
  String toString() {
    return 'LessonHoursModel(id: $id, schoolId: $schoolId, termId: $termId, branchId: $branchId, registrant: $registrant, registrantId: $registrantId, registrationDate: $registrationDate, modifier: $modifier, modifierId: $modifierId, modifiedDate: $modifiedDate, active: $active, lessonHoursId: $lessonHoursId, type: $type, startingTime: $startingTime, endTime: $endTime)';
  }

  factory LessonHoursDetailModel.fromJson(Map<String, dynamic> json) {
    return _$LessonHoursDetailModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LessonHoursDetailModelToJson(this);
}
