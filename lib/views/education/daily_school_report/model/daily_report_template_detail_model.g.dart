// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_report_template_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyReportTemplateDetailModel _$DailyReportTemplateDetailModelFromJson(
        Map<String, dynamic> json) =>
    DailyReportTemplateDetailModel(
      id: json['id'] as int?,
      schoolId: json['schoolId'] as int?,
      branchId: json['branchId'] as int?,
      termId: json['termId'] as int?,
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
      title: json['title'] as String?,
      dailyReportTemplateMasterId: json['dailyReportTemplateMasterId'] as int?,
      contentType:
          $enumDecodeNullable(_$ContentTypeEnumMap, json['contentType']),
      reportType: $enumDecodeNullable(_$ReportTypeEnumMap, json['reportType']),
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
      rowNumber: json['rowNumber'] as int?,
    );

Map<String, dynamic> _$DailyReportTemplateDetailModelToJson(
        DailyReportTemplateDetailModel instance) =>
    <String, dynamic>{
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
      'dailyReportTemplateMasterId': instance.dailyReportTemplateMasterId,
      'rowNumber': instance.rowNumber,
      'title': instance.title,
      'options': instance.options,
      'reportType': _$ReportTypeEnumMap[instance.reportType],
      'contentType': _$ContentTypeEnumMap[instance.contentType],
    };

const _$ContentTypeEnumMap = {
  ContentType.haveOptions: 'haveOptions',
  ContentType.haveWritten: 'haveWritten',
};

const _$ReportTypeEnumMap = {
  ReportType.education: 'education',
  ReportType.daily: 'daily',
};
