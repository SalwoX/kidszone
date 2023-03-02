// ignore_for_file: public_member_api_docs

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:kidszone_app/common/app_config.dart';
import 'package:kidszone_app/common/infrastructure/work_context.dart';
import 'package:kidszone_app/common/log.dart';
import 'package:kidszone_app/common/notifications/notifications.dart';
import 'package:kidszone_app/data/core/http.dart';
import 'package:kidszone_app/data/core/unathorised_exception.dart';
import 'package:kidszone_app/data/core/urlservices.dart';
import 'package:kidszone_app/views/_init/models/filter_model.dart';
import 'package:kidszone_app/views/_init/models/key_value_model.dart';
import 'package:kidszone_app/views/_init/models/mobile_result.dart';
import 'package:kidszone_app/views/_init/models/user_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

@lazySingleton
class ApiServices {
  ApiServices() {
    // add interceptors
    //dio.interceptors.add(CookieManager(CookieJar()));
    dio.interceptors.add(LogInterceptor());

    //(dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
    dio.options = _options();
    //dio.options.receiveTimeout = 3000;
  }
  BaseOptions _options({bool multipart = false}) {
    var headers = Map<String, dynamic>();
    if (multipart) {
      headers['Content-Type'] = 'multipart/form-data';
    } else {
      headers['Content-Type'] = "application/json";
    }

    headers['Accept'] = 'application/json';
    headers['authorization'] = 'bearer ${WorkContext().token}';
    var timeOut = 1000 * 60;
    BaseOptions options = new BaseOptions(
      baseUrl: Prefix + ApiUrl,
      connectTimeout: timeOut,
      //receiveTimeout: 3000,
      headers: headers,
    );

    return options;
  }

  /*Future<MobileResult> getAll(SearchModel post, UrlEnum urlpath) async {
    var data = post.toJson();
    final response = await http.post(
      Uri.http(AppConfig.apiUrl, UrlGetPath[urlpath]),
      headers: {
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: "bearer " + WorkContext.token
      },
      body: data,
    );
    return MobileResult.fromJson(json.decode(response.body));
  }*/

  Future<MobileResult> get(
    UrlEnum urlpath, {
    required List<Field> fields,
    required int page,
    required int pageSize,
    required String sort,
    Function(int, int)? onSendProgress,
    Function(int, int)? onReceiveProgress,
  }) async {
    dio.options = _options();
    var url = getPath(urlpath, fields, page, pageSize, sort);
    var data = jsonEncode(url.filters);
    return await dio
        .post<String>(
      url.path,
      data: data,
      onSendProgress: onSendProgress ??
          (count, total) async {
            EasyLoading.showProgress(double.parse((count / total).toStringAsFixed(2)), status: '${(count / total * 100).toStringAsFixed(2)}%');
          },
      onReceiveProgress: onReceiveProgress ??
          (count, total) async {
            EasyLoading.showProgress(double.parse((count / total).toStringAsFixed(2)), status: '${(count / total * 100).toStringAsFixed(2)}%');
          },
    )
        .then((res) {
      EasyLoading.dismiss();
      if (res.statusCode == 200) {
        return MobileResult.fromJson(json.decode(res.data ?? "") as Map<String, dynamic>);
      } else if (res.statusCode == 401) {
        Notifications().sendMessage(null, res.toString(), data);
        throw UnauthorisedException();
      } else if (res.statusCode == 400) {
        Notifications().sendMessage(null, res.toString(), data);
        throw Exception(res);
      } else {
        Notifications().sendMessage(null, res.toString(), data);
        throw Exception(res);
      }
    }).catchError((error, stackTrace) {
      EasyLoading.dismiss();
      Notifications().sendMessageDioError(error as DioError, null, data);
      if (error.response?.statusCode == 401) {
        throw UnauthorisedException();
      }
      Log.error(error, {error, stackTrace});
      throw Exception(error);
    });
  }

