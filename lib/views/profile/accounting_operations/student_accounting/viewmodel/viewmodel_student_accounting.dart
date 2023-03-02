import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../data/repositories/repository_student_accounting.dart';
import 'package:kidszone_app/presentation/pages/accounting_process/model/student_accounting_detail_model.dart';
import 'package:kidszone_app/presentation/pages/accounting_process/model/student_accounting_model.dart';
import 'package:kidszone_app/views/_init/view_model/base_view_model.dart';
import 'package:mobx/mobx.dart';

import '../../../../../generated/locale_keys.g.dart';
import '../../accounting_statistics/damidata_kids_list.dart';

part 'viewmodel_student_accounting.g.dart';

class ViewModelStudentAccounting = ViewModelStudentAccountingBase
    with _$ViewModelStudentAccounting;

abstract class ViewModelStudentAccountingBase
    extends BaseViewModel<StudentAccountingModel, RepositorySudentAccounting>
    with Store {
  void setContext(BuildContext ctx) => this.ctx = ctx;

  @override
  var page_title =
      LocaleKeys.pageProfileAccountingProcess_student_accounting.tr();

  List<DataColumn> columns = [
    DataColumn(label: Text(LocaleKeys.studentAccountingPage_name.tr())),
    DataColumn(label: Text(LocaleKeys.studentAccountingPage_date.tr())),
    DataColumn(label: Text(LocaleKeys.studentAccountingPage_amount.tr())),
    DataColumn(label: Text(LocaleKeys.studentAccountingPage_paid.tr())),
    DataColumn(label: Text(LocaleKeys.studentAccountingPage_remaining.tr())),
  ];

  StudentAccountingModel? selectedStudent = StudentAccountingModel(
      id: 1,
      studentId: 1,
      termId: 2,
      startingPrice: 1500,
      agreementAmount: 3000,
      agreementDate: DateTime.now(),
      details: [
        StudentAccountingDetailModel(
          id: 0,
          amount: 1500,
          date: DateTime.now(),
          remaining: 1200,
          paid: 300,
        ),
        StudentAccountingDetailModel(
          id: 1,
          amount: 1200,
          date: DateTime.now(),
          remaining: 800,
          paid: 400,
        ),
        StudentAccountingDetailModel(
          id: 3,
          amount: 800,
          date: DateTime.now(),
          remaining: 300,
          paid: 500,
        ),
        StudentAccountingDetailModel(
          id: 2,
          amount: 1500,
          date: DateTime.now(),
          remaining: 1200,
          paid: 300,
        ),
        StudentAccountingDetailModel(
          id: 4,
          amount: 1200,
          date: DateTime.now(),
          remaining: 800,
          paid: 400,
        ),
        StudentAccountingDetailModel(
          id: 6,
          amount: 800,
          date: DateTime.now(),
          remaining: 300,
          paid: 500,
        ),
        StudentAccountingDetailModel(
          id: 5,
          amount: 1500,
          date: DateTime.now(),
          remaining: 1200,
          paid: 300,
        ),
        StudentAccountingDetailModel(
          id: 7,
          amount: 1200,
          date: DateTime.now(),
          remaining: 800,
          paid: 400,
        ),
        StudentAccountingDetailModel(
          id: 8,
          amount: 800,
          date: DateTime.now(),
          remaining: 300,
          paid: 500,
        ),
        StudentAccountingDetailModel(
          id: 9,
          amount: 1500,
          date: DateTime.now(),
          remaining: 1200,
          paid: 300,
        ),
        StudentAccountingDetailModel(
          id: 10,
          amount: 1200,
          date: DateTime.now(),
          remaining: 800,
          paid: 400,
        ),
        StudentAccountingDetailModel(
          id: 11,
          amount: 800,
          date: DateTime.now(),
          remaining: 300,
          paid: 500,
        ),
      ]);

  List<Map<String, dynamic>>? pickedKidInfo = [];

  List<Map<String, dynamic>>? kidList = KidListYoklama().kidList;

  TextEditingController commentController = TextEditingController();

  String educationPay = "...";
  List payList = [
    "...",
    LocaleKeys.condition_all_users.tr(),
    LocaleKeys.condition_class_list.tr(),
    LocaleKeys.condition_student_list.tr(),
    LocaleKeys.condition_just_teacher.tr()
  ];

  TextEditingController searchEdit = TextEditingController();

  double searchWidth = 0;

  bool allLoaded = false;
}
