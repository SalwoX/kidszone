import 'dart:io';

import 'package:injectable/injectable.dart';
import '../core/urlservices.dart';
import '../../views/_init/models/survey_model.dart';
import '../../views/_init/models/filter_model.dart';

import '../../views/_init/repository/repository_base.dart';

@lazySingleton
class RepositorySurvey with RepositoryBase<SurveyModel> {
  Future<dynamic> addOrUpdate({
    required SurveyModel model,
    List<File>? files,
    Function(int, int)? onSendProgress,
    Function(int, int)? onReceiveProgress,
  }) async {
    var res = await api.post(
      UrlEnum.Survey_addorupdate,
      datas: model.toJson(),
      files: files,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    if (res.statusCode == 'Success') {
      return SurveyModel.fromJson(res.data as Map<String, dynamic>);
    } else {
      return res;
    }
  }

  Future<dynamic> getList({required FilterModel filterModel}) async {
    List<SurveyModel> model = [];

    var res = await api.get(
      UrlEnum.Survey_getlist,
      fields: filterModel.fields,
      page: filterModel.page,
      pageSize: filterModel.pageSize,
      sort: filterModel.sort ?? "",
    );

    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => SurveyModel.fromJson(i as Map<String, dynamic>)).toList();
      return model;
    } else if (res.statusCode == "1") {
      return res;
    }

    return res;
  }
}
