// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PageNoticeViewModel on _PageNoticeViewModelBase, Store {
  late final _$repCommonAtom =
      Atom(name: '_PageNoticeViewModelBase.repCommon', context: context);

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

  late final _$targetGroupAtom =
      Atom(name: '_PageNoticeViewModelBase.targetGroup', context: context);

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
      Atom(name: '_PageNoticeViewModelBase.targetClassroom', context: context);

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

  late final _$targetTeacherAtom =
      Atom(name: '_PageNoticeViewModelBase.targetTeacher', context: context);

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

  late final _$titleAtom =
      Atom(name: '_PageNoticeViewModelBase.title', context: context);

  @override
  TextEditingController get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(TextEditingController value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$contentAtom =
      Atom(name: '_PageNoticeViewModelBase.content', context: context);

  @override
  TextEditingController get content {
    _$contentAtom.reportRead();
    return super.content;
  }

  @override
  set content(TextEditingController value) {
    _$contentAtom.reportWrite(value, super.content, () {
      super.content = value;
    });
  }

  late final _$linkAtom =
      Atom(name: '_PageNoticeViewModelBase.link', context: context);

  @override
  TextEditingController get link {
    _$linkAtom.reportRead();
    return super.link;
  }

  @override
  set link(TextEditingController value) {
    _$linkAtom.reportWrite(value, super.link, () {
      super.link = value;
    });
  }

  late final _$imgUrlAtom =
      Atom(name: '_PageNoticeViewModelBase.imgUrl', context: context);

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

  late final _$pinnedAtom =
      Atom(name: '_PageNoticeViewModelBase.pinned', context: context);

  @override
  bool get pinned {
    _$pinnedAtom.reportRead();
    return super.pinned;
  }

  @override
  set pinned(bool value) {
    _$pinnedAtom.reportWrite(value, super.pinned, () {
      super.pinned = value;
    });
  }

  late final _$visibleClassroomAtom =
      Atom(name: '_PageNoticeViewModelBase.visibleClassroom', context: context);

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
      Atom(name: '_PageNoticeViewModelBase.visibleTeacher', context: context);

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

  late final _$pickerAtom =
      Atom(name: '_PageNoticeViewModelBase.picker', context: context);

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
      Atom(name: '_PageNoticeViewModelBase.model', context: context);

  @override
  NoticeModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(NoticeModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$photoListAtom =
      Atom(name: '_PageNoticeViewModelBase.photoList', context: context);

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
targetGroup: ${targetGroup},
targetClassroom: ${targetClassroom},
targetTeacher: ${targetTeacher},
title: ${title},
content: ${content},
link: ${link},
imgUrl: ${imgUrl},
pinned: ${pinned},
visibleClassroom: ${visibleClassroom},
visibleTeacher: ${visibleTeacher},
picker: ${picker},
model: ${model},
photoList: ${photoList}
    ''';
  }
}
