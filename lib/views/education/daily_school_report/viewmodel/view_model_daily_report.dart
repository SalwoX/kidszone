import 'package:flutter/material.dart';
import '../../../../data/repositories/repository_common.dart';
import '../../../../register.dart';
import '../../../_init/view_model/base_view_model.dart';
import '../model/daily_report_model.dart';
import '../model/reports.dart';
import '../service/repository_dailyreport.dart';
import 'package:mobx/mobx.dart';

import '../model/daily_report_template_detail_model.dart';

part 'view_model_daily_report.g.dart';

class ViewModelDailyReport = ViewModelDailyReportBase
    with _$ViewModelDailyReport;

abstract class ViewModelDailyReportBase
    extends BaseViewModel<DailyReportModel, RepositoryDailyReport> with Store {
  void setContext(BuildContext ctx) => this.ctx = ctx;

  final formKey = GlobalKey<FormState>();

  //dinamik öğrenci ismi
  @override
  var page_title = "Ömer Tüfekci";

  @override
  var page_subTitle = "";

  @observable
  var repCommon = resolve<RepositoryCommon>();

  @observable
  var reports = ObservableList<Reports>.of([
    Reports(
      title: 'Kahvaltı',
      options: ['Az Yedi', 'Orta Yedi', 'Çok Yedi'],
      reportType: ReportType.daily,
      rowNumber: 1,
      contentType: ContentType.haveOptions,
    ),
    Reports(
      title: 'Öğle Yemeği',
      options: ['Az Yedi', 'Orta Yedi', 'Çok Yedi'],
      reportType: ReportType.daily,
      rowNumber: 2,
      contentType: ContentType.haveOptions,
    ),
    Reports(
      title: 'Akşam Yemeği',
      options: ['Az Yedi', 'Orta Yedi', 'Çok Yedi'],
      reportType: ReportType.daily,
      rowNumber: 3,
      contentType: ContentType.haveOptions,
    ),
    Reports(
      title: 'Uyku Durumu',
      options: ['Az Uyudu', 'Orta Uyudu', 'Çok Uyudu'],
      reportType: ReportType.daily,
      rowNumber: 4,
      contentType: ContentType.haveOptions,
    ),
    Reports(
      title: 'Birinci Etkinlik',
      options: ['Az Katıldı', 'Orta Katıldı', 'Çok Katıldı'],
      reportType: ReportType.education,
      rowNumber: 5,
      contentType: ContentType.haveOptions,
    ),
    Reports(
      title: 'İkinci Etkinlik',
      options: ['Az Katıldı', 'Orta Katıldı', 'Çok Katıldı'],
      reportType: ReportType.education,
      rowNumber: 6,
      contentType: ContentType.haveOptions,
    ),
  ]);

  @observable
  var model = DailyReportModel(
    id: 1,
    branchId: 2,
    reports: [],
  );

  var selectedBreakfast;
  var selectedLunch;
  var selectedDinner;
  var selectedFirstActivity;
  var selectedSecondActivity;

  void dailyReportSave() {
    model.reports = reports.toList();
  }
}
