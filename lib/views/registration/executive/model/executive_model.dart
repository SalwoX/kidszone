import 'package:json_annotation/json_annotation.dart';
part 'executive_model.g.dart';


@JsonSerializable()
class ExecutiveModel {
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
  String? phoneNumber;
  String? password;
  String? imgUrl;
  String? permission;
  String? description;
  bool? mobileLogin;
  bool? webLogin;
  int? admin;

  ExecutiveModel({
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
    this.phoneNumber,
    this.password,
    this.imgUrl,
    this.permission,
    this.description,
    this.mobileLogin,
    this.webLogin,
    this.admin
  });

  factory ExecutiveModel.fromJson(Map<String, dynamic> json) {
    return _$ExecutiveModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ExecutiveModelToJson(this);
}
