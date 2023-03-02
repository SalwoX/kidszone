import 'package:json_annotation/json_annotation.dart';

part 'mobile_result.g.dart';

@JsonSerializable()
class MobileResult {
  String? statusCode;
  dynamic data;
  bool? result;
  String? message;

  MobileResult({required this.statusCode, required this.data, required this.result, required this.message});

  factory MobileResult.fromJson(Map<String, dynamic> json) => _$MobileResultFromJson(json);
  Map<String, dynamic> toJson() => _$MobileResultToJson(this);

  @override
  String toString() {
    return 'MobileResult{id: $statusCode, data: $data, result: $result, message: $message}';
  }
}
