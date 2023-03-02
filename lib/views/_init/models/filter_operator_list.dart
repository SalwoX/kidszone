import 'package:json_annotation/json_annotation.dart';

import 'operator_date.dart';
import 'operator_enums.dart';
import 'operator_number.dart';
import 'operator_string.dart';

part 'filter_operator_list.g.dart';

@JsonSerializable()
class FilterOperatorList {
  @JsonKey(name: 'OperatorDate')
  OperatorDate? operatorDate;
  @JsonKey(name: 'OperatorEnums')
  OperatorEnums? operatorEnums;
  @JsonKey(name: 'OperatorNumber')
  OperatorNumber? operatorNumber;
  @JsonKey(name: 'OperatorString')
  OperatorString? operatorString;

  FilterOperatorList({
    this.operatorDate,
    this.operatorEnums,
    this.operatorNumber,
    this.operatorString,
  });

  @override
  String toString() {
    return 'FilterOperatorList(operatorDate: $operatorDate, operatorEnums: $operatorEnums, operatorNumber: $operatorNumber, operatorString: $operatorString)';
  }

  factory FilterOperatorList.fromJson(Map<String, dynamic> json) {
    return _$FilterOperatorListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FilterOperatorListToJson(this);
}
