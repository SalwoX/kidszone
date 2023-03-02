import 'dart:io';

import 'package:injectable/injectable.dart';
import '../../../../data/core/urlservices.dart';
import '../../../_init/models/filter_model.dart';
import '../../../_init/repository/repository_base.dart';
import '../model/classroom_model.dart';

@lazySingleton
class RepositoryClassroom with RepositoryBase<ClassroomModel> {
  @override
  Future<dynamic> addOrUpdate({
    required ClassroomModel model,
    List<File>? files,
    Function(int, int)? onSendProgress,
    Function(int, int)? onReceiveProgress,
  }) async {
    var res = await api.post(
      UrlEnum.classroom_addorupdate,
      datas: model.toJson(),
      files: files,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    if (res.statusCode == "Success") {
      return ClassroomModel.fromJson(res.data as Map<String, dynamic>);
    } else {
      return res;
    }
  }

  @override
  Future<dynamic> getList({required FilterModel filterModel}) async {
    List<ClassroomModel> model = [];

    var res = await api.get(
      UrlEnum.classroom_getlist,
      fields: filterModel.fields,
      page: filterModel.page,
      pageSize: filterModel.pageSize,
      sort: filterModel.sort ?? "",
    );

    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => ClassroomModel.fromJson(i as Map<String, dynamic>)).toList();
      return model;
    } else if (res.statusCode == "1") {
      return res;
    }

    return res;
  }

  Future<dynamic> getListTeacherDependentClasses({required FilterModel filterModel}) async {
    List<ClassroomModel> model = [];

    var res = await api.get(
      UrlEnum.classroom_getlist_teacher_dependent_classes,
      fields: filterModel.fields,
      page: filterModel.page,
      pageSize: filterModel.pageSize,
      sort: filterModel.sort ?? "",
    );

    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => ClassroomModel.fromJson(i as Map<String, dynamic>)).toList();
      return model;
    } else if (res.statusCode == "1") {
      return res;
    }

    return res;
  }
}
