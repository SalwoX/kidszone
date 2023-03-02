import 'package:json_annotation/json_annotation.dart';

part 'operator_string.g.dart';

@JsonSerializable()
class OperatorString {
  String? contains;
  String? doesnotcontain;
  String? endswith;
  String? eq;
  String? neq;
  String? startswith;
  String? isnull;
  String? isnotnull;
  String? isempty;
  String? isnotempty;
  String? isnullorempty;
  String? isnotnullorempty;

  OperatorString({
    this.contains,
    this.doesnotcontain,
    this.endswith,
    this.eq,
    this.neq,
    this.startswith,
    this.isnull,
    this.isnotnull,
    this.isempty,
    this.isnotempty,
    this.isnullorempty,
    this.isnotnullorempty,
  });

  @override
  String toString() {
    return 'OperatorString(contains: $contains, doesnotcontain: $doesnotcontain, endswith: $endswith, eq: $eq, neq: $neq, startswith: $startswith, isnull: $isnull, isnotnull: $isnotnull, isempty: $isempty, isnotempty: $isnotempty, isnullorempty: $isnullorempty, isnotnullorempty: $isnotnullorempty)';
  }

  factory OperatorString.fromJson(Map<String, dynamic> json) {
    return _$OperatorStringFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OperatorStringToJson(this);
}
