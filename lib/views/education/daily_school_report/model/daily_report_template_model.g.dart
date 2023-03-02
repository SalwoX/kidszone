// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_report_template_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyReportTemplateModel _$DailyReportTemplateModelFromJson(
        Map<String, dynamic> json) =>
    DailyReportTemplateModel(
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
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => DailyReportTemplateDetailModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      templateId: json['templateId'] as int?,
      templateType: json['templateType'] as String?,
    );

Map<String, dynamic> _$DailyReportTemplateModelToJson(
        DailyReportTemplateModel instance) =>
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
      'templateId': instance.templateId,
      'templateType': instance.templateType,
      'details': instance.details,
    };
