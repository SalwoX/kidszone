import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import '../../generated/locale_keys.g.dart';
import '../../views/home/announcement/service/repository_notice.dart';
import '../../data/repositories/repository_student_accounting.dart';
import '../../register.dart';
import '../../views/_init/models/mobile_result.dart';
import '../../views/registration/student/model/student_model.dart';
import 'package:mobx/mobx.dart';
import '../../views/registration/student/service/repository_student.dart';
import '../../views/home/announcement/model/notice_model.dart';
import '../../views/_init/view_model/base_view_model.dart';
import '../pages/accounting_process/model/student_accounting_model.dart';
part 'view_model_accounting.g.dart';

class ViewModelAccounting = _ViewModelAccountingBase with _$ViewModelAccounting;

abstract class _ViewModelAccountingBase
    extends BaseViewModel<NoticeModel, RepositoryNotice> with Store {
  @override
  void setContext(BuildContext ctx) => this.ctx = ctx;

  int bottomNavigationBarIndex = 0;
  final formKey = GlobalKey<FormState>();

  @observable
  var title = LocaleKeys.announcementViewModel_sub_title.tr();

//#region Arama Sayfası

  @observable
  List<File> photoList = [];

//#endregion

//#region öğrenci listesi
  @observable
  var studentListModel = <StudentModel>[];
  var selectedStudent = StudentModel(
    id: 0,
  );

  Future<void> getStudentList() async {
    try {
      var repGet = resolve<RepositoryStudent>();
      Status = PageState.LOADING;
      var res = await repGet.getList(filterModel: filter);
      if (res is List<StudentModel>) {
        Status = PageState.SUCCESS;
        studentListModel = res;
      } else if (res is MobileResult) {
        if (res.statusCode == "1") {
          Status = PageState.SUCCESS;
          studentListModel = [];
        } else {
          Status = PageState.ERROR;
          exception = res.message ?? '';
        }
      }
    } catch (e) {
      Status = PageState.ERROR;
      exception = e.toString();
    }
  }

//#endregion
//#region Öğrenci Muhasebe Kayıtlarını Getir
  var studentAccountingRecord = StudentAccountingModel(
    id: 0,
  );
  Future<void> getStudentAccountingRecord() async {
    try {
      var repGet = resolve<RepositorySudentAccounting>();
      Status = PageState.LOADING;
      var res = await repGet.getList(filterModel: filter);
      if (res is StudentAccountingModel) {
        Status = PageState.SUCCESS;
        studentAccountingRecord = res;
      } else if (res is MobileResult) {
        if (res.statusCode == "1") {
          Status = PageState.SUCCESS;
          studentAccountingRecord = StudentAccountingModel(
            id: 0,
          );
        } else {
          Status = PageState.ERROR;
          exception = res.message ?? '';
        }
      }
    } catch (e) {
      Status = PageState.ERROR;
      exception = e.toString();
    }
    saveEnable = true;
  }
//#endregion
}
