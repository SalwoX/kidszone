import 'package:json_annotation/json_annotation.dart';

part 'school_bus_model.g.dart';

@JsonSerializable()
class SchoolBusModel {
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
  String? profileName;
  String? plate;
  String? driver;
  String? driverNum;
  String? attendant;
  String? attendantNum;
  String? description;

  SchoolBusModel({
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
    this.profileName,
    this.plate,
    this.driver,
    this.driverNum,
    this.attendant,
    this.attendantNum,
    this.description,
  });

  factory SchoolBusModel.fromJson(Map<String, dynamic> json) {
    return _$SchoolBusModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SchoolBusModelToJson(this);
}
