// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_model_school_bus.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ViewModelSchoolBus on _ViewModelSchoolBusBase, Store {
  late final _$titleAtom =
      Atom(name: '_ViewModelSchoolBusBase.title', context: context);

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
      Atom(name: '_ViewModelSchoolBusBase.repCommon', context: context);

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
      Atom(name: '_ViewModelSchoolBusBase.active', context: context);

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

  late final _$profileNameAtom =
      Atom(name: '_ViewModelSchoolBusBase.profileName', context: context);

  @override
  TextEditingController get profileName {
    _$profileNameAtom.reportRead();
    return super.profileName;
  }

  @override
  set profileName(TextEditingController value) {
    _$profileNameAtom.reportWrite(value, super.profileName, () {
      super.profileName = value;
    });
  }

  late final _$plateAtom =
      Atom(name: '_ViewModelSchoolBusBase.plate', context: context);

  @override
  TextEditingController get plate {
    _$plateAtom.reportRead();
    return super.plate;
  }

  @override
  set plate(TextEditingController value) {
    _$plateAtom.reportWrite(value, super.plate, () {
      super.plate = value;
    });
  }

  late final _$driverAtom =
      Atom(name: '_ViewModelSchoolBusBase.driver', context: context);

  @override
  TextEditingController get driver {
    _$driverAtom.reportRead();
    return super.driver;
  }

  @override
  set driver(TextEditingController value) {
    _$driverAtom.reportWrite(value, super.driver, () {
      super.driver = value;
    });
  }

  late final _$driverNumAtom =
      Atom(name: '_ViewModelSchoolBusBase.driverNum', context: context);

  @override
  TextEditingController get driverNum {
    _$driverNumAtom.reportRead();
    return super.driverNum;
  }

  @override
  set driverNum(TextEditingController value) {
    _$driverNumAtom.reportWrite(value, super.driverNum, () {
      super.driverNum = value;
    });
  }

  late final _$attendantAtom =
      Atom(name: '_ViewModelSchoolBusBase.attendant', context: context);

  @override
  TextEditingController get attendant {
    _$attendantAtom.reportRead();
    return super.attendant;
  }

  @override
  set attendant(TextEditingController value) {
    _$attendantAtom.reportWrite(value, super.attendant, () {
      super.attendant = value;
    });
  }

  late final _$attendantNumAtom =
      Atom(name: '_ViewModelSchoolBusBase.attendantNum', context: context);

  @override
  TextEditingController get attendantNum {
    _$attendantNumAtom.reportRead();
    return super.attendantNum;
  }

  @override
  set attendantNum(TextEditingController value) {
    _$attendantNumAtom.reportWrite(value, super.attendantNum, () {
      super.attendantNum = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_ViewModelSchoolBusBase.description', context: context);

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

  late final _$pickerAtom =
      Atom(name: '_ViewModelSchoolBusBase.picker', context: context);

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
      Atom(name: '_ViewModelSchoolBusBase.model', context: context);

  @override
  SchoolBusModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(SchoolBusModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$photoListAtom =
      Atom(name: '_ViewModelSchoolBusBase.photoList', context: context);

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
profileName: ${profileName},
plate: ${plate},
driver: ${driver},
driverNum: ${driverNum},
attendant: ${attendant},
attendantNum: ${attendantNum},
description: ${description},
picker: ${picker},
model: ${model},
photoList: ${photoList}
    ''';
  }
}
