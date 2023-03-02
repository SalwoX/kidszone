import 'package:json_annotation/json_annotation.dart';
import '../../../_init/models/term_model.dart';
part 'settings_model.g.dart';

@JsonSerializable()
class SettingsModel {
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
  String? workDays;
  int? advancedFoodMenuGroupId;
  List<TermModel>? termRegistrationModel;

  SettingsModel({
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
    this.workDays,
    this.advancedFoodMenuGroupId,
    this.termRegistrationModel,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return _$SettingsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SettingsModelToJson(this);
}
