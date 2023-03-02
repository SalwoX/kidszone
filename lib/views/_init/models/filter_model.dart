import 'package:json_annotation/json_annotation.dart';
part 'filter_model.g.dart';

@JsonSerializable()
class FilterModel {
  FilterModel({
    required this.fields,
    required this.page,
    required this.pageSize,
    this.sort,
  });

  List<Field> fields;
  int page;
  int pageSize;
  String? sort;

  factory FilterModel.fromJson(Map<String, dynamic> json) =>
      _$FilterModelFromJson(json);
  Map<String, dynamic> toJson() => _$FilterModelToJson(this);
}

@JsonSerializable()
class Field {
  Field({
    this.fieldName,
    this.fieldOperator,
    this.fieldValue,
  });

  String? fieldName;
  String? fieldOperator;
  String? fieldValue;

  factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);
  Map<String, dynamic> toJson() => _$FieldToJson(this);
}
