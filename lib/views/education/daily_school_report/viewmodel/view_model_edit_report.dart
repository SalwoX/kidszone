import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import '../../../../generated/locale_keys.g.dart';
import 'package:mobx/mobx.dart';

import '../../../../register.dart';
import '../../../_init/router/app_router.dart';
import '../../../_init/view_model/base_view_model.dart';
import '../model/daily_report_model.dart';
import '../model/daily_report_template_detail_model.dart';
import '../model/reports.dart';
import '../service/repository_dailyreport.dart';

part 'view_model_edit_report.g.dart';

class ViewModelEditReport = ViewModelEditReportBase with _$ViewModelEditReport;

abstract class ViewModelEditReportBase extends BaseViewModel<DailyReportModel, RepositoryDailyReport> with Store {
  void setContext(BuildContext ctx) => this.ctx = ctx;

  @override
  var page_title = LocaleKeys.pageDailyReport_edit_report_items.tr();

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

  dailyReportSave() {
    resolve<AppRouter>().push(RouteDailyReport());
  }
}
