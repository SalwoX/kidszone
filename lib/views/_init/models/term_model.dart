import 'package:json_annotation/json_annotation.dart';

part 'term_model.g.dart';

@JsonSerializable()
class TermModel {
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
  DateTime? startTime;
  DateTime? endTime;

  TermModel({
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
    this.startTime,
    this.endTime,
  });

  factory TermModel.fromJson(Map<String, dynamic> json) {
    return _$TermModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TermModelToJson(this);
}
