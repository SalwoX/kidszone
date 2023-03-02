// ignore: file_names
import 'dart:io';

import 'package:kidszone_app/views/_init/models/base_model.dart';
import 'package:kidszone_app/views/_init/models/filter_model.dart';
import 'package:kidszone_app/views/_init/models/mobile_result.dart';


import '../../../data/core/urlservices.dart';
import '../../constants/enums/http_request_enum.dart';
import 'IResponseModel.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> fetch<R, T extends BaseModel>(String path,
      {required HttpTypes type, required T parseModel, dynamic data, Map<String, Object>? queryParameters, void Function(int, int)? onReceiveProgress});
}
// MARK: Null SAfety

abstract class ICoreDioNullSafety {
  // Future<IResponseModel<R>> send<R, T extends BaseModel>(String path,
  //     {required HttpTypes type, required T parseModel, dynamic data, Map<String, Object>? queryParameters, void Function(int, int)? onReceiveProgress});

  Future<MobileResult> getall(
    UrlEnum urlpath, {
    required List<Field> fields,
    required int page,
    required int pageSize,
    required String sort,
    Function(int, int)? onSendProgress,
    Function(int, int)? onReceiveProgress,
  });

  Future<MobileResult> send(
    UrlEnum urlpath, {
    required Map<String, dynamic> datas,
    List<File>? files,
    Function(int, int)? onSendProgress,
    Function(int, int)? onReceiveProgress,
  });
}

abstract class ICoreDioFull extends ICoreDio {
  Future<IResponseModel<R>> fetchNoNetwork<R, T extends BaseModel>(String path,
      {required HttpTypes type, required T parseModel, dynamic data, Map<String, Object>? queryParameters, void Function(int, int)? onReceiveProgress});
}

// MARK: Nul SAfety
abstract class ICoreDioFullNulSafetyFull extends ICoreDioNullSafety {
  Future<IResponseModel<R>> fetchNoNetwork<R, T extends BaseModel>(String path,
      {required HttpTypes type, required T parseModel, dynamic data, Map<String, Object>? queryParameters, void Function(int, int)? onReceiveProgress});
}
