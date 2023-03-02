// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reports _$ReportsFromJson(Map<String, dynamic> json) => Reports(
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
      dailyReportId: json['dailyReportId'] as int?,
      rowNumber: json['rowNumber'] as int?,
      title: json['title'] as String?,
      value: json['value'] as String?,
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
      termId: json['termId'] as int?,
      contentType:
          $enumDecodeNullable(_$ContentTypeEnumMap, json['contentType']),
      reportType: $enumDecodeNullable(_$ReportTypeEnumMap, json['reportType']),
    );

Map<String, dynamic> _$ReportsToJson(Reports instance) => <String, dynamic>{
      'id': instance.id,
      'schoolId': instance.schoolId,
      'branchId': instance.branchId,
      'termId': instance.termId,
      'registrant': instance.registrant,
      'registrantId': instance.registrantId,
      'registrationDate': instance.registrationDate?.toIso8601String(),
      'modifier': instance.modifier,
      'modifierId': instance.modifierId,
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'active': instance.active,
      'dailyReportId': instance.dailyReportId,
      'rowNumber': instance.rowNumber,
      'title': instance.title,
      'options': instance.options,
      'reportType': _$ReportTypeEnumMap[instance.reportType],
      'contentType': _$ContentTypeEnumMap[instance.contentType],
      'value': instance.value,
    };

const _$ContentTypeEnumMap = {
  ContentType.haveOptions: 'haveOptions',
  ContentType.haveWritten: 'haveWritten',
};

const _$ReportTypeEnumMap = {
  ReportType.education: 'education',
  ReportType.daily: 'daily',
};
