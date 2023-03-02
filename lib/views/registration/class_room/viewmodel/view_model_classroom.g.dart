// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_model_classroom.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ViewModelClassroom on _ViewModelClassroomBase, Store {
  late final _$repCommonAtom =
      Atom(name: '_ViewModelClassroomBase.repCommon', context: context);

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
      Atom(name: '_ViewModelClassroomBase.active', context: context);

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

  late final _$nameAtom =
      Atom(name: '_ViewModelClassroomBase.name', context: context);

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

  late final _$classTourAtom =
      Atom(name: '_ViewModelClassroomBase.classTour', context: context);

  @override
  TextEditingController get classTour {
    _$classTourAtom.reportRead();
    return super.classTour;
  }

  @override
  set classTour(TextEditingController value) {
    _$classTourAtom.reportWrite(value, super.classTour, () {
      super.classTour = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_ViewModelClassroomBase.description', context: context);

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

  late final _$imgUrlAtom =
      Atom(name: '_ViewModelClassroomBase.imgUrl', context: context);

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

  late final _$pickerAtom =
      Atom(name: '_ViewModelClassroomBase.picker', context: context);

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
      Atom(name: '_ViewModelClassroomBase.model', context: context);

  @override
  ClassroomModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(ClassroomModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$photoListAtom =
      Atom(name: '_ViewModelClassroomBase.photoList', context: context);

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
repCommon: ${repCommon},
active: ${active},
name: ${name},
classTour: ${classTour},
description: ${description},
imgUrl: ${imgUrl},
picker: ${picker},
model: ${model},
photoList: ${photoList}
    ''';
  }
}
