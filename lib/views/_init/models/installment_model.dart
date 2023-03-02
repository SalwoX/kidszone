import 'package:json_annotation/json_annotation.dart';

part 'installment_model.g.dart';

@JsonSerializable()
class InstallmentModel {
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
  int? agreementId;
  DateTime? date;
  int? installment;

  InstallmentModel({
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
    this.agreementId,
    this.date,
    this.installment,
  });

  factory InstallmentModel.fromJson(Map<String, dynamic> json) {
    return _$InstallmentModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InstallmentModelToJson(this);
}
