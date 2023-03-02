// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_model_selection_student.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ViewModelSelectionStudent on ViewModelStudentSelectionBase, Store {
  late final _$repCommonAtom =
      Atom(name: 'ViewModelStudentSelectionBase.repCommon', context: context);

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

  late final _$modelAtom =
      Atom(name: 'ViewModelStudentSelectionBase.model', context: context);

  @override
  DailyReportModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(DailyReportModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$studentListAtom =
      Atom(name: 'ViewModelStudentSelectionBase.studentList', context: context);

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

  late final _$selectedStudentAtom = Atom(
      name: 'ViewModelStudentSelectionBase.selectedStudent', context: context);

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

  late final _$getStudentsAsyncAction = AsyncAction(
      'ViewModelStudentSelectionBase.getStudents',
      context: context);

  @override
  Future<void> getStudents() {
    return _$getStudentsAsyncAction.run(() => super.getStudents());
  }

  @override
  String toString() {
    return '''
repCommon: ${repCommon},
model: ${model},
studentList: ${studentList},
selectedStudent: ${selectedStudent}
    ''';
  }
}
