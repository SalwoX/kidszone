import 'package:json_annotation/json_annotation.dart';

part 'health_movement_model.g.dart';

@JsonSerializable()
class HealthMovementModel {
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
  int? healthDetailId;
  bool? isReceive;
  DateTime? date;
  String? description;

  HealthMovementModel({
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
    this.healthDetailId,
    this.isReceive,
    this.date,
    this.description,
  });

  factory HealthMovementModel.fromJson(Map<String, dynamic> json) {
    return _$HealthMovementModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HealthMovementModelToJson(this);
}
