import 'package:json_annotation/json_annotation.dart';

part 'preregistration_model.g.dart';

@JsonSerializable()
class PreregistrationModel {
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
  String? nameSurname;
  String? idNo;
  DateTime? birthDate;
  int? gender;
  String? fatherName;
  String? fatherNum;
  String? motherName;
  String? motherNum;
  String? description;
  String? notes;
  int? registrationStatus;

  PreregistrationModel({
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
    this.nameSurname,
    this.idNo,
    this.birthDate,
    this.gender,
    this.fatherName,
    this.fatherNum,
    this.motherName,
    this.motherNum,
    this.description,
    this.notes,
    this.registrationStatus,
  });

  @override
  String toString() {
    return 'PreregistrationModel(id: $id, schoolId: $schoolId, termId: $termId, branchId: $branchId, registrant: $registrant, registrantId: $registrantId, registrationDate: $registrationDate, modifier: $modifier, modifierId: $modifierId, modifiedDate: $modifiedDate, active: $active, nameSurname: $nameSurname, idNo: $idNo, birthDate: $birthDate, gender: $gender, fatherName: $fatherName, fatherNum: $fatherNum, motherName: $motherName, motherNum: $motherNum, description: $description, notes: $notes, registrationStatus: $registrationStatus)';
  }

  factory PreregistrationModel.fromJson(Map<String, dynamic> json) {
    return _$PreregistrationModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PreregistrationModelToJson(this);

}
