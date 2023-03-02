import 'package:json_annotation/json_annotation.dart';

part 'filter_widget_model.g.dart';

@JsonSerializable()
class FilterWidgetModel {
  FilterWidgetModel({
    required this.fieldName,
    required this.type,
    required this.fieldValue,
    required this.fieldLabel,
  });

  String fieldName;
  String type;
  String fieldValue;
  String fieldLabel;

    factory FilterWidgetModel.fromJson(Map<String, dynamic> json) =>
      _$FilterWidgetModelFromJson(json);
  Map<String, dynamic> toJson() => _$FilterWidgetModelToJson(this);
}
