import 'package:json_annotation/json_annotation.dart';

part 'group_model.g.dart';

@JsonSerializable()
class GroupModel {
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
  int? type;
  String? name;
  String? description;

  GroupModel({
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
    this.type,
    this.name,
    this.description,
  });

  @override
  String toString() {
    return 'GroupModel(id: $id, schoolId: $schoolId, termId: $termId, branchId: $branchId, registrant: $registrant, registrantId: $registrantId, registrationDate: $registrationDate, modifier: $modifier, modifierId: $modifierId, modifiedDate: $modifiedDate, active: $active, type: $type, name: $name, description: $description)';
  }

  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return _$GroupModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GroupModelToJson(this);

}
