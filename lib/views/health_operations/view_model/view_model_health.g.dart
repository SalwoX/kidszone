// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_model_health.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ViewModelHealth on _ViewModelSaglikBase, Store {
  late final _$titleAtom =
      Atom(name: '_ViewModelSaglikBase.title', context: context);

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
      Atom(name: '_ViewModelSaglikBase.repCommon', context: context);

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
      Atom(name: '_ViewModelSaglikBase.active', context: context);

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

  late final _$selectedStudentAtom =
      Atom(name: '_ViewModelSaglikBase.selectedStudent', context: context);

  @override
  StudentModel get selectedStudent {
    _$selectedStudentAtom.reportRead();
    return super.selectedStudent;
  }

  @override
  set selectedStudent(StudentModel value) {
    _$selectedStudentAtom.reportWrite(value, super.selectedStudent, () {
      super.selectedStudent = value;
    });
  }

  late final _$studentIdAtom =
      Atom(name: '_ViewModelSaglikBase.studentId', context: context);

  @override
  TextEditingController get studentId {
    _$studentIdAtom.reportRead();
    return super.studentId;
  }

  @override
  set studentId(TextEditingController value) {
    _$studentIdAtom.reportWrite(value, super.studentId, () {
      super.studentId = value;
    });
  }

  late final _$sizeAtom =
      Atom(name: '_ViewModelSaglikBase.size', context: context);

  @override
  TextEditingController get size {
    _$sizeAtom.reportRead();
    return super.size;
  }

  @override
  set size(TextEditingController value) {
    _$sizeAtom.reportWrite(value, super.size, () {
      super.size = value;
    });
  }

  late final _$weightAtom =
      Atom(name: '_ViewModelSaglikBase.weight', context: context);

  @override
  TextEditingController get weight {
    _$weightAtom.reportRead();
    return super.weight;
  }

  @override
  set weight(TextEditingController value) {
    _$weightAtom.reportWrite(value, super.weight, () {
      super.weight = value;
    });
  }

  late final _$chronicIllnessAtom =
      Atom(name: '_ViewModelSaglikBase.chronicIllness', context: context);

  @override
  bool? get chronicIllness {
    _$chronicIllnessAtom.reportRead();
    return super.chronicIllness;
  }

  @override
  set chronicIllness(bool? value) {
    _$chronicIllnessAtom.reportWrite(value, super.chronicIllness, () {
      super.chronicIllness = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_ViewModelSaglikBase.description', context: context);

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
      Atom(name: '_ViewModelSaglikBase.picker', context: context);

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

  late final _$modelListAtom =
      Atom(name: '_ViewModelSaglikBase.modelList', context: context);

  @override
  List<HealthModel> get modelList {
    _$modelListAtom.reportRead();
    return super.modelList;
  }

  @override
  set modelList(List<HealthModel> value) {
    _$modelListAtom.reportWrite(value, super.modelList, () {
      super.modelList = value;
    });
  }

  late final _$modelAtom =
      Atom(name: '_ViewModelSaglikBase.model', context: context);

  @override
  HealthModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(HealthModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$modelDetailAtom =
      Atom(name: '_ViewModelSaglikBase.modelDetail', context: context);

  @override
  ObservableList<HealthDetailModel> get modelDetail {
    _$modelDetailAtom.reportRead();
    return super.modelDetail;
  }

  @override
  set modelDetail(ObservableList<HealthDetailModel> value) {
    _$modelDetailAtom.reportWrite(value, super.modelDetail, () {
      super.modelDetail = value;
    });
  }

  late final _$studentListAtom =
      Atom(name: '_ViewModelSaglikBase.studentList', context: context);

  @override
  List<StudentModel> get studentList {
    _$studentListAtom.reportRead();
    return super.studentList;
  }

  @override
  set studentList(List<StudentModel> value) {
    _$studentListAtom.reportWrite(value, super.studentList, () {
      super.studentList = value;
    });
  }

  late final _$photoListAtom =
      Atom(name: '_ViewModelSaglikBase.photoList', context: context);

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

  late final _$getStudentsAsyncAction =
      AsyncAction('_ViewModelSaglikBase.getStudents', context: context);

  @override
  Future<void> getStudents() {
    return _$getStudentsAsyncAction.run(() => super.getStudents());
  }

  late final _$addOrUpdateAsyncAction =
      AsyncAction('_ViewModelSaglikBase.addOrUpdate', context: context);

  @override
  Future<void> addOrUpdate(HealthModel model, BuildContext context) {
    return _$addOrUpdateAsyncAction
        .run(() => super.addOrUpdate(model, context));
  }

  late final _$_ViewModelSaglikBaseActionController =
      ActionController(name: '_ViewModelSaglikBase', context: context);

  @override
  void set(HealthModel _model) {
    final _$actionInfo = _$_ViewModelSaglikBaseActionController.startAction(
        name: '_ViewModelSaglikBase.set');
    try {
      return super.set(_model);
    } finally {
      _$_ViewModelSaglikBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addAnotherMedicament() {
    final _$actionInfo = _$_ViewModelSaglikBaseActionController.startAction(
        name: '_ViewModelSaglikBase.addAnotherMedicament');
    try {
      return super.addAnotherMedicament();
    } finally {
      _$_ViewModelSaglikBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
repCommon: ${repCommon},
active: ${active},
selectedStudent: ${selectedStudent},
studentId: ${studentId},
size: ${size},
weight: ${weight},
chronicIllness: ${chronicIllness},
description: ${description},
picker: ${picker},
modelList: ${modelList},
model: ${model},
modelDetail: ${modelDetail},
studentList: ${studentList},
photoList: ${photoList}
    ''';
  }
}
