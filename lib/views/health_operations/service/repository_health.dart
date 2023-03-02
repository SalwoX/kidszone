import 'dart:io';
import 'package:injectable/injectable.dart';
import '../../../data/core/urlservices.dart';
import '../model/health_model.dart';

import '../../_init/models/filter_model.dart';
import '../../_init/repository/repository_base.dart';

@lazySingleton
class RepositoryHealth with RepositoryBase<HealthModel> {
  Future<dynamic> addOrUpdate({
    required HealthModel model,
    List<File>? files,
    Function(int, int)? onSendProgress,
    Function(int, int)? onReceiveProgress,
  }) async {
    var res = await api.post(
      UrlEnum.health_addorupdate,
      datas: model.toJson(),
      files: files,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    if (res.statusCode == "Success") {
      return HealthModel.fromJson(res.data as Map<String,dynamic>);
    } else {
      return res;
    }
  }

  Future<dynamic> getList({required FilterModel filterModel}) async {
    List<HealthModel> model = [];

    var res = await api.get(
      UrlEnum.health_getlist,
      fields: filterModel.fields,
      page: filterModel.page,
      pageSize: filterModel.pageSize,
      sort: filterModel.sort ?? "",
    );

    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => HealthModel.fromJson(i as Map<String,dynamic>)).toList();
      return model;
    } else if (res.statusCode == "1") {
      return res;
    }

    return res;
  }

  Future<dynamic> get({required FilterModel filterModel}) async {
    List<HealthModel> model = [];

    var res = await api.get(
      UrlEnum.health_getlist,
      fields: filterModel.fields,
      page: filterModel.page,
      pageSize: filterModel.pageSize,
      sort: filterModel.sort ?? "",
    );

    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => HealthModel.fromJson(i as Map<String,dynamic>)).toList();
      return model;
    } else if (res.statusCode == "1") {
      return res;
    }

    return res;
  }
}
