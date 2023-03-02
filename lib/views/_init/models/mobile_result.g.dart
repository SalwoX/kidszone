// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MobileResult _$MobileResultFromJson(Map<String, dynamic> json) => MobileResult(
      statusCode: json['statusCode'] as String?,
      data: json['data'],
      result: json['result'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$MobileResultToJson(MobileResult instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'data': instance.data,
      'result': instance.result,
      'message': instance.message,
    };
