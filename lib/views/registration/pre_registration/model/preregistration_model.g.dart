// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preregistration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreregistrationModel _$PreregistrationModelFromJson(
        Map<String, dynamic> json) =>
    PreregistrationModel(
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
      idNo: json['idNo'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      gender: json['gender'] as int?,
      fatherName: json['fatherName'] as String?,
      fatherNum: json['fatherNum'] as String?,
      motherName: json['motherName'] as String?,
      motherNum: json['motherNum'] as String?,
      description: json['description'] as String?,
      notes: json['notes'] as String?,
      registrationStatus: json['registrationStatus'] as int?,
    );

Map<String, dynamic> _$PreregistrationModelToJson(
        PreregistrationModel instance) =>
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
      'idNo': instance.idNo,
      'birthDate': instance.birthDate?.toIso8601String(),
      'gender': instance.gender,
      'fatherName': instance.fatherName,
      'fatherNum': instance.fatherNum,
      'motherName': instance.motherName,
      'motherNum': instance.motherNum,
      'description': instance.description,
      'notes': instance.notes,
      'registrationStatus': instance.registrationStatus,
    };
