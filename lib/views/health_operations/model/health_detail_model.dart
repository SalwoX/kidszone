import 'package:json_annotation/json_annotation.dart';

part 'health_detail_model.g.dart';

@JsonSerializable()
class HealthDetailModel {
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
  int? healthId;
  String? medicamentName;
  String? dose;
  int? timeRange;
  DateTime? medicamentStartTime;
  DateTime? medicamentEndTime;
  String? description;

  HealthDetailModel({
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
    this.healthId,
    this.medicamentName,
    this.dose,
    this.timeRange,
    this.medicamentStartTime,
    this.medicamentEndTime,
    this.description,
  });

  factory HealthDetailModel.fromJson(Map<String, dynamic> json) {
    return _$HealthDetailModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HealthDetailModelToJson(this);
}
