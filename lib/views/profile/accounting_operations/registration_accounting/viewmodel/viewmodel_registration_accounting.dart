import 'package:flutter/cupertino.dart';
import '../../../../../data/repositories/repository_student_accounting.dart';
import '../../../../../presentation/pages/accounting_process/model/student_accounting_model.dart';
import 'package:kidszone_app/views/_init/view_model/base_view_model.dart';
import 'package:mobx/mobx.dart';

import '../../../../../data/repositories/repository_common.dart';
import '../../../../../register.dart';

part 'viewmodel_registration_accounting.g.dart';

class ViewModelRegistrationAccounting = _ViewModelRegistrationAccountingBase
    with _$ViewModelRegistrationAccounting;

abstract class _ViewModelRegistrationAccountingBase
    extends BaseViewModel<StudentAccountingModel, RepositorySudentAccounting>
    with Store {
  @override
  void setContext(BuildContext ctx) => this.ctx = ctx;

  TextEditingController agreementAmountController = TextEditingController();
  TextEditingController dropdownController = TextEditingController();
  TextEditingController discountAmountController = TextEditingController();
  TextEditingController discountRateController = TextEditingController();
  TextEditingController advanceController = TextEditingController();
  TextEditingController totalController = TextEditingController();

  int paymentDay = DateTime.now().day;
  int installmentNum = 1;
  var repCommon = resolve<RepositoryCommon>();
  var repRegistration = resolve<RepositorySudentAccounting>();

  var model = StudentAccountingModel(

  );
}
