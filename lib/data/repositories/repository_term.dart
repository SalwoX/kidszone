import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../views/_init/models/filter_model.dart';
import '../../views/_init/models/term_model.dart';
import '../../views/_init/repository/repository_base.dart';
import '../core/urlservices.dart';

@lazySingleton
class RepositoryTerm with RepositoryBase<TermModel> {
  Future<dynamic> addOrUpdate({
    required TermModel model,
    List<File>? files,
    Function(int, int)? onSendProgress,
    Function(int, int)? onReceiveProgress,
  }) async {
    var res = await api.post(
      UrlEnum.term_addorupdate,
      datas: model.toJson(),
      files: files,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    if (res.statusCode == "Success") {
      return TermModel.fromJson(res.data as Map<String, dynamic>);
    } else {
      return res;
    }
  }

  Future<dynamic> getList({required FilterModel filterModel}) async {
    List<TermModel> model = [];

    var res = await api.get(
      UrlEnum.term_getlist,
      fields: filterModel.fields,
      page: filterModel.page,
      pageSize: filterModel.pageSize,
      sort: filterModel.sort ?? "",
    );

    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => TermModel.fromJson(i as Map<String, dynamic>)).toList();
      return model;
    } else if (res.statusCode == "1") {
      return res;
    }

    return res;
  }
}
