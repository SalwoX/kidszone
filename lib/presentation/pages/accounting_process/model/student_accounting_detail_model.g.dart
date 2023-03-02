// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_accounting_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentAccountingDetailModel _$StudentAccountingDetailModelFromJson(
        Map<String, dynamic> json) =>
    StudentAccountingDetailModel(
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
      studentAccountingId: json['studentAccountingId'] as int?,
      amount: (json['amount'] as num?)?.toDouble(),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      remaining: (json['remaining'] as num?)?.toDouble(),
      paid: (json['paid'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StudentAccountingDetailModelToJson(
        StudentAccountingDetailModel instance) =>
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
      'studentAccountingId': instance.studentAccountingId,
      'date': instance.date?.toIso8601String(),
      'amount': instance.amount,
      'paid': instance.paid,
      'remaining': instance.remaining,
    };
