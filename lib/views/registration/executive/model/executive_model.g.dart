// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'executive_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExecutiveModel _$ExecutiveModelFromJson(Map<String, dynamic> json) =>
    ExecutiveModel(
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
      nameSurname: json['nameSurname'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      password: json['password'] as String?,
      imgUrl: json['imgUrl'] as String?,
      permission: json['permission'] as String?,
      description: json['description'] as String?,
      mobileLogin: json['mobileLogin'] as bool?,
      webLogin: json['webLogin'] as bool?,
      admin: json['admin'] as int?,
    );

Map<String, dynamic> _$ExecutiveModelToJson(ExecutiveModel instance) =>
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
      'nameSurname': instance.nameSurname,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'imgUrl': instance.imgUrl,
      'permission': instance.permission,
      'description': instance.description,
      'mobileLogin': instance.mobileLogin,
      'webLogin': instance.webLogin,
      'admin': instance.admin,
    };
