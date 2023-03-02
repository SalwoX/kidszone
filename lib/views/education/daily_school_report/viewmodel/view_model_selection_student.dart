import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../data/repositories/repository_common.dart';
import '../../../../register.dart';
import '../../../_init/models/mobile_result.dart';
import '../../../_init/view_model/base_view_model.dart';
import '../../../registration/student/model/student_model.dart';
import '../../../registration/student/service/repository_student.dart';
import '../model/daily_report_model.dart';
import '../service/repository_dailyreport.dart';

part 'view_model_selection_student.g.dart';

class ViewModelSelectionStudent = ViewModelStudentSelectionBase with _$ViewModelSelectionStudent;

abstract class ViewModelStudentSelectionBase extends BaseViewModel<StudentModel, RepositoryStudent> with Store {
  @override
  void setContext(BuildContext ctx) => this.ctx = ctx;

  final formKey = GlobalKey<FormState>();

  @override
  var page_title = "Öğrenci Seçin";

  @override
  var page_subTitle = "Karnesini girmek istediğiniz öğrenciyi seçiniz";

  @observable
  var repCommon = resolve<RepositoryCommon>();

  @observable
  var model = DailyReportModel();

  @observable
  var studentList = <StudentModel>[];

  @observable
  var selectedStudent = StudentModel();

  @action
  Future<void> getStudents() async {
    try {
      var repGet = resolve<RepositoryCommon>();
      Status = PageState.LOADING;
      var res = await repGet.getStudentList(fields);
      studentList = res;
    } catch (e) {
      Status = PageState.ERROR;
    }
  }

  Future<bool> get() async {
    try {
      var repGet = resolve<RepositoryDailyReport>();
      Status = PageState.LOADING;
      var res = await repGet.get(fields: fields); //sorulacak
      if (res is DailyReportModel) {
        Status = PageState.SUCCESS;
        set(res);
      } else if (res is MobileResult) {
        if (res.statusCode == "1") {
          Status = PageState.SUCCESS;
          set(DailyReportModel(id: 0));
        } else {
          Status = PageState.ERROR;
        }
      }
    } catch (e) {
      Status = PageState.ERROR;
    }
    return true;
  }

//Silinmesi gerekebilir
  void set(DailyReportModel _model) {
    model = _model;
  }
}
