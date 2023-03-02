import 'package:json_annotation/json_annotation.dart';

part 'homework_model.g.dart';

@JsonSerializable()
class HomeworkModel {
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
  int? teacherId;
  String? title;
  String? description;
  String? imgUrl;

  HomeworkModel({
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
    this.teacherId,
    this.title,
    this.description,
    this.imgUrl,
  });

  @override
  String toString() {
    return 'HomeworkModel(id: $id, schoolId: $schoolId, termId: $termId, branchId: $branchId, registrant: $registrant, registrantId: $registrantId, registrationDate: $registrationDate, modifier: $modifier, modifierId: $modifierId, modifiedDate: $modifiedDate, active: $active, teacherId: $teacherId, title: $title, description: $description, imgUrl: $imgUrl)';
  }

  factory HomeworkModel.fromJson(Map<String, dynamic> json) {
    return _$HomeworkModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HomeworkModelToJson(this);

  HomeworkModel copyWith({
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
    int? teacherId,
    String? title,
    String? description,
    String? imgUrl,
  }) {
    return HomeworkModel(
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
      teacherId: teacherId ?? this.teacherId,
      title: title ?? this.title,
      description: description ?? this.description,
      imgUrl: imgUrl ?? this.imgUrl,
    );
  }
}
