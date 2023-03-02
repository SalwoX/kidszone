import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../common/app_config.dart';
import '../../../../common/notifications/notifications.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../register.dart';
import '../../../../views/_init/components/widgets/kzsnack_widget_minifity.dart';
import '../../../_init/models/filter_model.dart';
import '../../../_init/models/mobile_result.dart';
import '../../../_init/view_model/base_view_model.dart';
import '../../../registration/student/model/student_model.dart';
import '../../../registration/student/service/repository_student.dart';
import '../model/daily_report_model.dart';
import '../model/daily_report_template_detail_model.dart';
import '../model/daily_report_template_model.dart';
import '../model/reports.dart';
import '../service/repository_dailyreport.dart';

part 'view_model_daily_report_x.g.dart';

class ViewModelDailyReportX = _ViewModelDailyReportXBase with _$ViewModelDailyReportX;

abstract class _ViewModelDailyReportXBase extends BaseViewModel<DailyReportModel, RepositoryDailyReport> with Store {
  RepositoryDailyReport rep = resolve<RepositoryDailyReport>();

  @override
  void setContext(BuildContext ctx) => this.ctx = ctx;

  var title = LocaleKeys.condition_daily_report.tr();

  var subTitle = "";

  @observable
  var teacherNote = TextEditingController();

  @observable
  var studentList = <StudentModel>[];

  @override
  void init() {}

  @computed
  bool get isEven => 5 % 2 == 0;

  @observable
  int? classroomId;

  @observable
  StudentModel? selectedStudent;

  @observable
  DailyReportModel? model = DailyReportModel(
    id: 1,
    branchId: 2,
    reports: [
      Reports(
        title: 'sabah yemegi',
        options: ['yedi', 'az yedi', 'hayvan gibi yedi'],
        reportType: ReportType.daily,
        rowNumber: 1,
        contentType: ContentType.haveOptions,
      ),
      Reports(
        title: 'uyku durumu',
        options: ['uyudu', 'az uyudu', 'hayvan gibi uyudu'],
        reportType: ReportType.daily,
        rowNumber: 2,
        contentType: ContentType.haveOptions,
      ),
    ],
  );

  void uploadData() {
    if (selectedStudent == null) {
      getStudents();
    } else {
      getStudentReport();
    }
  }

  Future<void> getStudents() async {
    try {
      var fields = <Field>[];
      fields.add(Field(fieldName: "SinifId", fieldOperator: "eq", fieldValue: classroomId.toString()));

      var filterModel = FilterModel(fields: fields, page: 0, pageSize: AppConfig.pageSize);

      var repStudent = resolve<RepositoryStudent>();
      Status = PageState.LOADING;
      var res = await repStudent.getList(filterModel: filterModel);
      if (res is List<StudentModel>) {
        studentList = res;
        Status = PageState.SUCCESS;
      } else if (res is MobileResult) {
        if (res.statusCode == "1") {
          Status = PageState.SUCCESS;
          studentList = [];
        } else {
          Status = PageState.ERROR;
          studentList = [];
        }
      }
    } catch (e) {
      Status = PageState.ERROR;
    }
  }

//* #region sablon işlemleri
  @observable
  DailyReportTemplateModel? templateModel;

  @action
  Future<void> getTemplate() async {
    var fields = <Field>[];
    fields.add(
      Field(
        fieldName: 'classroomId',
        fieldOperator: 'eq',
        fieldValue: classroomId.toString(),
      ),
    );
    var res = await rep.getTemplates(fields);
    if (res is DailyReportTemplateModel) {
      templateModel = res;
      templateModel!.details!.forEach((item) {
        if (model!.reports == null) {
          model!.reports = <Reports>[];
        }

        if (!model!.reports!.any((m) => m.title == item.title)) {
          model!.reports!.add(Reports(
            rowNumber: item.rowNumber,
            title: item.title,
            contentType: item.contentType,
            reportType: item.reportType,
            options: item.options,
            active: true,
          ));
        } else {
          var report = model!.reports!.firstWhere((m) => m.title == item.title);
          report.options = item.options;
        }
      });
    } else {}
  }

  @action
  Future<void> saveTemplate() async {
    var res = await rep.templateAddOrUpdate(model: templateModel!);
    try {
      if (res is DailyReportTemplateModel) {
        showTopSnackBar(
          ctx,
          KzSnackWidgetMinifit(
            message: LocaleKeys.condition_template_saved.tr(),
            messageType: MessageType.Success,
          ),
        );
        templateModel = res;
      } else if (res is MobileResult) {
        Notifications().sendMessage(null, res.message, templateModel);
        showTopSnackBar(
          ctx,
          KzSnackWidgetMinifit(
            message: LocaleKeys.condition_warning.tr() + (res.message ?? ''),
            messageType: MessageType.Error,
          ),
        );
      }
    } catch (e) {
      Notifications().sendMessage(null, e.toString(), templateModel);
      showTopSnackBar(
        ctx,
        KzSnackWidgetMinifit(
          message: LocaleKeys.condition_error_massage.tr(),
          messageType: MessageType.Error,
        ),
      );
    }
  }

//* #endregion

//* #region Karne İşlemleri
  @action
  Future<void> getStudentReport() async {
    var fields = <Field>[];
    fields.add(Field(fieldName: 'classroomId', fieldOperator: 'eq', fieldValue: classroomId.toString()));
    fields.add(Field(fieldName: 'studentId', fieldOperator: 'eq', fieldValue: selectedStudent!.id.toString()));
    var res = await rep.get(fields: fields);
    if (res is DailyReportModel) {
      if (res.id! > 0) {
        model = res;
      } else {
        getTemplate();
      }
    } else {}
  }

  @action
  Future<void> saveReport() async {
    var res = await rep.addOrUpdate(model: model!);
    try {
      if (res is DailyReportModel) {
        showTopSnackBar(
          ctx,
          KzSnackWidgetMinifit(
            message: LocaleKeys.condition_template_saved.tr(),
            messageType: MessageType.Success,
          ),
        );
        model = res;
      } else if (res is MobileResult) {
        Notifications().sendMessage(null, res.message, model);
        showTopSnackBar(
          ctx,
          KzSnackWidgetMinifit(
            message: LocaleKeys.condition_warning.tr() + (res.message ?? ''),
            messageType: MessageType.Error,
          ),
        );
      }
    } catch (e) {
      Notifications().sendMessage(null, e.toString(), model);
      showTopSnackBar(
        ctx,
        KzSnackWidgetMinifit(
          message: LocaleKeys.condition_error_massage.tr(),
          messageType: MessageType.Error,
        ),
      );
    }
  }
//* #endregion
}
