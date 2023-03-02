import 'package:json_annotation/json_annotation.dart';

part 'operator_enums.g.dart';

@JsonSerializable()
class OperatorEnums {
  String? eq;
  String? neq;
  String? isnull;
  String? isNotNull;

  OperatorEnums({this.eq, this.neq, this.isnull, this.isNotNull});

  @override
  String toString() {
    return 'OperatorEnums(eq: $eq, neq: $neq, isnull: $isnull, isNotNull: $isNotNull)';
  }

  factory OperatorEnums.fromJson(Map<String, dynamic> json) {
    return _$OperatorEnumsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OperatorEnumsToJson(this);
}
