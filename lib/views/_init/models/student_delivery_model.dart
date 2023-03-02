import 'package:json_annotation/json_annotation.dart';

part 'student_delivery_model.g.dart';

@JsonSerializable()
class StudentDeliveryModel {
  int? id;
  int? schoolId;
  int? termId;
  int? branchId;
  String? registrant;
  int? registrantId;
  DateTime? registrationId;
  String? modifier;
  int? modifierId;
  DateTime? modifiedDate;
  bool? active;
  int? executiveId;
  DateTime? timeToDay;
  String? studentList;
  String? studentAbsenteeism;
  int? studentDeliveryMethod;
  String? receiverNameSurname;
  String? receiverPhoneNumber;
  String? receiverProximity;
  String? qrCode;

  StudentDeliveryModel({
    this.id,
    this.schoolId,
    this.termId,
    this.branchId,
    this.registrant,
    this.registrantId,
    this.registrationId,
    this.modifier,
    this.modifierId,
    this.modifiedDate,
    this.active,
    this.executiveId,
    this.timeToDay,
    this.studentList,
    this.studentAbsenteeism,
    this.studentDeliveryMethod,
    this.receiverNameSurname,
    this.receiverPhoneNumber,
    this.receiverProximity,
    this.qrCode,
  });

  @override
  String toString() {
    return 'StudentDeliveryModel(id: $id, schoolId: $schoolId, termId: $termId, branchId: $branchId, registrant: $registrant, registrantId: $registrantId, registrationId: $registrationId, modifier: $modifier, modifierId: $modifierId, modifiedDate: $modifiedDate, active: $active, executiveId: $executiveId, timeToDay: $timeToDay, studentList: $studentList, studentAbsenteeism: $studentAbsenteeism, studentDeliveryMethod: $studentDeliveryMethod, receiverNameSurname: $receiverNameSurname, receiverPhoneNumber: $receiverPhoneNumber, receiverProximity: $receiverProximity, qrCode: $qrCode)';
  }

  factory StudentDeliveryModel.fromJson(Map<String, dynamic> json) {
    return _$StudentDeliveryModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StudentDeliveryModelToJson(this);

  StudentDeliveryModel copyWith({
    int? id,
    int? schoolId,
    int? termId,
    int? branchId,
    String? registrant,
    int? registrantId,
    DateTime? registrationId,
    String? modifier,
    int? modifierId,
    DateTime? modifiedDate,
    bool? active,
    int? executiveId,
    DateTime? timeToDay,
    String? studentList,
    String? studentAbsenteeism,
    int? studentDeliveryMethod,
    String? receiverNameSurname,
    String? receiverPhoneNumber,
    String? receiverProximity,
    String? qrCode,
  }) {
    return StudentDeliveryModel(
      id: id ?? this.id,
      schoolId: schoolId ?? this.schoolId,
      termId: termId ?? this.termId,
      branchId: branchId ?? this.branchId,
      registrant: registrant ?? this.registrant,
      registrantId: registrantId ?? this.registrantId,
      registrationId: registrationId ?? this.registrationId,
      modifier: modifier ?? this.modifier,
      modifierId: modifierId ?? this.modifierId,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      active: active ?? this.active,
      executiveId: executiveId ?? this.executiveId,
      timeToDay: timeToDay ?? this.timeToDay,
      studentList: studentList ?? this.studentList,
      studentAbsenteeism: studentAbsenteeism ?? this.studentAbsenteeism,
      studentDeliveryMethod:
          studentDeliveryMethod ?? this.studentDeliveryMethod,
      receiverNameSurname: receiverNameSurname ?? this.receiverNameSurname,
      receiverPhoneNumber: receiverPhoneNumber ?? this.receiverPhoneNumber,
      receiverProximity: receiverProximity ?? this.receiverProximity,
      qrCode: qrCode ?? this.qrCode,
    );
  }
}
