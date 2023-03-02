// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'installment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstallmentModel _$InstallmentModelFromJson(Map<String, dynamic> json) =>
    InstallmentModel(
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
      agreementId: json['agreementId'] as int?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      installment: json['installment'] as int?,
    );

Map<String, dynamic> _$InstallmentModelToJson(InstallmentModel instance) =>
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
      'agreementId': instance.agreementId,
      'date': instance.date?.toIso8601String(),
      'installment': instance.installment,
    };
