// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceModel _$AttendanceModelFromJson(Map<String, dynamic> json) =>
    AttendanceModel(
      id: json['id'] as int?,
      nameSurname: json['nameSurname'] as String?,
      gender: json['gender'] as int?,
      detail: (json['detail'] as List<dynamic>?)
          ?.map((e) => AttendanceDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AttendanceModelToJson(AttendanceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameSurname': instance.nameSurname,
      'gender': instance.gender,
      'detail': instance.detail,
    };

AttendanceDetail _$AttendanceDetailFromJson(Map<String, dynamic> json) =>
    AttendanceDetail(
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
      studentId: json['studentId'] as int?,
      receiver: json['receiver'] as String?,
      submitter: json['submitter'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      checkInTime: json['checkInTime'] as String?,
      checkOutTime: json['checkOutTime'] as String?,
    );

Map<String, dynamic> _$AttendanceDetailToJson(AttendanceDetail instance) =>
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
      'studentId': instance.studentId,
      'receiver': instance.receiver,
      'submitter': instance.submitter,
      'date': instance.date?.toIso8601String(),
      'checkInTime': instance.checkInTime,
      'checkOutTime': instance.checkOutTime,
    };
