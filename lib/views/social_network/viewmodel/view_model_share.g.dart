// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_model_share.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ViewModelShare on _ViewModelShareBase, Store {
  late final _$targetGroupAtom =
      Atom(name: '_ViewModelShareBase.targetGroup', context: context);

  @override
  TextEditingController get targetGroup {
    _$targetGroupAtom.reportRead();
    return super.targetGroup;
  }

  @override
  set targetGroup(TextEditingController value) {
    _$targetGroupAtom.reportWrite(value, super.targetGroup, () {
      super.targetGroup = value;
    });
  }

  late final _$targetClassroomAtom =
      Atom(name: '_ViewModelShareBase.targetClassroom', context: context);

  @override
  TextEditingController get targetClassroom {
    _$targetClassroomAtom.reportRead();
    return super.targetClassroom;
  }

  @override
  set targetClassroom(TextEditingController value) {
    _$targetClassroomAtom.reportWrite(value, super.targetClassroom, () {
      super.targetClassroom = value;
    });
  }

  late final _$pickerAtom =
      Atom(name: '_ViewModelShareBase.picker', context: context);

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

  late final _$targetTeacherAtom =
      Atom(name: '_ViewModelShareBase.targetTeacher', context: context);

  @override
  TextEditingController get targetTeacher {
    _$targetTeacherAtom.reportRead();
    return super.targetTeacher;
  }

  @override
  set targetTeacher(TextEditingController value) {
    _$targetTeacherAtom.reportWrite(value, super.targetTeacher, () {
      super.targetTeacher = value;
    });
  }

  late final _$photoListAtom =
      Atom(name: '_ViewModelShareBase.photoList', context: context);

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

  late final _$visibleClassroomAtom =
      Atom(name: '_ViewModelShareBase.visibleClassroom', context: context);

  @override
  bool get visibleClassroom {
    _$visibleClassroomAtom.reportRead();
    return super.visibleClassroom;
  }

  @override
  set visibleClassroom(bool value) {
    _$visibleClassroomAtom.reportWrite(value, super.visibleClassroom, () {
      super.visibleClassroom = value;
    });
  }

  late final _$visibleTeacherAtom =
      Atom(name: '_ViewModelShareBase.visibleTeacher', context: context);

  @override
  bool get visibleTeacher {
    _$visibleTeacherAtom.reportRead();
    return super.visibleTeacher;
  }

  @override
  set visibleTeacher(bool value) {
    _$visibleTeacherAtom.reportWrite(value, super.visibleTeacher, () {
      super.visibleTeacher = value;
    });
  }

  late final _$visibleStudentAtom =
      Atom(name: '_ViewModelShareBase.visibleStudent', context: context);

  @override
  bool get visibleStudent {
    _$visibleStudentAtom.reportRead();
    return super.visibleStudent;
  }

  @override
  set visibleStudent(bool value) {
    _$visibleStudentAtom.reportWrite(value, super.visibleStudent, () {
      super.visibleStudent = value;
    });
  }

  late final _$modelAtom =
      Atom(name: '_ViewModelShareBase.model', context: context);

  @override
  SocialNetworkModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(SocialNetworkModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$commentAtom =
      Atom(name: '_ViewModelShareBase.comment', context: context);

  @override
  TextEditingController get comment {
    _$commentAtom.reportRead();
    return super.comment;
  }

  @override
  set comment(TextEditingController value) {
    _$commentAtom.reportWrite(value, super.comment, () {
      super.comment = value;
    });
  }

  late final _$isSelectedAtom =
      Atom(name: '_ViewModelShareBase.isSelected', context: context);

  @override
  List<bool> get isSelected {
    _$isSelectedAtom.reportRead();
    return super.isSelected;
  }

  @override
  set isSelected(List<bool> value) {
    _$isSelectedAtom.reportWrite(value, super.isSelected, () {
      super.isSelected = value;
    });
  }

  @override
  String toString() {
    return '''
targetGroup: ${targetGroup},
targetClassroom: ${targetClassroom},
picker: ${picker},
targetTeacher: ${targetTeacher},
photoList: ${photoList},
visibleClassroom: ${visibleClassroom},
visibleTeacher: ${visibleTeacher},
visibleStudent: ${visibleStudent},
model: ${model},
comment: ${comment},
isSelected: ${isSelected}
    ''';
  }
}
