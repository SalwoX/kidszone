import 'dart:io';

import '../../../data/core/apiservices.dart';
import '../../../register.dart';
import '../models/filter_model.dart';

class RepositoryBase<T> {
  /* Future<T> insert(T model, urlPath) async {
    return model;
  }

  Future<T> get(int id, urlPath, {Map<dynamic, dynamic> params}) {}

  Future<T> getAll(urlPath, {Map<dynamic, dynamic> params}) {}

  Future<T> delete(int id, urlPath, {Map<dynamic, dynamic> params}) {}

  Future<T> deletes(List<int> ids, urlPath) {
    for (int i = 0; i < ids.length; i++) {}
  }*/
  ApiServices api = resolve<ApiServices>();

  Future<dynamic> addOrUpdate({
    required T model,
    List<File>? files,
    Function(int, int)? onSendProgress,
    Function(int, int)? onReceiveProgress,
  }) async {}

  Future<dynamic> getList({required FilterModel filterModel}) async {}
}
