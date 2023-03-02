import 'dart:io';
import 'package:injectable/injectable.dart';
import '../../../../data/core/urlservices.dart';
import '../../../_init/models/filter_model.dart';
import '../../../_init/repository/repository_base.dart';
import '../pre_registration_notes/model/preregistration_notes_model.dart';

@lazySingleton
class RepositoryPreregistrationNotes with RepositoryBase<PreregistrationNotesModel> {
  Future<dynamic> addOrUpdate({
    required PreregistrationNotesModel model,
    List<File>? files,
    Function(int, int)? onSendProgress,
    Function(int, int)? onReceiveProgress,
  }) async {
    var res = await api.post(
      UrlEnum.preregistrationnotes_addorupdate,
      datas: model.toJson(),
      files: files,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    if (res.statusCode == "Success") {
      return PreregistrationNotesModel.fromJson(res.data as Map<String, dynamic>);
    } else {
      return res;
    }
  }

  Future<dynamic> getList({required FilterModel filterModel}) async {
    List<PreregistrationNotesModel> model = [];

    var res = await api.get(
      UrlEnum.preregistrationnotes_getlist,
      fields: filterModel.fields,
      page: filterModel.page,
      pageSize: filterModel.pageSize,
      sort: filterModel.sort ?? "",
    );

    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => PreregistrationNotesModel.fromJson(i as Map<String, dynamic>)).toList();
      return model;
    } else if (res.statusCode == "1") {
      return res;
    }

    return res;
  }
}
