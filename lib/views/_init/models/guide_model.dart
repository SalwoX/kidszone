import 'package:json_annotation/json_annotation.dart';

part 'guide_model.g.dart';

@JsonSerializable()
class GuideModel {
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
  String? phoneDescription;
  String? phoneNumber;
  String? mailDescription;
  String? mail;
  String? addressDescription;
  String? address;

  GuideModel({
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
    this.phoneDescription,
    this.phoneNumber,
    this.mailDescription,
    this.mail,
    this.addressDescription,
    this.address,
  });

  @override
  String toString() {
    return 'GuideModel(id: $id, schoolId: $schoolId, termId: $termId, branchId: $branchId, registrant: $registrant, registrantId: $registrantId, registrationDate: $registrationDate, modifier: $modifier, modifierId: $modifierId, modifiedDate: $modifiedDate, active: $active, phoneDescription: $phoneDescription, phoneNumber: $phoneNumber, mailDescription: $mailDescription, mail: $mail, addressDescription: $addressDescription, address: $address)';
  }

  factory GuideModel.fromJson(Map<String, dynamic> json) {
    return _$GuideModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GuideModelToJson(this);
/*
  RehberModel copyWith({
    int? id,
    int? okulId,
    int? donemId,
    int? subeId,
    String? kaydeden,
    int? kaydedenId,
    DateTime? kayitTarihi,
    String? degistiren,
    int? degistirenId,
    DateTime? degistirmeTarihi,
    bool? aktif,
    String? telAciklama,
    String? telefon,
    String? mailAciklama,
    String? mail,
    String? adresAciklama,
    String? adres,
  }) {
    return RehberModel(
      id: id ?? this.id,
      okulId: okulId ?? this.okulId,
      donemId: donemId ?? this.donemId,
      subeId: subeId ?? this.subeId,
      kaydeden: kaydeden ?? this.kaydeden,
      kaydedenId: kaydedenId ?? this.kaydedenId,
      kayitTarihi: kayitTarihi ?? this.kayitTarihi,
      degistiren: degistiren ?? this.degistiren,
      degistirenId: degistirenId ?? this.degistirenId,
      degistirmeTarihi: degistirmeTarihi ?? this.degistirmeTarihi,
      aktif: aktif ?? this.aktif,
      telAciklama: telAciklama ?? this.telAciklama,
      telefon: telefon ?? this.telefon,
      mailAciklama: mailAciklama ?? this.mailAciklama,
      mail: mail ?? this.mail,
      adresAciklama: adresAciklama ?? this.adresAciklama,
      adres: adres ?? this.adres,
    );
  }*/
}
