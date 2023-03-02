import 'package:json_annotation/json_annotation.dart';

part 'homework_tracking_model.g.dart';

@JsonSerializable()
class HomeworkTrackingModel {
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
  int? homeworkId;
  int? studentId;
  String? description;
  bool? status;

  HomeworkTrackingModel({
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
    this.homeworkId,
    this.studentId,
    this.description,
    this.status,
  });

  @override
  String toString() {
    return 'HomeworkTrackingModel(id: $id, schoolId: $schoolId, termId: $termId, branchId: $branchId, registrant: $registrant, registrantId: $registrantId, registrationDate: $registrationDate, modifier: $modifier, modifierId: $modifierId, modifiedDate: $modifiedDate, active: $active, homeworkId: $homeworkId, studentId: $studentId, description: $description, status: $status)';
  }

  factory HomeworkTrackingModel.fromJson(Map<String, dynamic> json) {
    return _$HomeworkTrackingModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HomeworkTrackingModelToJson(this);

  HomeworkTrackingModel copyWith({
    int? id,
    int? schoolId,
    int? termId,
    int? branchId,
    String? registrant,
    int? registrantId,
    DateTime? registrationDate,
    String? modifier,
    int? modifierId,
    DateTime? modifiedDate,
    bool? active,
    int? homeworkId,
    int? studentId,
    String? description,
    bool? status,
  }) {
    return HomeworkTrackingModel(
      id: id ?? this.id,
      schoolId: schoolId ?? this.schoolId,
      termId: termId ?? this.termId,
      branchId: branchId ?? this.branchId,
      registrant: registrant ?? this.registrant,
      registrantId: registrantId ?? this.registrantId,
      registrationDate: registrationDate ?? this.registrationDate,
      modifier: modifier ?? this.modifier,
      modifierId: modifierId ?? this.modifierId,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      active: active ?? this.active,
      homeworkId: homeworkId ?? this.homeworkId,
      studentId: studentId ?? this.studentId,
      description: description ?? this.description,
      status: status ?? this.status,
    );
  }
}
