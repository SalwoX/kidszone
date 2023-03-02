// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyReportModel _$DailyReportModelFromJson(Map<String, dynamic> json) =>
    DailyReportModel(
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
      dateToDay: json['dateToDay'] == null
          ? null
          : DateTime.parse(json['dateToDay'] as String),
      teacherNote: json['teacherNote'] as String?,
      reports: (json['reports'] as List<dynamic>?)
          ?.map((e) => Reports.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DailyReportModelToJson(DailyReportModel instance) =>
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
      'dateToDay': instance.dateToDay?.toIso8601String(),
      'teacherNote': instance.teacherNote,
      'reports': instance.reports,
    };
