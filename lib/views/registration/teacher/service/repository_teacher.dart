import 'dart:io';
import 'package:injectable/injectable.dart';
import '../../../../data/core/urlservices.dart';
import '../../../_init/models/filter_model.dart';
import '../../../_init/repository/repository_base.dart';
import 'package:kidszone_app/views/registration/teacher/model/teacher_model.dart';

@lazySingleton
class RepositoryTeacher with RepositoryBase<TeacherModel> {
  Future<dynamic> addOrUpdate({
    required TeacherModel model,
    List<File>? files,
    Function(int, int)? onSendProgress,
    Function(int, int)? onReceiveProgress,
  }) async {
    var res = await api.post(
      UrlEnum.teacher_addorupdate,
      datas: model.toJson(),
      files: files,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    if (res.statusCode == "Success") {
      return TeacherModel.fromJson(res.data as Map<String, dynamic>);
    } else {
      return res;
    }
  }

  Future<dynamic> getList({required FilterModel filterModel}) async {
    List<TeacherModel> model = [];

    var res = await api.get(
      UrlEnum.teacher_getlist,
      fields: filterModel.fields,
      page: filterModel.page,
      pageSize: filterModel.pageSize,
      sort: filterModel.sort ?? "",
    );

    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => TeacherModel.fromJson(i as Map<String, dynamic>)).toList();
      return model;
    } else if (res.statusCode == "1") {
      return res;
    }

    return res;
  }
}
