import 'package:json_annotation/json_annotation.dart';

part 'agreement_model.g.dart';

@JsonSerializable()
class AgreementModel {
  final int? id;
  final int? schoolId;
  final int? branchId;
  final String? registrant;
  final int? registrantId;
  final DateTime? registrationDate;
  final String? modifier;
  final int? modifierId;
  final DateTime? modifiedDate;
  final bool? active;
  final int? studentId;
  final int? termId;
  final String? agreementDate;
  final String? startTime;
  final String? firstInstallment;
  final int? startingFee;
  final int? agreementAmount;
  final String? discountDescription;
  final int? rate;
  final int? discount;
  final int? paymentMethod;
  final int? installmentCount;
  final int? paid;
  final int? remaining;
  final String? accountingNote;

  const AgreementModel({
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
    this.studentId,
    this.termId,
    this.agreementDate,
    this.startTime,
    this.firstInstallment,
    this.startingFee,
    this.agreementAmount,
    this.discountDescription,
    this.rate,
    this.discount,
    this.paymentMethod,
    this.installmentCount,
    this.paid,
    this.remaining,
    this.accountingNote,
  });

  @override
  String toString() {
    return 'AgreementModel(id: $id, schoolId: $schoolId, branchId: $branchId, registrant: $registrant, registrantId: $registrantId, registrationDate: $registrationDate, modifier: $modifier, modifierId: $modifierId, modifiedDate: $modifiedDate, active: $active, studentId: $studentId, termId: $termId, agreementDate: $agreementDate, startTime: $startTime, firstInstallment: $firstInstallment, startingFee: $startingFee, agreementAmount: $agreementAmount, discountDescription: $discountDescription, rate: $rate, discount: $discount, paymentMethod: $paymentMethod, installmentCount: $installmentCount, paid: $paid, remaining: $remaining, accountingNote: $accountingNote)';
  }

  factory AgreementModel.fromJson(Map<String, dynamic> json) {
    return _$AgreementModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AgreementModelToJson(this);
/*
  AgreementModel copyWith({
    int? id,
    int? okulId,
    int? subeId,
    String? kaydeden,
    int? kaydedenId,
    DateTime? kayitTarihi,
    String? degistiren,
    int? degistirenId,
    DateTime? degistirmeTarihi,
    bool? aktif,
    int? ogrenciId,
    int? donemId,
    String? sozlesmeTarihi,
    String? baslangicTarihi,
    String? ilkTaksitTutari,
    int? baslangicUcreti,
    int? sozlesmeTutari,
    String? iskontoAciklama,
    int? oran,
    int? iskonto,
    int? odemeTipi,
    int? taksitSayisi,
    int? odenen,
    int? kalan,
    String? muhasebeNot,
  }) {
    return AgreementModel(
      id: id ?? this.id,
      schoolId: okulId ?? this.schoolId,
      subeId: subeId ?? this.subeId,
      kaydeden: kaydeden ?? this.kaydeden,
      kaydedenId: kaydedenId ?? this.kaydedenId,
      kayitTarihi: kayitTarihi ?? this.kayitTarihi,
      degistiren: degistiren ?? this.degistiren,
      degistirenId: degistirenId ?? this.degistirenId,
      degistirmeTarihi: degistirmeTarihi ?? this.degistirmeTarihi,
      aktif: aktif ?? this.aktif,
      ogrenciId: ogrenciId ?? this.ogrenciId,
      donemId: donemId ?? this.donemId,
      sozlesmeTarihi: sozlesmeTarihi ?? this.sozlesmeTarihi,
      baslangicTarihi: baslangicTarihi ?? this.baslangicTarihi,
      ilkTaksitTutari: ilkTaksitTutari ?? this.ilkTaksitTutari,
      baslangicUcreti: baslangicUcreti ?? this.baslangicUcreti,
      sozlesmeTutari: sozlesmeTutari ?? this.sozlesmeTutari,
      iskontoAciklama: iskontoAciklama ?? this.iskontoAciklama,
      oran: oran ?? this.oran,
      iskonto: iskonto ?? this.iskonto,
      odemeTipi: odemeTipi ?? this.odemeTipi,
      taksitSayisi: taksitSayisi ?? this.taksitSayisi,
      odenen: odenen ?? this.odenen,
      kalan: kalan ?? this.kalan,
      muhasebeNot: muhasebeNot ?? this.muhasebeNot,
    );
  }*/
}
