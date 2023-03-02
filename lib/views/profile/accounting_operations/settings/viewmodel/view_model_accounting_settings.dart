import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../data/repositories/repository_student_accounting.dart';
import '../../../../../presentation/pages/accounting_process/model/student_accounting_model.dart';
import '../../../../_init/view_model/base_view_model.dart';

part 'view_model_accounting_settings.g.dart';


class ViewModelAccountingSettings = _ViewModelAccountingSettingsBase
    with _$ViewModelAccountingSettings;

abstract class _ViewModelAccountingSettingsBase
    extends BaseViewModel<StudentAccountingModel, RepositorySudentAccounting>
    with Store {
  @override
  void setContext(BuildContext ctx) => this.ctx = ctx;

  TextEditingController nakitKasasiEdit=TextEditingController();
  TextEditingController krediKartiEdit=TextEditingController();
  TextEditingController havaleEftEdit=TextEditingController();
  TextEditingController edit4=TextEditingController();
  TextEditingController edit5=TextEditingController();
  TextEditingController edit6=TextEditingController();
  TextEditingController edit7=TextEditingController();
  TextEditingController edit8=TextEditingController();
}
