import 'dart:io';
import 'package:injectable/injectable.dart';
import '../../../../data/core/urlservices.dart';
import '../../../_init/models/filter_model.dart';
import 'package:kidszone_app/views/_init/repository/repository_base.dart';
import 'package:kidszone_app/views/school_operations/group_operations/model/group_model.dart';

@lazySingleton
class RepositoryGroup with RepositoryBase<GroupModel> {
  Future<dynamic> addOrUpdate({
    required GroupModel model,
    List<File>? files,
    Function(int, int)? onSendProgress,
    Function(int, int)? onReceiveProgress,
  }) async {
    var res = await api.post(
      UrlEnum.group_addorupdate,
      datas: model.toJson(),
      files: files,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    if (res.statusCode == "Success") {
      return GroupModel.fromJson(res.data as Map<String, dynamic>);
    } else {
      return res;
    }
  }

  Future<dynamic> getList({required FilterModel filterModel}) async {
    List<GroupModel> model = [];

    var res = await api.get(
      UrlEnum.group_getlist,
      fields: filterModel.fields,
      page: filterModel.page,
      pageSize: filterModel.pageSize,
      sort: filterModel.sort ?? "",
    );

    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => GroupModel.fromJson(i as Map<String, dynamic>)).toList();
      return model;
    } else if (res.statusCode == "1") {
      return res;
    }

    return res;
  }
}
