part of '../core_dio.dart';

extension _CoreDioOperations on CoreDio {
  // ignore: unused_element
  R? _responseParser<R, T>(BaseModel model, dynamic data) {
    if (data is List) {
      return data.map((e) => model.fromJson((e as Map<String, Object>))).toList().cast<T>() as R;
    } else if (data is Map) {
      return model.fromJson(data as Map<String, Object>) as R;
    }
    return data as R?;
  }
}
