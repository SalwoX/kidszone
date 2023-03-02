import 'filter_model.dart';

class KeyValueModel {
  String? key;
  String? value;

  KeyValueModel({this.key, this.value});
}

class UrlPath {
  String url;
  String path;
  FilterModel filters;

  UrlPath({required this.url, required this.path, required this.filters});
}
