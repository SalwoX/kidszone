import 'package:json_annotation/json_annotation.dart';

import 'health_detail_model.dart';

part 'health_model.g.dart';

@JsonSerializable()
class HealthModel {
  int? id;
  int? schoolId;
  int? branchId;
  String? registrant;
  int? registrantId;
  DateTime? registrationDate;
  String? modifier;
  int? modifierId;
  DateTime? modifiedDate;
  bool? active;
  int? studentId;
  int? height;
  int? weight;
  bool? chronicIllness;
  String? description;
  List<HealthDetailModel>? healthDetailModels;

  HealthModel({
    this.id,
    this.schoolId,
    this.branchId,
    this.registrant,
    this.registrantId,
    this.registrationDate,
    this.modifier,
    this.modifierId,
    this.modifiedDate,
    this.active,
    this.studentId,
    this.height,
    this.weight,
    this.chronicIllness,
    this.description,
    this.healthDetailModels,
  });

  @override
  String toString() {
    return 'HealthModel(id: $id, schoolId: $schoolId, branchId: $branchId, registrant: $registrant, registrantId: $registrantId, registrationDate: $registrationDate, modifier: $modifier, modifierId: $modifierId, modifiedDate: $modifiedDate, active: $active, studentId: $studentId, size: $height, weight: $weight, chronicIllness: $chronicIllness, description: $description)';
  }

  factory HealthModel.fromJson(Map<String, dynamic> json) {
    return _$HealthModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HealthModelToJson(this);
}
