import 'package:flutter/material.dart';
import '../../../../../data/repositories/repository_student_accounting.dart';
import 'package:kidszone_app/presentation/pages/accounting_process/model/student_accounting_model.dart';
import 'package:kidszone_app/views/_init/view_model/base_view_model.dart';
import 'package:mobx/mobx.dart';

part 'view_model_show_payments.g.dart';

class ViewModelShowPayments = _ViewModelShowPaymentsBase with _$ViewModelShowPayments;

abstract class _ViewModelShowPaymentsBase extends BaseViewModel<StudentAccountingModel, RepositorySudentAccounting> with Store {
  @override
  void setContext(BuildContext ctx) => this.ctx = ctx;

  String pickedOdeme = "...";
  String pickedKasa = "...";
  List<String> odemeList = [
    "...",
    "Tüm kullanıcılar",
    "Sınıf listesi",
    "Öğrenci listesi",
    "Sadece öğretmenler"
  ];
  List<String> kasaList = [
    "...",
    "Tüm kullanıcılar",
    "Sınıf listesi",
    "Öğrenci listesi",
    "Sadece öğretmenler"
  ];

}