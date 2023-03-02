// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_model_school.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ViewModelSchool on _ViewModelSchoolBase, Store {
  late final _$page_titleAtom =
      Atom(name: '_ViewModelSchoolBase.page_title', context: context);

  @override
  String get page_title {
    _$page_titleAtom.reportRead();
    return super.page_title;
  }

  @override
  set page_title(String value) {
    _$page_titleAtom.reportWrite(value, super.page_title, () {
      super.page_title = value;
    });
  }

  late final _$repCommonAtom =
      Atom(name: '_ViewModelSchoolBase.repCommon', context: context);

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

  late final _$nameAtom =
      Atom(name: '_ViewModelSchoolBase.name', context: context);

  @override
  TextEditingController get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(TextEditingController value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$degreeAtom =
      Atom(name: '_ViewModelSchoolBase.degree', context: context);

  @override
  TextEditingController get degree {
    _$degreeAtom.reportRead();
    return super.degree;
  }

  @override
  set degree(TextEditingController value) {
    _$degreeAtom.reportWrite(value, super.degree, () {
      super.degree = value;
    });
  }

  late final _$paketGroupAtom =
      Atom(name: '_ViewModelSchoolBase.paketGroup', context: context);

  @override
  TextEditingController get paketGroup {
    _$paketGroupAtom.reportRead();
    return super.paketGroup;
  }

  @override
  set paketGroup(TextEditingController value) {
    _$paketGroupAtom.reportWrite(value, super.paketGroup, () {
      super.paketGroup = value;
    });
  }

  late final _$activeAtom =
      Atom(name: '_ViewModelSchoolBase.active', context: context);

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

  late final _$paketGroupNameAtom =
      Atom(name: '_ViewModelSchoolBase.paketGroupName', context: context);

  @override
  TextEditingController get paketGroupName {
    _$paketGroupNameAtom.reportRead();
    return super.paketGroupName;
  }

  @override
  set paketGroupName(TextEditingController value) {
    _$paketGroupNameAtom.reportWrite(value, super.paketGroupName, () {
      super.paketGroupName = value;
    });
  }

  late final _$numberOfStudentAtom =
      Atom(name: '_ViewModelSchoolBase.numberOfStudent', context: context);

  @override
  TextEditingController get numberOfStudent {
    _$numberOfStudentAtom.reportRead();
    return super.numberOfStudent;
  }

  @override
  set numberOfStudent(TextEditingController value) {
    _$numberOfStudentAtom.reportWrite(value, super.numberOfStudent, () {
      super.numberOfStudent = value;
    });
  }

  late final _$pickerAtom =
      Atom(name: '_ViewModelSchoolBase.picker', context: context);

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
      Atom(name: '_ViewModelSchoolBase.model', context: context);

  @override
  SchoolModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(SchoolModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$photoListAtom =
      Atom(name: '_ViewModelSchoolBase.photoList', context: context);

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
page_title: ${page_title},
repCommon: ${repCommon},
name: ${name},
degree: ${degree},
paketGroup: ${paketGroup},
active: ${active},
paketGroupName: ${paketGroupName},
numberOfStudent: ${numberOfStudent},
picker: ${picker},
model: ${model},
photoList: ${photoList}
    ''';
  }
}
