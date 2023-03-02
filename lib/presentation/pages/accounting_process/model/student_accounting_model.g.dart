// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_accounting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentAccountingModel _$StudentAccountingModelFromJson(
        Map<String, dynamic> json) =>
    StudentAccountingModel(
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
      startingPrice: (json['startingPrice'] as num?)?.toDouble(),
      agreementDate: json['agreementDate'] == null
          ? null
          : DateTime.parse(json['agreementDate'] as String),
      details: (json['details'] as List<dynamic>?)
          ?.map((e) =>
              StudentAccountingDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      agreementAmount: (json['agreementAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StudentAccountingModelToJson(
        StudentAccountingModel instance) =>
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
      'agreementDate': instance.agreementDate?.toIso8601String(),
      'startingPrice': instance.startingPrice,
      'agreementAmount': instance.agreementAmount,
      'details': instance.details,
    };
