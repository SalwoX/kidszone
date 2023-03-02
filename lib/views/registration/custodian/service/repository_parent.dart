import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../data/core/urlservices.dart';
import '../../../_init/models/filter_model.dart';
import '../../../_init/repository/repository_base.dart';
import '../model/parent_model.dart';

@lazySingleton
class RepositoryParent with RepositoryBase<ParentModel> {
  Future<dynamic> addOrUpdate({
    required ParentModel model,
    List<File>? files,
    Function(int, int)? onSendProgress,
    Function(int, int)? onReceiveProgress,
  }) async {
    var res = await api.post(
      UrlEnum.parent_addorupdate,
      datas: model.toJson(),
      files: files,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    if (res.statusCode == "Success") {
      return ParentModel.fromJson(res.data as Map<String, dynamic>);
    } else {
      return res;
    }
  }

  Future<dynamic> getList({required FilterModel filterModel}) async {
    List<ParentModel> model = [];

    var res = await api.get(
      UrlEnum.parent_getlist,
      fields: filterModel.fields,
      page: filterModel.page,
      pageSize: filterModel.pageSize,
      sort: filterModel.sort ?? "",
    );

    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => ParentModel.fromJson(i as Map<String, dynamic>)).toList();
      return model;
    } else if (res.statusCode == "1") {
      return res;
    }

    return res;
  }
}
