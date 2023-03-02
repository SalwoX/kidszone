// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_bus_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchoolBusModel _$SchoolBusModelFromJson(Map<String, dynamic> json) =>
    SchoolBusModel(
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
      profileName: json['profileName'] as String?,
      plate: json['plate'] as String?,
      driver: json['driver'] as String?,
      driverNum: json['driverNum'] as String?,
      attendant: json['attendant'] as String?,
      attendantNum: json['attendantNum'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$SchoolBusModelToJson(SchoolBusModel instance) =>
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
      'profileName': instance.profileName,
      'plate': instance.plate,
      'driver': instance.driver,
      'driverNum': instance.driverNum,
      'attendant': instance.attendant,
      'attendantNum': instance.attendantNum,
      'description': instance.description,
    };
