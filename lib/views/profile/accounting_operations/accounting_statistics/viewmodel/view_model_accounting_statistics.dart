import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../data/repositories/repository_student_accounting.dart';
import '../../../../../presentation/pages/accounting_process/model/student_accounting_model.dart';
import '../../../../_init/view_model/base_view_model.dart';

part 'view_model_accounting_statistics.g.dart';

class ViewModelAccountingStatistics = _ViewModelAccountingStatisticsBase with _$ViewModelAccountingStatistics;

abstract class _ViewModelAccountingStatisticsBase extends BaseViewModel<StudentAccountingModel, RepositorySudentAccounting> with Store {
  @override
  void setContext(BuildContext ctx) => this.ctx = ctx;

  String pickedTur = "Nakit";

  List<String> turList = [
    "Nakit",
    "Havale / EFT",
  ];

//@override
  //var page_title = LocaleKeys.accountingStatisticsPage.tr();
}
