import 'package:json_annotation/json_annotation.dart';

part 'permission_model.g.dart';

@JsonSerializable()
class PermissionModel {
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
  int? groupCode;
  String? permissions;

  PermissionModel({
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
    this.groupCode,
    this.permissions,
  });

  factory PermissionModel.fromJson(Map<String, dynamic> json) {
    return _$PermissionModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PermissionModelToJson(this);
}
