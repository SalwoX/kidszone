// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseViewModel<TModel, TRepotitory extends RepositoryBase<dynamic>>
    on _BaseViewModelBase<TModel, TRepotitory>, Store {
  late final _$scrollControllerAtom =
      Atom(name: '_BaseViewModelBase.scrollController', context: context);

  @override
  ScrollController get scrollController {
    _$scrollControllerAtom.reportRead();
    return super.scrollController;
  }

  @override
  set scrollController(ScrollController value) {
    _$scrollControllerAtom.reportWrite(value, super.scrollController, () {
      super.scrollController = value;
    });
  }

  late final _$lastRegistrationAtom =
      Atom(name: '_BaseViewModelBase.lastRegistration', context: context);

  @override
  bool get lastRegistration {
    _$lastRegistrationAtom.reportRead();
    return super.lastRegistration;
  }

  @override
  set lastRegistration(bool value) {
    _$lastRegistrationAtom.reportWrite(value, super.lastRegistration, () {
      super.lastRegistration = value;
    });
  }

  late final _$oldFilterPageAtom =
      Atom(name: '_BaseViewModelBase.oldFilterPage', context: context);

  @override
  int get oldFilterPage {
    _$oldFilterPageAtom.reportRead();
    return super.oldFilterPage;
  }

  @override
  set oldFilterPage(int value) {
    _$oldFilterPageAtom.reportWrite(value, super.oldFilterPage, () {
      super.oldFilterPage = value;
    });
  }

  late final _$exceptionAtom =
      Atom(name: '_BaseViewModelBase.exception', context: context);

  @override
  String get exception {
    _$exceptionAtom.reportRead();
    return super.exception;
  }

  @override
  set exception(String value) {
    _$exceptionAtom.reportWrite(value, super.exception, () {
      super.exception = value;
    });
  }

  late final _$filterAtom =
      Atom(name: '_BaseViewModelBase.filter', context: context);

  @override
  FilterModel get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(FilterModel value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$fieldsAtom =
      Atom(name: '_BaseViewModelBase.fields', context: context);

  @override
  List<Field> get fields {
    _$fieldsAtom.reportRead();
    return super.fields;
  }

  @override
  set fields(List<Field> value) {
    _$fieldsAtom.reportWrite(value, super.fields, () {
      super.fields = value;
    });
  }

  late final _$_stateAtom =
      Atom(name: '_BaseViewModelBase._state', context: context);

  @override
  PageState? get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(PageState? value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$modelsAtom =
      Atom(name: '_BaseViewModelBase.models', context: context);

  @override
  List<TModel> get models {
    _$modelsAtom.reportRead();
    return super.models;
  }

  @override
  set models(List<TModel> value) {
    _$modelsAtom.reportWrite(value, super.models, () {
      super.models = value;
    });
  }

  late final _$saveAtom =
      Atom(name: '_BaseViewModelBase.save', context: context);

  @override
  bool get save {
    _$saveAtom.reportRead();
    return super.save;
  }

  @override
  set save(bool value) {
    _$saveAtom.reportWrite(value, super.save, () {
      super.save = value;
    });
  }

  late final _$saveEnableAtom =
      Atom(name: '_BaseViewModelBase.saveEnable', context: context);

  @override
  bool get saveEnable {
    _$saveEnableAtom.reportRead();
    return super.saveEnable;
  }

  @override
  set saveEnable(bool value) {
    _$saveEnableAtom.reportWrite(value, super.saveEnable, () {
      super.saveEnable = value;
    });
  }

  late final _$uploadAsyncAction =
      AsyncAction('_BaseViewModelBase.upload', context: context);

  @override
  Future<void> upload({bool isNew = true}) {
    return _$uploadAsyncAction.run(() => super.upload(isNew: isNew));
  }

  late final _$reloadAsyncAction =
      AsyncAction('_BaseViewModelBase.reload', context: context);

  @override
  Future<void> reload() {
    return _$reloadAsyncAction.run(() => super.reload());
  }

  late final _$nextListAsyncAction =
      AsyncAction('_BaseViewModelBase.nextList', context: context);

  @override
  Future<void> nextList() {
    return _$nextListAsyncAction.run(() => super.nextList());
  }

  @override
  String toString() {
    return '''
scrollController: ${scrollController},
lastRegistration: ${lastRegistration},
oldFilterPage: ${oldFilterPage},
exception: ${exception},
filter: ${filter},
fields: ${fields},
models: ${models},
save: ${save},
saveEnable: ${saveEnable}
    ''';
  }
}
