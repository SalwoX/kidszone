// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_model_branch.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ViewModelBranch on _ViewModelBranchBase, Store {
  late final _$page_titleAtom =
      Atom(name: '_ViewModelBranchBase.page_title', context: context);

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
      Atom(name: '_ViewModelBranchBase.repCommon', context: context);

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

  late final _$branchNameAtom =
      Atom(name: '_ViewModelBranchBase.branchName', context: context);

  @override
  TextEditingController get branchName {
    _$branchNameAtom.reportRead();
    return super.branchName;
  }

  @override
  set branchName(TextEditingController value) {
    _$branchNameAtom.reportWrite(value, super.branchName, () {
      super.branchName = value;
    });
  }

  late final _$addressAtom =
      Atom(name: '_ViewModelBranchBase.address', context: context);

  @override
  TextEditingController get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(TextEditingController value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$logoUrlAtom =
      Atom(name: '_ViewModelBranchBase.logoUrl', context: context);

  @override
  TextEditingController get logoUrl {
    _$logoUrlAtom.reportRead();
    return super.logoUrl;
  }

  @override
  set logoUrl(TextEditingController value) {
    _$logoUrlAtom.reportWrite(value, super.logoUrl, () {
      super.logoUrl = value;
    });
  }

  late final _$phoneNumberAtom =
      Atom(name: '_ViewModelBranchBase.phoneNumber', context: context);

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

  late final _$mailAtom =
      Atom(name: '_ViewModelBranchBase.mail', context: context);

  @override
  TextEditingController get mail {
    _$mailAtom.reportRead();
    return super.mail;
  }

  @override
  set mail(TextEditingController value) {
    _$mailAtom.reportWrite(value, super.mail, () {
      super.mail = value;
    });
  }

  late final _$sloganAtom =
      Atom(name: '_ViewModelBranchBase.slogan', context: context);

  @override
  TextEditingController get slogan {
    _$sloganAtom.reportRead();
    return super.slogan;
  }

  @override
  set slogan(TextEditingController value) {
    _$sloganAtom.reportWrite(value, super.slogan, () {
      super.slogan = value;
    });
  }

  late final _$activeAtom =
      Atom(name: '_ViewModelBranchBase.active', context: context);

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

  late final _$pickerAtom =
      Atom(name: '_ViewModelBranchBase.picker', context: context);

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
      Atom(name: '_ViewModelBranchBase.model', context: context);

  @override
  BranchModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(BranchModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$photoListAtom =
      Atom(name: '_ViewModelBranchBase.photoList', context: context);

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
branchName: ${branchName},
address: ${address},
logoUrl: ${logoUrl},
phoneNumber: ${phoneNumber},
mail: ${mail},
slogan: ${slogan},
active: ${active},
picker: ${picker},
model: ${model},
photoList: ${photoList}
    ''';
  }
}
