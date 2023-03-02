// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_model_accounting.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ViewModelAccounting on _ViewModelAccountingBase, Store {
  late final _$titleAtom =
      Atom(name: '_ViewModelAccountingBase.title', context: context);

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

  late final _$photoListAtom =
      Atom(name: '_ViewModelAccountingBase.photoList', context: context);

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

  late final _$studentListModelAtom =
      Atom(name: '_ViewModelAccountingBase.studentListModel', context: context);

  @override
  List<StudentModel> get studentListModel {
    _$studentListModelAtom.reportRead();
    return super.studentListModel;
  }

  @override
  set studentListModel(List<StudentModel> value) {
    _$studentListModelAtom.reportWrite(value, super.studentListModel, () {
      super.studentListModel = value;
    });
  }

  @override
  String toString() {
    return '''
title: ${title},
photoList: ${photoList},
studentListModel: ${studentListModel}
    ''';
  }
}
