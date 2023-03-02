import 'package:json_annotation/json_annotation.dart';

part 'operator_number.g.dart';

@JsonSerializable()
class OperatorNumber {
  String? eq;
  String? gt;
  String? gte;
  String? lt;
  String? lte;
  String? neq;
  String? isnull;
  String? isNotNull;

  OperatorNumber({
    this.eq,
    this.gt,
    this.gte,
    this.lt,
    this.lte,
    this.neq,
    this.isnull,
    this.isNotNull,
  });

  @override
  String toString() {
    return 'OperatorNumber(eq: $eq, gt: $gt, gte: $gte, lt: $lt, lte: $lte, neq: $neq, isnull: $isnull, isNotNull: $isNotNull)';
  }

  factory OperatorNumber.fromJson(Map<String, dynamic> json) {
    return _$OperatorNumberFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OperatorNumberToJson(this);
}
