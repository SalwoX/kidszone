// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentModel _$StudentModelFromJson(Map<String, dynamic> json) => StudentModel(
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
      isCitizenTC: json['isCitizenTC'] as bool?,
      idNo: json['idNo'] as String?,
      lessonClass: json['lessonClass'] as int?,
      studyClass: json['studyClass'] as String?,
      studentNumber: json['studentNumber'] as String?,
      gender: json['gender'] as int?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      disease: json['disease'] as String?,
      bloodGroup: json['bloodGroup'] as int?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      address: json['address'] as String?,
      description: json['description'] as String?,
      schoolBusId: json['schoolBusId'] as int?,
      imgUrl: json['imgUrl'] as String?,
      files: json['files'] as String?,
    );

Map<String, dynamic> _$StudentModelToJson(StudentModel instance) =>
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
      'isCitizenTC': instance.isCitizenTC,
      'idNo': instance.idNo,
      'lessonClass': instance.lessonClass,
      'studyClass': instance.studyClass,
      'studentNumber': instance.studentNumber,
      'gender': instance.gender,
      'birthDate': instance.birthDate?.toIso8601String(),
      'disease': instance.disease,
      'bloodGroup': instance.bloodGroup,
      'startDate': instance.startDate?.toIso8601String(),
      'address': instance.address,
      'description': instance.description,
      'schoolBusId': instance.schoolBusId,
      'imgUrl': instance.imgUrl,
      'files': instance.files,
    };
