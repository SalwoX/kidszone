// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchModel _$BranchModelFromJson(Map<String, dynamic> json) => BranchModel(
      branchName: json['branchName'] as String?,
      address: json['address'] as String?,
      logoUrl: json['logoUrl'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      mail: json['mail'] as String?,
      slogan: json['slogan'] as String?,
      id: json['id'] as int?,
      schoolId: json['schoolId'] as int?,
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
    );

Map<String, dynamic> _$BranchModelToJson(BranchModel instance) =>
    <String, dynamic>{
      'branchName': instance.branchName,
      'address': instance.address,
      'logoUrl': instance.logoUrl,
      'phoneNumber': instance.phoneNumber,
      'mail': instance.mail,
      'slogan': instance.slogan,
      'id': instance.id,
      'schoolId': instance.schoolId,
      'registrant': instance.registrant,
      'registrantId': instance.registrantId,
      'registrationDate': instance.registrationDate?.toIso8601String(),
      'modifier': instance.modifier,
      'modifierId': instance.modifierId,
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'active': instance.active,
    };
