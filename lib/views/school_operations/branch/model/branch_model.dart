import 'package:json_annotation/json_annotation.dart';

part 'branch_model.g.dart';

@JsonSerializable()
class BranchModel {
  BranchModel({
    this.branchName,
    this.address,
    this.logoUrl,
    this.phoneNumber,
    this.mail,
    this.slogan,
    this.id,
    this.schoolId,
    this.registrant,
    this.registrantId,
    this.registrationDate,
    this.modifier,
    this.modifierId,
    this.modifiedDate,
    this.active,
  });

  String? branchName;
  String? address;
  String? logoUrl;
  String? phoneNumber;
  String? mail;
  String? slogan;
  int? id;
  int? schoolId;
  String? registrant;
  int? registrantId;
  DateTime? registrationDate;
  String? modifier;
  int? modifierId;
  DateTime? modifiedDate;
  bool? active;

  factory BranchModel.fromJson(Map<String, dynamic> json) =>
      _$BranchModelFromJson(json);
  Map<String, dynamic> toJson() => _$BranchModelToJson(this);
}
