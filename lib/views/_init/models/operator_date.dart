import 'package:json_annotation/json_annotation.dart';

part 'operator_date.g.dart';

@JsonSerializable()
class OperatorDate {
  String? eq;
  String? gt;
  String? gte;
  String? lt;
  String? lte;
  String? neq;
  String? isnull;
  String? isNotNull;

  OperatorDate({
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
    return 'OperatorDate(eq: $eq, gt: $gt, gte: $gte, lt: $lt, lte: $lte, neq: $neq, isnull: $isnull, isNotNull: $isNotNull)';
  }

  factory OperatorDate.fromJson(Map<String, dynamic> json) {
    return _$OperatorDateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OperatorDateToJson(this);
}
