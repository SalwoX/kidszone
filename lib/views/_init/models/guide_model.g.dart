// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guide_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuideModel _$GuideModelFromJson(Map<String, dynamic> json) => GuideModel(
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
      phoneDescription: json['phoneDescription'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      mailDescription: json['mailDescription'] as String?,
      mail: json['mail'] as String?,
      addressDescription: json['addressDescription'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$GuideModelToJson(GuideModel instance) =>
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
      'phoneDescription': instance.phoneDescription,
      'phoneNumber': instance.phoneNumber,
      'mailDescription': instance.mailDescription,
      'mail': instance.mail,
      'addressDescription': instance.addressDescription,
      'address': instance.address,
    };
