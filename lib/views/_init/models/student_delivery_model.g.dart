// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_delivery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentDeliveryModel _$StudentDeliveryModelFromJson(
        Map<String, dynamic> json) =>
    StudentDeliveryModel(
      id: json['id'] as int?,
      schoolId: json['schoolId'] as int?,
      termId: json['termId'] as int?,
      branchId: json['branchId'] as int?,
      registrant: json['registrant'] as String?,
      registrantId: json['registrantId'] as int?,
      registrationId: json['registrationId'] == null
          ? null
          : DateTime.parse(json['registrationId'] as String),
      modifier: json['modifier'] as String?,
      modifierId: json['modifierId'] as int?,
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      active: json['active'] as bool?,
      executiveId: json['executiveId'] as int?,
      timeToDay: json['timeToDay'] == null
          ? null
          : DateTime.parse(json['timeToDay'] as String),
      studentList: json['studentList'] as String?,
      studentAbsenteeism: json['studentAbsenteeism'] as String?,
      studentDeliveryMethod: json['studentDeliveryMethod'] as int?,
      receiverNameSurname: json['receiverNameSurname'] as String?,
      receiverPhoneNumber: json['receiverPhoneNumber'] as String?,
      receiverProximity: json['receiverProximity'] as String?,
      qrCode: json['qrCode'] as String?,
    );

Map<String, dynamic> _$StudentDeliveryModelToJson(
        StudentDeliveryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'schoolId': instance.schoolId,
      'termId': instance.termId,
      'branchId': instance.branchId,
      'registrant': instance.registrant,
      'registrantId': instance.registrantId,
      'registrationId': instance.registrationId?.toIso8601String(),
      'modifier': instance.modifier,
      'modifierId': instance.modifierId,
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'active': instance.active,
      'executiveId': instance.executiveId,
      'timeToDay': instance.timeToDay?.toIso8601String(),
      'studentList': instance.studentList,
      'studentAbsenteeism': instance.studentAbsenteeism,
      'studentDeliveryMethod': instance.studentDeliveryMethod,
      'receiverNameSurname': instance.receiverNameSurname,
      'receiverPhoneNumber': instance.receiverPhoneNumber,
      'receiverProximity': instance.receiverProximity,
      'qrCode': instance.qrCode,
    };
