import 'dart:io';

import 'package:injectable/injectable.dart';
import '../../../../common/app_config.dart';
import '../../../../core/init/network/network_manager.dart';
import '../../../../data/core/urlservices.dart';
import 'package:kidszone_app/views/_init/models/filter_model.dart';
import 'package:kidszone_app/views/_init/repository/repository_base.dart';
import 'package:kidszone_app/views/education/daily_school_report/model/daily_report_model.dart';
import 'package:kidszone_app/views/education/daily_school_report/model/daily_report_template_model.dart';

@lazySingleton
class RepositoryDailyReport with RepositoryBase<DailyReportModel> {
  Future<dynamic> addOrUpdate({
    required DailyReportModel model,
    List<File>? files,
    Function(int, int)? onSendProgress,
    Function(int, int)? onReceiveProgress,
  }) async {
    var res = await api.post(
      UrlEnum.dailyreport_addorupdate,
      datas: model.toJson(),
      files: files,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    if (res.statusCode == 'Success') {
      return DailyReportModel.fromJson(res.data as Map<String,dynamic>);
    } else {
      return res;
    }
  }

  Future<dynamic> getList({required FilterModel filterModel}) async {
    List<DailyReportModel> model = [];

    var res = await api.get(
      UrlEnum.dailyreport_getlist,
      fields: filterModel.fields,
      page: filterModel.page,
      pageSize: filterModel.pageSize,
      sort: filterModel.sort ?? "",
    );

    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => DailyReportModel.fromJson(i as Map<String,dynamic>)).toList();
      return model;
    } else if (res.statusCode == "1") {
      return res;
    }

    return res;
  }

  Future<dynamic> get({required List<Field> fields}) async {
    DailyReportModel model;

    var res = await NetworkManager.instance!.coreDio?.getall(
      UrlEnum.dailyreport_get,
      fields: fields,
      page: 0,
      pageSize: AppConfig.pageSize,
      sort: '',
    );

    if (res!.statusCode == "Success") {
      model = DailyReportModel.fromJson(res.data as Map<String,dynamic>);
      return model;
    } else if (res.statusCode == "1") {
      return res;
    }

    return res;
  }



  Future<dynamic> getTemplates(List<Field> fields) async {
    List<DailyReportTemplateModel> model = [];
    var res = await NetworkManager.instance!.coreDio?.getall(
      UrlEnum.daily_report_template_get,
      fields: fields,
      page: 0,
      pageSize: AppConfig.pageSize,
      sort: '',
    );

    if (res!.statusCode == "Success") {
      model = (res.data as List).map((i) => DailyReportTemplateModel.fromJson(i as Map<String,dynamic>)).toList();
      return model;
    } else if (res.statusCode == "1") {
      return res;
    }

    return res;
  }

  Future<dynamic> templateAddOrUpdate({
    required DailyReportTemplateModel model,
    List<File>? files,
    Function(int, int)? onSendProgress,
    Function(int, int)? onReceiveProgress,
  }) async {
    var res = await api.post(
      UrlEnum.daily_report_template_addorupdate,
      datas: model.toJson(),
      files: files,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    if (res.statusCode == "Success") {
      return DailyReportTemplateModel.fromJson(res.data as Map<String,dynamic>);
    } else {
      return res;
    }
  }
}
