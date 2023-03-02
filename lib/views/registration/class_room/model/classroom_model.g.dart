// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classroom_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassroomModel _$ClassroomModelFromJson(Map<String, dynamic> json) =>
    ClassroomModel(
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
      name: json['name'] as String?,
      classTour: json['classTour'] as int?,
      description: json['description'] as String?,
      imgUrl: json['imgUrl'] as String?,
      teacherId1: json['teacherId1'] as int?,
      teacherId2: json['teacherId2'] as int?,
    );

Map<String, dynamic> _$ClassroomModelToJson(ClassroomModel instance) =>
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
      'name': instance.name,
      'classTour': instance.classTour,
      'description': instance.description,
      'imgUrl': instance.imgUrl,
      'teacherId1': instance.teacherId1,
      'teacherId2': instance.teacherId2,
    };
