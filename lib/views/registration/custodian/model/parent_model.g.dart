// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParentModel _$ParentModelFromJson(Map<String, dynamic> json) => ParentModel(
      id: json['id'] as int?,
      schoolId: json['schoolId'] as int?,
      termId: json['termId'] as int?,
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
      studentIds: json['studentIds'] as String?,
      nameSurname: json['nameSurname'] as String?,
      idNo: json['idNo'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      job: json['job'] as String?,
      mail: json['mail'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      type: json['type'] as int?,
      description: json['description'] as String?,
      address: json['address'] as String?,
      confirmCode: json['confirmCode'] as String?,
      password: json['password'] as String?,
      permission: json['permission'] as int?,
      mobileLogin: json['mobileLogin'] as bool?,
    );

Map<String, dynamic> _$ParentModelToJson(ParentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'schoolId': instance.schoolId,
      'termId': instance.termId,
      'branchId': instance.branchId,
      'registrant': instance.registrant,
      'registrantId': instance.registrantId,
      'registrationDate': instance.registrationDate?.toIso8601String(),
      'modifier': instance.modifier,
      'modifierId': instance.modifierId,
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'active': instance.active,
      'studentIds': instance.studentIds,
      'nameSurname': instance.nameSurname,
      'idNo': instance.idNo,
      'phoneNumber': instance.phoneNumber,
      'job': instance.job,
      'mail': instance.mail,
      'birthDate': instance.birthDate?.toIso8601String(),
      'type': instance.type,
      'description': instance.description,
      'address': instance.address,
      'confirmCode': instance.confirmCode,
      'password': instance.password,
      'permission': instance.permission,
      'mobileLogin': instance.mobileLogin,
    };
