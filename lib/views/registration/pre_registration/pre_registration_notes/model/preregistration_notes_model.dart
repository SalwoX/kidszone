import 'package:json_annotation/json_annotation.dart';

part 'preregistration_notes_model.g.dart';

@JsonSerializable()
class PreregistrationNotesModel {
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
	int? preregistrationId;
	String? notes;

	PreregistrationNotesModel({
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
		this.preregistrationId,
		this.notes,
	});

	@override
	String toString() {
		return 'PreregistrationNotesModel(id: $id, schoolId: $schoolId, termId: $termId, branchId: $branchId, registrant: $registrant, registrantId: $registrantId, registrationDate: $registrationDate, modifier: $modifier, modifierId: $modifierId, modifiedDate: $modifiedDate, active: $active, preregistrationId: $preregistrationId, notes: $notes)';
	}

	factory PreregistrationNotesModel.fromJson(Map<String, dynamic> json) {
		return _$PreregistrationNotesModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$PreregistrationNotesModelToJson(this);

}
