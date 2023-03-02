import 'dart:io';

import 'package:injectable/injectable.dart';
import '../../../../data/core/urlservices.dart';
import '../../../_init/models/filter_model.dart';
import 'package:kidszone_app/views/_init/repository/repository_base.dart';
import 'package:kidszone_app/views/other_operations/settings/model/settings_model.dart';

@lazySingleton
class RepositorySettings with RepositoryBase<SettingsModel> {
  Future<dynamic> addOrUpdate({
    required SettingsModel model,
    List<File>? files,
    Function(int, int)? onSendProgress,
    Function(int, int)? onReceiveProgress,
  }) async {
    var res = await api.post(
      UrlEnum.settings_addorupdate,
      datas: model.toJson(),
      files: files,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    if (res.statusCode == "Success") {
      return SettingsModel.fromJson(res.data as Map<String, dynamic>);
    } else {
      return res;
    }
  }

  Future<dynamic> getList({required FilterModel filterModel}) async {
    List<SettingsModel> model = [];

    var res = await api.get(
      UrlEnum.settings_get,
      fields: filterModel.fields,
      page: filterModel.page,
      pageSize: filterModel.pageSize,
      sort: filterModel.sort ?? "",
    );

    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => SettingsModel.fromJson(i as Map<String, dynamic>)).toList();
      return model;
    } else if (res.statusCode == "1") {
      return res;
    }

    return res;
  }
}
