import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../views/_init/models/filter_operator_list.dart';
import '../../views/_init/models/key_value_model.dart';
import '../../views/_init/themes/colors.dart';
import '../../views/_init/themes/constants.dart';

class AppStatic {
  static bool welcomeAnimation = true;

  static List<KeyValueModel> targetGroup = [
    KeyValueModel(key: '1', value: 'Tüm Kullanıcılar'),
    KeyValueModel(key: '2', value: 'Sınıf Listesi'),
    KeyValueModel(key: '3', value: 'Öğrenci Listesi'),
    KeyValueModel(key: '4', value: 'Sadece Öğretmenler'),
  ];

  static List<DropdownMenuItem<String>> targetGroup1(TextStyle style) {
    var list = targetGroup.map(
      (data) => new DropdownMenuItem<String>(
        value: data.key.toString(),
        child: Text(
          data.value ?? "",
          style: style,
        ),
      ),
    );
    return list.toList();
  }

  static List<KeyValueModel> classType = [
    KeyValueModel(key: '1', value: 'Ders Sınıfı'),
    KeyValueModel(key: '2', value: 'Etüt Sınıfı'),
  ];

  static List<KeyValueModel> _gender = [
    KeyValueModel(key: 'Kız', value: 'Kız'),
    KeyValueModel(key: 'Erkek', value: 'Erkek'),
  ];

  // ignore: unused_element
  static List<DropdownMenuItem<String>> _genderList(TextStyle style) {
    var list = _gender.map(
      (data) => new DropdownMenuItem<String>(
        value: data.key.toString(),
        child: Text(
          data.value ?? "",
          style: style,
        ),
      ),
    );
    return list.toList();
  }

  // ignore: unused_element
  static FilterOperatorList get filterOperator {
    var json =
        '{"OperatorDate": {"eq": "Eşit","gt": "Sonra","gte": "Sonra veya eşit","lt": "Önce","lte": "Önce veya eşit","neq": "Eşit değil","isnull": "Null","isnotnull": "Null değil"},"OperatorEnums": {"eq": "Eşit","neq": "Eşit değil","isnull": "Null","isnotnull": "Null değil"},"OperatorNumber": {"eq": "Eşit","gt": "Büyük","gte": "Büyük veya eşit","lt": "Küçük","lte": "Küçük veya eşit","neq": "Eşit değil","isnull": "Null","isnotnull": "Null değil"},"OperatorString": {"contains": "İçeriyor","doesnotcontain": "İçermiyor","endswith": "İle biter","eq": "Eşit","neq": "Eşit değil","startswith": "İle başlar","isnull": "Null","isnotnull": "Null değil","isempty": "Boş","isnotempty": "Boş değil","isnullorempty": "Değer içermiyor","isnotnullorempty": "Değer içeriyor"}}';
    return FilterOperatorList.fromJson(jsonDecode(json) as Map<String, dynamic>);
  }

  static List<DropdownMenuItem<String>> preregistrationStatusList({
    TextStyle? style,
  }) {
    if (style == null) {
      style = primaryTextStyle(size: textSizeSMedium, color: appTextColorPrimary);
    }

    var list = [
      KeyValueModel(key: '1', value: 'Görüşülüyor'),
      KeyValueModel(key: '2', value: 'Kayıt Edildi'),
      KeyValueModel(key: '3', value: 'İptal Edildi'),
    ].map(
      (data) => new DropdownMenuItem<String>(
        value: data.key.toString(),
        child: Text(
          data.value ?? "",
          style: style,
        ),
      ),
    );
    return list.toList();
  }

  static List<DropdownMenuItem<String>> foodStatusList({
    TextStyle? style,
  }) {
    if (style == null) {
      style = primaryTextStyle(size: textSizeSMedium, color: appTextColorPrimary);
    }

    var list = [
      KeyValueModel(key: '1', value: 'Az Yedi'),
      KeyValueModel(key: '2', value: 'Orta Yedi'),
      KeyValueModel(key: '3', value: 'Çok Yedi'),
    ].map(
      (data) => new DropdownMenuItem<String>(
        value: data.key.toString(),
        child: Text(
          data.value ?? "",
          style: style,
        ),
      ),
    );
    return list.toList();
  }

  static List<DropdownMenuItem<String>> sleepStatusList({
    TextStyle? style,
  }) {
    if (style == null) {
      style = primaryTextStyle(size: textSizeSMedium, color: appTextColorPrimary);
    }

    var list = [
      KeyValueModel(key: '1', value: 'Az Uyudu'),
      KeyValueModel(key: '2', value: 'Orta Uyudu'),
      KeyValueModel(key: '3', value: 'Çok Uyudu'),
    ].map(
      (data) => new DropdownMenuItem<String>(
        value: data.key.toString(),
        child: Text(
          data.value ?? "",
          style: style,
        ),
      ),
    );
    return list.toList();
  }

  static List<DropdownMenuItem<String>> activityStatusList({
    TextStyle? style,
  }) {
    if (style == null) {
      style = primaryTextStyle(size: textSizeSMedium, color: appTextColorPrimary);
    }

    var list = [
      KeyValueModel(key: '1', value: 'Az Katıldı'),
      KeyValueModel(key: '2', value: 'Orta Katıldı'),
      KeyValueModel(key: '3', value: 'Çok Katıldı'),
    ].map(
      (data) => new DropdownMenuItem<String>(
        value: data.key.toString(),
        child: Text(
          data.value ?? "",
          style: style,
        ),
      ),
    );
    return list.toList();
  }
}
