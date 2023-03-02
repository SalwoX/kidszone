import 'package:json_annotation/json_annotation.dart';

part 'collection_model.g.dart';

@JsonSerializable()
class CollectionModel {
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
  int? studentId;
  DateTime? date;
  DateTime? startingTime;
  String? description;
  int? amount;
  int? type;
  String? billNumber;
  int? paymentMethod;

  CollectionModel({
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
    this.studentId,
    this.date,
    this.startingTime,
    this.description,
    this.amount,
    this.type,
    this.billNumber,
    this.paymentMethod,
  });

  factory CollectionModel.fromJson(Map<String, dynamic> json) {
    return _$CollectionModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CollectionModelToJson(this);
}
