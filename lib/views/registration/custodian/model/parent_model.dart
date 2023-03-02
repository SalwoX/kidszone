import 'package:json_annotation/json_annotation.dart';

part 'parent_model.g.dart';

@JsonSerializable()
class ParentModel {
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
  String? studentIds;
  String? nameSurname;
  String? idNo;
  String? phoneNumber;
  String? job;
  String? mail;
  DateTime? birthDate;
  int? type;
  String? description;
  String? address;
  String? confirmCode;
  String? password;
  int? permission;
  bool? mobileLogin;

  ParentModel({
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
    this.studentIds,
    this.nameSurname,
    this.idNo,
    this.phoneNumber,
    this.job,
    this.mail,
    this.birthDate,
    this.type,
    this.description,
    this.address,
    this.confirmCode,
    this.password,
    this.permission,
    this.mobileLogin,
  });

  factory ParentModel.fromJson(Map<String, dynamic> json) {
    return _$ParentModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ParentModelToJson(this);
}
