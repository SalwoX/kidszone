import 'package:json_annotation/json_annotation.dart';

part 'student_model.g.dart';

@JsonSerializable()
class StudentModel {
  int? id;
  int? schoolId;
  int? branchId;
  String? registrant;
  int? registrantId;
  DateTime? registrationDate;
  String? modifier;
  int? modifierId;
  DateTime? modifiedDate;
  bool? active;
  int? termId;
  String? nameSurname;
  bool? isCitizenTC;
  String? idNo;
  int? lessonClass;
  String? studyClass;
  String? studentNumber;
  int? gender;
  DateTime? birthDate;
  String? disease;
  int? bloodGroup;
  DateTime? startDate;
  String? address;
  String? description;
  int? schoolBusId;
  String? imgUrl;
  String? files;


  StudentModel({
    this.id,
    this.schoolId,
    this.branchId,
    this.registrant,
    this.registrantId,
    this.registrationDate,
    this.modifier,
    this.modifierId,
    this.modifiedDate,
    this.active,
    this.termId,
    this.nameSurname,
    this.isCitizenTC,
    this.idNo,
    this.lessonClass,
    this.studyClass,
    this.studentNumber,
    this.gender,
    this.birthDate,
    this.disease,
    this.bloodGroup,
    this.startDate,
    this.address,
    this.description,
    this.schoolBusId,
    this.imgUrl,
    this.files,
  });

  @override
  String toString() {
    return 'StudentModel(id: $id, schoolId: $schoolId, branchId: $branchId, registrant: $registrant, registrantId: $registrantId, registrationDate: $registrationDate, modifier: $modifier, modifierId: $modifierId, modifiedDate: $modifiedDate, active: $active, termId: $termId, nameSurname: $nameSurname, isCitizenTC: $isCitizenTC, idNo: $idNo, lessonClass: $lessonClass, studyClass: $studyClass, studentNumber: $studentNumber, gender: $gender, dateOfBirth: $birthDate, disease: $disease, bloodGroup: $bloodGroup, startTime: $startDate, address: $address, description: $description, schoolBusId: $schoolBusId, imgUrl: $imgUrl, files: $files)';
  }

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return _$StudentModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StudentModelToJson(this);

}
