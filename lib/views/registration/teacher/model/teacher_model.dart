import 'package:json_annotation/json_annotation.dart';

part 'teacher_model.g.dart';

@JsonSerializable()
class TeacherModel {
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
  int? termId;
  String? nameSurname;
  String? idNo;
  String? phoneNumber;
  String? password;
  String? mail;
  int? visibleClassroom;
  String? color;
  DateTime? birthDate;
  String? address;
  String? description;
  String? lessonClass;
  String? imgUrl;
  int? permission;
  bool? mobileLogin;
  bool? webLogin;

  TeacherModel({
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
    this.termId,
    this.nameSurname,
    this.idNo,
    this.phoneNumber,
    this.password,
    this.mail,
    this.visibleClassroom,
    this.color,
    this.birthDate,
    this.address,
    this.description,
    this.lessonClass,
    this.imgUrl,
    this.permission,
    this.mobileLogin,
    this.webLogin,
  });

  @override
  String toString() {
    return 'TeacherModel(id: $id, schoolId: $schoolId, branchId: $branchId, registrant: $registrant, registrantId: $registrantId, registrationDate: $registrationDate, modifier: $modifier, modifierId: $modifierId, modifiedDate: $modifiedDate, active: $active, termId: $termId, nameSurname: $nameSurname, idNo: $idNo, phoneNumber: $phoneNumber, password: $password, mail: $mail, visibleClassroom: $visibleClassroom, color: $color, dateOfBirth: $birthDate, address: $address, description: $description, lessonClass: $lessonClass, imgUrl: $imgUrl, permission: $permission, mobileLogin: $mobileLogin, webLogin: $webLogin)';
  }

  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return _$TeacherModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TeacherModelToJson(this);


}