  Future<MobileResult> post(
    UrlEnum urlpath, {
    required Map<String, dynamic> datas,
    List<File>? files,
    Function(int, int)? onSendProgress,
    Function(int, int)? onReceiveProgress,
  }) async {
    dio.options = _options(multipart: true);
    var url = getPathPost(urlpath);
    if (files == null || files.length == 0) {
      var formData = FormData.fromMap(datas);
      return await dio
          .post<String>(
        url.path,
        data: formData,
        onSendProgress: onSendProgress ??
            (count, total) async {
              EasyLoading.showProgress(double.parse((count / total).toStringAsFixed(2)), status: '${(count / total * 100).toStringAsFixed(2)}%');
            },
        onReceiveProgress: onReceiveProgress ??
            (count, total) async {
              EasyLoading.showProgress(double.parse((count / total).toStringAsFixed(2)), status: '${(count / total * 100).toStringAsFixed(2)}%');
            },
      )
          .then((res) {
        EasyLoading.dismiss();
        if (res.statusCode == 200) {
          return MobileResult.fromJson(json.decode(res.data ?? "") as Map<String, dynamic>);
        } else if (res.statusCode == 401) {
          Notifications().sendMessage(null, res.toString(), datas);
          throw UnauthorisedException();
        } else if (res.statusCode == 400) {
          Notifications().sendMessage(null, res.toString(), datas);
          throw Exception(res);
        } else {
          Notifications().sendMessage(null, res.toString(), datas);
          throw Exception(res);
        }
      }).catchError((error, stackTrace) {
        EasyLoading.dismiss();
        Notifications().sendMessageDioError(error as DioError, null, datas);
        //throw Exception(error);
        if (error.response?.statusCode == 401) {
          throw UnauthorisedException();
        }
        throw Exception(error);
      });
    } else {
      List<MultipartFile> fileMap = [];
      for (var fileEntry in files) {
        File file = fileEntry;
        String fileName = basename(file.path);
        fileMap.add(MultipartFile(file.openRead(), await file.length(), filename: fileName));
      }

      dio.options = _options(multipart: true);
      datas["files"] = fileMap;
      var formData = FormData.fromMap(datas);
      return await dio
          .post<String>(
        url.path,
        data: formData,
        onSendProgress: onSendProgress ??
            (count, total) async {
              EasyLoading.showProgress(double.parse((count / total).toStringAsFixed(2)), status: '${(count / total * 100).toStringAsFixed(2)}%');
            },
        onReceiveProgress: onReceiveProgress ??
            (count, total) async {
              EasyLoading.showProgress(double.parse((count / total).toStringAsFixed(2)), status: '${(count / total * 100).toStringAsFixed(2)}%');
            },
      )
          .then((res) {
        EasyLoading.dismiss();
        if (res.statusCode == 200) {
          cleanCache();
          return MobileResult.fromJson(json.decode(res.data ?? "") as Map<String, dynamic>);
        } else if (res.statusCode == 401) {
          Notifications().sendMessage(null, res.toString(), datas);
          throw UnauthorisedException();
        } else if (res.statusCode == 400) {
          Notifications().sendMessage(null, res.toString(), datas);
          throw Exception(res);
        } else {
          Notifications().sendMessage(null, res.toString(), datas);
          throw Exception(res);
        }
      }).catchError((error, stackTrace) {
        EasyLoading.dismiss();
        Notifications().sendMessageDioError(error as DioError, null, datas);
        Log.error(error, {error, stackTrace});
      });
    }
  }

  dynamic deleteWithBody(UrlEnum? urlpath, int? id) async {
    /*var url = getPathPost(urlpath);
    var request = http.Request(
      'DELETE',
      Uri.http(
        url.url,
        url.path,
        {'Id': id},
      ),
    );
    request.headers['Content-Type'] = 'application/json';
    request.headers['Accept'] = 'application/json';
    request.headers[HttpHeaders.authorizationHeader] =
        "bearer " + WorkContext.token;
    final response = await http.Client().send(request).then(
          (value) => Response.fromStream(value),
        );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw UnauthorisedException();
    } else {
      throw Exception(response.reasonPhrase);
    }*/
  }

  /*Future<MobileResult> getAllNoSearch(UrlEnum urlpath) async {
    final response = await http.get(
      Uri.http(AppConfig.apiUrl, UrlGetPath[urlpath]),
      headers: {
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: "bearer " + WorkContext.token
      },
    );
    return MobileResult.fromJson(json.decode(response.body));
  }*/

  Future<UserModel> login(
    String phone,
    String password, {
    Function(int, int)? onReceiveProgress,
  }) async {
    dio.options = _options();
    //var url = '${UrlGetPath[UrlEnum.login_phone]}';
    var url = '${UrlEnum.login_phone.withBaseUrl()}';
    return await dio
        .get<String>(
      url,
      queryParameters: {
        'phone': phone,
        'password': password,
      },
      onReceiveProgress: onReceiveProgress ??
          (count, total) async {
            EasyLoading.showProgress(double.parse((count / total).toStringAsFixed(2)), status: '${(count / total * 100).toStringAsFixed(2)}%');
          },
    )
        .then((res) {
      EasyLoading.dismiss();
      if (res.statusCode == 200) {
        return UserModel.fromJson(json.decode(res.data ?? "") as Map<String, dynamic>);
      } else if (res.statusCode == 401) {
        Notifications().sendMessage(null, res.toString(), "Login Hata 401");
        throw UnauthorisedException();
      } else if (res.statusCode == 400) {
        Notifications().sendMessage(null, res.toString(), "Login Hata 400");
        throw Exception(res);
      } else {
        Notifications().sendMessage(null, res.toString(), "Login Hata ");
        throw Exception(res);
      }
    }).catchError((error, stackTrace) {
      EasyLoading.dismiss();
      Notifications().sendMessageDioError(error as DioError, null, "Login Hata.");
      if (error.response?.statusCode == 401) {
        throw UnauthorisedException();
      }
      Log.error(error, {error, stackTrace});
      throw Exception(error);
    });
    // final url = Uri.http(ApiUrl, '${UrlGetPath[UrlEnum.login_phone]}', {
    //   "phone": phone,
    //   "password": password,
    // });
    // final response = await http.get(
    //   url,
    //   headers: {'Accept': 'application/json', 'Content-Type': 'application/json'},
    // );

    // if (response.body.isEmpty) {
    //   return KullaniciModel();
    // }

    // return KullaniciModel.fromJson(json.decode(response.body));
  }

