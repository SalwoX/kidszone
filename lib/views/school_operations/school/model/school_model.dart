import 'package:json_annotation/json_annotation.dart';

part 'school_model.g.dart';



@JsonSerializable()
class SchoolModel {
  SchoolModel({
    this.id,
    this.name,
    this.degree,
    this.packageGroup,
    this.registrant,
    this.registrantId,
    this.registrationDate,
    this.modifier,
    this.modifierId,
    this.modifiedDate,
    this.active,
    this.packageGroupName,
    this.studentCount,
  });

  int? id;
  String? name;
  String? degree;
  int? packageGroup;
  String? registrant;
  int? registrantId;
  DateTime? registrationDate;
  String? modifier;
  int? modifierId;
  DateTime? modifiedDate;
  bool? active;
  String? packageGroupName;
  int? studentCount;

    factory SchoolModel.fromJson(Map<String, dynamic> json) =>
      _$SchoolModelFromJson(json);
  Map<String, dynamic> toJson() => _$SchoolModelToJson(this);
}
