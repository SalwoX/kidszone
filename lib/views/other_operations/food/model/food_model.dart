import 'package:json_annotation/json_annotation.dart';

part 'food_model.g.dart';

@JsonSerializable()
class FoodModel {
  int? id;
  int? schoolId;
  int? termId;
  int? branchId;
  String? registrant;
  int? registrantId;
  DateTime? registrationDate;
  String? modifier;
  int? modifierId;
  DateTime? modifiedDate;
  bool? active;
  String? meal;
  DateTime? date;
  String? calorie;
  String? mainBreakfast;
  String? drinks;
  String? sweets;
  String? title;

  FoodModel({
    this.id,
    this.schoolId,
    this.termId,
    this.branchId,
    this.registrant,
    this.registrantId,
    this.registrationDate,
    this.modifier,
    this.modifierId,
    this.modifiedDate,
    this.active,
    this.meal,
    this.date,
    this.calorie,
    this.mainBreakfast,
    this.drinks,
    this.sweets,
    this.title,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return _$FoodModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FoodModelToJson(this);
}