  Future<UserModel> loginSecurity(
    String phone,
    String password,
    String securityCode, {
    Function(int, int)? onReceiveProgress,
  }) async {
    dio.options = _options();

    //  var url = '${UrlGetPath[UrlEnum.login_security_code]}';
    var url = '${UrlEnum.login_security_code.withBaseUrl()}';
    return await dio
        .get<String>(
      url,
      queryParameters: {
        'phone': phone,
        'password': password,
        'securityCode': securityCode,
      },
      onReceiveProgress: onReceiveProgress ??
          (count, total) async {
            EasyLoading.showProgress(double.parse((count / total).toStringAsFixed(2)), status: '${(count / total * 100).toStringAsFixed(2)}%');
          },
    )
        .then((res) {
      EasyLoading.dismiss();
      if (res.statusCode == 200) {
        return UserModel.fromJson(json.decode(res.data ?? "") as Map<String, dynamic>);
      } else if (res.statusCode == 401) {
        Notifications().sendMessage(null, res.toString(), "Login Hata 401");
        throw UnauthorisedException();
      } else if (res.statusCode == 400) {
        Notifications().sendMessage(null, res.toString(), "Login Hata 400");
        throw Exception(res);
      } else {
        Notifications().sendMessage(null, res.toString(), "Login Hata ");
        throw Exception(res);
      }
    }).catchError((error, stackTrace) {
      EasyLoading.dismiss();
      Notifications().sendMessageDioError(error as DioError, null, "Login Hata.");
      if (error.response?.statusCode == 401) {
        throw UnauthorisedException();
      }
      Log.error(error, {error, stackTrace});
      throw Exception(error);
    });
    // final response = await http.get(
    //   Uri.http(ApiUrl, '${UrlGetPath[UrlEnum.login_security_code]}', {
    //     "phone": phone,
    //     "password": password,
    //     "securityCode": securityCode,
    //   }),
    //   headers: {'Accept': 'application/json'},
    // );

    // if (response.body.isEmpty) {
    //   return KullaniciModel();
    // }

    // return KullaniciModel.fromJson(json.decode(response.body));
  }

  UrlPath getPath(UrlEnum urlpath, List<Field> fields, int page, int pageSize, String? sort) {
    var filter = FilterModel(fields: fields, page: page, pageSize: pageSize, sort: sort);

    var path = '';
    if (fields.length == 0 && (page == 0) && (pageSize == 0)) {
      //  path = '${UrlGetPath[urlpath]}';
      path = '${urlpath.withBaseUrl()}';
    } else {
      //path = '${UrlGetPath[urlpath]}';
      path = '${urlpath.withBaseUrl()}';
      //'?filter=' +
      // Uri.encodeQueryComponent(json.encode(filter));
    }
    return UrlPath(url: '$ApiUrl', path: path, filters: filter);
  }

  UrlPath getPathPost(UrlEnum? urlpath) {
    var path = '';
    //  path = _kucult('${UrlGetPath[urlpath]}');
    path = _shrink('${urlpath!.withBaseUrl()}');
    return UrlPath(url: ApiUrl, path: path, filters: FilterModel(page: 0, pageSize: 0, fields: []));
  }

  String _shrink(String value) {
    return value;
  }

  Future<File> downloadFile(String url, String filename) async {
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    final cache = Directory("$dir/cache");
    if (!await cache.exists()) {
      cache.create();
    }

    File file = new File('$dir/cache/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }

  void cleanCache() async {
    try {
      String dir = (await getApplicationDocumentsDirectory()).path;
      final cache = Directory("$dir/cache");
      cache.deleteSync(recursive: true);
    } catch (e) {
      Log.error('önbellek ' + e.toString());
    }
  }
}
