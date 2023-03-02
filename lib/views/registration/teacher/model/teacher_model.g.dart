// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherModel _$TeacherModelFromJson(Map<String, dynamic> json) => TeacherModel(
      id: json['id'] as int?,
      schoolId: json['schoolId'] as int?,
      branchId: json['branchId'] as int?,
      registrant: json['registrant'] as String?,
      registrantId: json['registrantId'] as int?,
      registrationDate: json['registrationDate'] == null
          ? null
          : DateTime.parse(json['registrationDate'] as String),
      modifier: json['modifier'] as String?,
      modifierId: json['modifierId'] as int?,
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      active: json['active'] as bool?,
      termId: json['termId'] as int?,
      nameSurname: json['nameSurname'] as String?,
      idNo: json['idNo'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      password: json['password'] as String?,
      mail: json['mail'] as String?,
      visibleClassroom: json['visibleClassroom'] as int?,
      color: json['color'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      address: json['address'] as String?,
      description: json['description'] as String?,
      lessonClass: json['lessonClass'] as String?,
      imgUrl: json['imgUrl'] as String?,
      permission: json['permission'] as int?,
      mobileLogin: json['mobileLogin'] as bool?,
      webLogin: json['webLogin'] as bool?,
    );

Map<String, dynamic> _$TeacherModelToJson(TeacherModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'schoolId': instance.schoolId,
      'branchId': instance.branchId,
      'registrant': instance.registrant,
      'registrantId': instance.registrantId,
      'registrationDate': instance.registrationDate?.toIso8601String(),
      'modifier': instance.modifier,
      'modifierId': instance.modifierId,
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'active': instance.active,
      'termId': instance.termId,
      'nameSurname': instance.nameSurname,
      'idNo': instance.idNo,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'mail': instance.mail,
      'visibleClassroom': instance.visibleClassroom,
      'color': instance.color,
      'birthDate': instance.birthDate?.toIso8601String(),
      'address': instance.address,
      'description': instance.description,
      'lessonClass': instance.lessonClass,
      'imgUrl': instance.imgUrl,
      'permission': instance.permission,
      'mobileLogin': instance.mobileLogin,
      'webLogin': instance.webLogin,
    };
