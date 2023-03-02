// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_model_executive.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ViewModelExecutive on _ViewModelExecutiveBase, Store {
  late final _$titleAtom =
      Atom(name: '_ViewModelExecutiveBase.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$repCommonAtom =
      Atom(name: '_ViewModelExecutiveBase.repCommon', context: context);

  @override
  RepositoryCommon get repCommon {
    _$repCommonAtom.reportRead();
    return super.repCommon;
  }

  @override
  set repCommon(RepositoryCommon value) {
    _$repCommonAtom.reportWrite(value, super.repCommon, () {
      super.repCommon = value;
    });
  }

  late final _$activeAtom =
      Atom(name: '_ViewModelExecutiveBase.active', context: context);

  @override
  bool? get active {
    _$activeAtom.reportRead();
    return super.active;
  }

  @override
  set active(bool? value) {
    _$activeAtom.reportWrite(value, super.active, () {
      super.active = value;
    });
  }

  late final _$nameSurnameAtom =
      Atom(name: '_ViewModelExecutiveBase.nameSurname', context: context);

  @override
  TextEditingController get nameSurname {
    _$nameSurnameAtom.reportRead();
    return super.nameSurname;
  }

  @override
  set nameSurname(TextEditingController value) {
    _$nameSurnameAtom.reportWrite(value, super.nameSurname, () {
      super.nameSurname = value;
    });
  }

  late final _$phoneNumberAtom =
      Atom(name: '_ViewModelExecutiveBase.phoneNumber', context: context);

  @override
  TextEditingController get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(TextEditingController value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_ViewModelExecutiveBase.password', context: context);

  @override
  TextEditingController get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(TextEditingController value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$imgUrlAtom =
      Atom(name: '_ViewModelExecutiveBase.imgUrl', context: context);

  @override
  TextEditingController get imgUrl {
    _$imgUrlAtom.reportRead();
    return super.imgUrl;
  }

  @override
  set imgUrl(TextEditingController value) {
    _$imgUrlAtom.reportWrite(value, super.imgUrl, () {
      super.imgUrl = value;
    });
  }

  late final _$permissionAtom =
      Atom(name: '_ViewModelExecutiveBase.permission', context: context);

  @override
  TextEditingController get permission {
    _$permissionAtom.reportRead();
    return super.permission;
  }

  @override
  set permission(TextEditingController value) {
    _$permissionAtom.reportWrite(value, super.permission, () {
      super.permission = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_ViewModelExecutiveBase.description', context: context);

  @override
  TextEditingController get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(TextEditingController value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$mobileLoginAtom =
      Atom(name: '_ViewModelExecutiveBase.mobileLogin', context: context);

  @override
  bool? get mobileLogin {
    _$mobileLoginAtom.reportRead();
    return super.mobileLogin;
  }

  @override
  set mobileLogin(bool? value) {
    _$mobileLoginAtom.reportWrite(value, super.mobileLogin, () {
      super.mobileLogin = value;
    });
  }

  late final _$webLoginAtom =
      Atom(name: '_ViewModelExecutiveBase.webLogin', context: context);

  @override
  bool? get webLogin {
    _$webLoginAtom.reportRead();
    return super.webLogin;
  }

  @override
  set webLogin(bool? value) {
    _$webLoginAtom.reportWrite(value, super.webLogin, () {
      super.webLogin = value;
    });
  }

  late final _$adminAtom =
      Atom(name: '_ViewModelExecutiveBase.admin', context: context);

  @override
  TextEditingController get admin {
    _$adminAtom.reportRead();
    return super.admin;
  }

  @override
  set admin(TextEditingController value) {
    _$adminAtom.reportWrite(value, super.admin, () {
      super.admin = value;
    });
  }

  late final _$pickerAtom =
      Atom(name: '_ViewModelExecutiveBase.picker', context: context);

  @override
  ImagePicker get picker {
    _$pickerAtom.reportRead();
    return super.picker;
  }

  @override
  set picker(ImagePicker value) {
    _$pickerAtom.reportWrite(value, super.picker, () {
      super.picker = value;
    });
  }

  late final _$modelAtom =
      Atom(name: '_ViewModelExecutiveBase.model', context: context);

  @override
  ExecutiveModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(ExecutiveModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$photoListAtom =
      Atom(name: '_ViewModelExecutiveBase.photoList', context: context);

  @override
  List<File> get photoList {
    _$photoListAtom.reportRead();
    return super.photoList;
  }

  @override
  set photoList(List<File> value) {
    _$photoListAtom.reportWrite(value, super.photoList, () {
      super.photoList = value;
    });
  }

  @override
  String toString() {
    return '''
title: ${title},
repCommon: ${repCommon},
active: ${active},
nameSurname: ${nameSurname},
phoneNumber: ${phoneNumber},
password: ${password},
imgUrl: ${imgUrl},
permission: ${permission},
description: ${description},
mobileLogin: ${mobileLogin},
webLogin: ${webLogin},
admin: ${admin},
picker: ${picker},
model: ${model},
photoList: ${photoList}
    ''';
  }
}
