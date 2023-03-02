// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_model_daily_report_x.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ViewModelDailyReportX on _ViewModelDailyReportXBase, Store {
  Computed<bool>? _$isEvenComputed;

  @override
  bool get isEven => (_$isEvenComputed ??= Computed<bool>(() => super.isEven,
          name: '_ViewModelDailyReportXBase.isEven'))
      .value;

  late final _$teacherNoteAtom =
      Atom(name: '_ViewModelDailyReportXBase.teacherNote', context: context);

  @override
  TextEditingController get teacherNote {
    _$teacherNoteAtom.reportRead();
    return super.teacherNote;
  }

  @override
  set teacherNote(TextEditingController value) {
    _$teacherNoteAtom.reportWrite(value, super.teacherNote, () {
      super.teacherNote = value;
    });
  }

  late final _$studentListAtom =
      Atom(name: '_ViewModelDailyReportXBase.studentList', context: context);

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

  late final _$classroomIdAtom =
      Atom(name: '_ViewModelDailyReportXBase.classroomId', context: context);

  @override
  int? get classroomId {
    _$classroomIdAtom.reportRead();
    return super.classroomId;
  }

  @override
  set classroomId(int? value) {
    _$classroomIdAtom.reportWrite(value, super.classroomId, () {
      super.classroomId = value;
    });
  }

  late final _$selectedStudentAtom = Atom(
      name: '_ViewModelDailyReportXBase.selectedStudent', context: context);

  @override
  StudentModel? get selectedStudent {
    _$selectedStudentAtom.reportRead();
    return super.selectedStudent;
  }

  @override
  set selectedStudent(StudentModel? value) {
    _$selectedStudentAtom.reportWrite(value, super.selectedStudent, () {
      super.selectedStudent = value;
    });
  }

  late final _$modelAtom =
      Atom(name: '_ViewModelDailyReportXBase.model', context: context);

  @override
  DailyReportModel? get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(DailyReportModel? value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$templateModelAtom =
      Atom(name: '_ViewModelDailyReportXBase.templateModel', context: context);

  @override
  DailyReportTemplateModel? get templateModel {
    _$templateModelAtom.reportRead();
    return super.templateModel;
  }

  @override
  set templateModel(DailyReportTemplateModel? value) {
    _$templateModelAtom.reportWrite(value, super.templateModel, () {
      super.templateModel = value;
    });
  }

  late final _$getTemplateAsyncAction =
      AsyncAction('_ViewModelDailyReportXBase.getTemplate', context: context);

  @override
  Future<void> getTemplate() {
    return _$getTemplateAsyncAction.run(() => super.getTemplate());
  }

  late final _$saveTemplateAsyncAction =
      AsyncAction('_ViewModelDailyReportXBase.saveTemplate', context: context);

  @override
  Future<void> saveTemplate() {
    return _$saveTemplateAsyncAction.run(() => super.saveTemplate());
  }

  late final _$getStudentReportAsyncAction = AsyncAction(
      '_ViewModelDailyReportXBase.getStudentReport',
      context: context);

  @override
  Future<void> getStudentReport() {
    return _$getStudentReportAsyncAction.run(() => super.getStudentReport());
  }

  late final _$saveReportAsyncAction =
      AsyncAction('_ViewModelDailyReportXBase.saveReport', context: context);

  @override
  Future<void> saveReport() {
    return _$saveReportAsyncAction.run(() => super.saveReport());
  }

  @override
  String toString() {
    return '''
teacherNote: ${teacherNote},
studentList: ${studentList},
classroomId: ${classroomId},
selectedStudent: ${selectedStudent},
model: ${model},
templateModel: ${templateModel},
isEven: ${isEven}
    ''';
  }
}
