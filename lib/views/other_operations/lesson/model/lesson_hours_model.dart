import 'package:json_annotation/json_annotation.dart';

part 'lesson_hours_model.g.dart';

@JsonSerializable()
class LessonHoursModel {
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
  String? daysMidweek;
  String? daysWeekend;
  String? totalLessonHoursPerMidweek;
  String? totalLessonHoursPerWeekend;

  LessonHoursModel({
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
    this.daysMidweek,
    this.daysWeekend,
    this.totalLessonHoursPerMidweek,
    this.totalLessonHoursPerWeekend,
  });

  @override
  String toString() {
    return 'LessonHoursModel(id: $id, schoolId: $schoolId, termId: $termId, branchId: $branchId, registrant: $registrant, registrantId: $registrantId, registrationDate: $registrationDate, modifier: $modifier, modifierId: $modifierId, modifiedDate: $modifiedDate, active: $active, daysMidweek: $daysMidweek, daysWeekend: $daysWeekend, totalLessonHoursPerMidweek: $totalLessonHoursPerMidweek, totalLessonHoursPerWeekend: $totalLessonHoursPerWeekend)';
  }

  factory LessonHoursModel.fromJson(Map<String, dynamic> json) {
    return _$LessonHoursModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LessonHoursModelToJson(this);
}
