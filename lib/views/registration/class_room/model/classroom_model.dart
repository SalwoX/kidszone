import 'package:json_annotation/json_annotation.dart';

part 'classroom_model.g.dart';

@JsonSerializable()
class ClassroomModel {
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
  String? name;
  int? classTour;
  String? description;
  String? imgUrl;
  int? teacherId1;
  int? teacherId2;

  ClassroomModel({
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
    this.name,
    this.classTour,
    this.description,
    this.imgUrl,
    this.teacherId1,
    this.teacherId2,
  });

  factory ClassroomModel.fromJson(Map<String, dynamic> json) {
    return _$ClassroomModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ClassroomModelToJson(this);
}
