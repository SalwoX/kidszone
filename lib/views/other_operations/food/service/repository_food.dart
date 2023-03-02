import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:kidszone_app/data/core/urlservices.dart';

import '../../../_init/models/filter_model.dart';
import '../../../_init/repository/repository_base.dart';
import '../model/food_model.dart';

@lazySingleton
class RepositoryFood with RepositoryBase<FoodModel> {
  Future<dynamic> addOrUpdate({
    required FoodModel model,
    List<File>? files,
    Function(int, int)? onSendProgress,
    Function(int, int)? onReceiveProgress,
  }) async {
    var res = await api.post(
      UrlEnum.food_addorupdate,
      datas: model.toJson(),
      files: files,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    if (res.statusCode == "Success") {
      return FoodModel.fromJson(res.data as Map<String, dynamic>);
    } else {
      return res;
    }
  }

  Future<dynamic> getList({required FilterModel filterModel}) async {
    List<FoodModel> model = [];

    var res = await api.get(
      UrlEnum.food_getlist,
      fields: filterModel.fields,
      page: filterModel.page,
      pageSize: filterModel.pageSize,
      sort: filterModel.sort ?? "",
    );

    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => FoodModel.fromJson(i as Map<String, dynamic>)).toList();
      return model;
    } else if (res.statusCode == "1") {
      return res;
    }

    return res;
  }
}
