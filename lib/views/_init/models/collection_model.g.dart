// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionModel _$CollectionModelFromJson(Map<String, dynamic> json) =>
    CollectionModel(
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
      studentId: json['studentId'] as int?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      startingTime: json['startingTime'] == null
          ? null
          : DateTime.parse(json['startingTime'] as String),
      description: json['description'] as String?,
      amount: json['amount'] as int?,
      type: json['type'] as int?,
      billNumber: json['billNumber'] as String?,
      paymentMethod: json['paymentMethod'] as int?,
    );

Map<String, dynamic> _$CollectionModelToJson(CollectionModel instance) =>
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
      'studentId': instance.studentId,
      'date': instance.date?.toIso8601String(),
      'startingTime': instance.startingTime?.toIso8601String(),
      'description': instance.description,
      'amount': instance.amount,
      'type': instance.type,
      'billNumber': instance.billNumber,
      'paymentMethod': instance.paymentMethod,
    };
