// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agreement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgreementModel _$AgreementModelFromJson(Map<String, dynamic> json) =>
    AgreementModel(
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
      studentId: json['studentId'] as int?,
      termId: json['termId'] as int?,
      agreementDate: json['agreementDate'] as String?,
      startTime: json['startTime'] as String?,
      firstInstallment: json['firstInstallment'] as String?,
      startingFee: json['startingFee'] as int?,
      agreementAmount: json['agreementAmount'] as int?,
      discountDescription: json['discountDescription'] as String?,
      rate: json['rate'] as int?,
      discount: json['discount'] as int?,
      paymentMethod: json['paymentMethod'] as int?,
      installmentCount: json['installmentCount'] as int?,
      paid: json['paid'] as int?,
      remaining: json['remaining'] as int?,
      accountingNote: json['accountingNote'] as String?,
    );

Map<String, dynamic> _$AgreementModelToJson(AgreementModel instance) =>
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
      'studentId': instance.studentId,
      'termId': instance.termId,
      'agreementDate': instance.agreementDate,
      'startTime': instance.startTime,
      'firstInstallment': instance.firstInstallment,
      'startingFee': instance.startingFee,
      'agreementAmount': instance.agreementAmount,
      'discountDescription': instance.discountDescription,
      'rate': instance.rate,
      'discount': instance.discount,
      'paymentMethod': instance.paymentMethod,
      'installmentCount': instance.installmentCount,
      'paid': instance.paid,
      'remaining': instance.remaining,
      'accountingNote': instance.accountingNote,
    };
