import 'package:json_annotation/json_annotation.dart';

part 'medicament_model.g.dart';

@JsonSerializable()
class MedicamentModel {
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
  String? hour;
  String? title;
  String? message;

  MedicamentModel({
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
    this.hour,
    this.title,
    this.message,
  });

  @override
  String toString() {
    return 'MedicamentModel(id: $id, schoolId: $schoolId, termId: $termId, branchId: $branchId, registrant: $registrant, registrantId: $registrantId, registrationDate: $registrationDate, modifier: $modifier, modifierId: $modifierId, modifiedDate: $modifiedDate, active: $active, healthId: $healthId, hour: $hour, title: $title, message: $message)';
  }

  factory MedicamentModel.fromJson(Map<String, dynamic> json) {
    return _$MedicamentModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicamentModelToJson(this);

  MedicamentModel copyWith({
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
    int? healthId,
    String? hour,
    String? title,
    String? message,
  }) {
    return MedicamentModel(
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
      healthId: healthId ?? this.healthId,
      hour: hour ?? this.hour,
      title: title ?? this.title,
      message: message ?? this.message,
    );
  }
}
