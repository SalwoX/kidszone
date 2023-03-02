import 'package:json_annotation/json_annotation.dart';

part 'homework_process_model.g.dart';

@JsonSerializable()
class HomeworkProcessModel {
  int? id;
  int? schoolId;
  int? termId;
  int? branchId;
  String? registrant;
  int? registrantId;
  DateTime? registrationDate;
  String? modifier;
  int? modifierId;
  DateTime? modificationDate;
  bool? active;
  int? studentId;
  String? lessonName;
  String? classroom;
  String? homeworkHeader;
  String? homeworkDescription;
  String? imgUrl;

  HomeworkProcessModel({
    this.id,
    this.schoolId,
    this.termId,
    this.branchId,
    this.registrant,
    this.registrantId,
    this.registrationDate,
    this.modifier,
    this.modifierId,
    this.modificationDate,
    this.active,
    this.studentId,
    this.lessonName,
    this.classroom,
    this.homeworkHeader,
    this.homeworkDescription,
    this.imgUrl,
  });

  @override
  String toString() {
    return 'OdevIslemleriModel(id: $id, schoolId: $schoolId, termId: $termId, branchId: $branchId, registrant: $registrant, registrantId: $registrantId, registrationDate: $registrationDate, modifier: $modifier, modifierId: $modifierId, modificationDate: $modificationDate, active: $active, studentId: $studentId, lessonName: $lessonName, classroom: $classroom, homeworkHeader: $homeworkHeader, homeworkDescription: $homeworkDescription, imgUrl: $imgUrl)';
  }

  factory HomeworkProcessModel.fromJson(Map<String, dynamic> json) {
    return _$HomeworkProcessModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HomeworkProcessModelToJson(this);

  HomeworkProcessModel copyWith({
    int? id,
    int? schoolId,
    int? termId,
    int? branchId,
    String? registrant,
    int? registrantId,
    DateTime? registrationDate,
    String? modifier,
    int? modifierId,
    DateTime? modificationDate,
    bool? active,
    int? studentId,
    String? lessonName,
    String? classroom,
    String? homeworkHeader,
    String? homeworkDescription,
    String? imgUrl,
  }) {
    return HomeworkProcessModel(
      id: id ?? this.id,
      schoolId: schoolId ?? this.schoolId,
      termId: termId ?? this.termId,
      branchId: branchId ?? this.branchId,
      registrant: registrant ?? this.registrant,
      registrantId: registrantId ?? this.registrantId,
      registrationDate: registrationDate ?? this.registrationDate,
      modifier: modifier ?? this.modifier,
      modifierId: modifierId ?? this.modifierId,
      modificationDate: modificationDate ?? this.modificationDate,
      active: active ?? this.active,
      studentId: studentId ?? this.studentId,
      lessonName: lessonName ?? this.lessonName,
      classroom: classroom ?? this.classroom,
      homeworkHeader: homeworkHeader ?? this.homeworkHeader,
      homeworkDescription: homeworkDescription ?? this.homeworkDescription,
      imgUrl: imgUrl ?? this.imgUrl,
    );
  }
}
