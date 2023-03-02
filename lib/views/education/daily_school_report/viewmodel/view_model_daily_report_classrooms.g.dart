// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_model_daily_report_classrooms.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ViewModelDailyReportClassrooms
    on _ViewModelDailyReportClassroomsBase, Store {
  late final _$modelAtom =
      Atom(name: '_ViewModelDailyReportClassroomsBase.model', context: context);

  @override
  List<ClassroomModel> get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(List<ClassroomModel> value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$uploadAsyncAction = AsyncAction(
      '_ViewModelDailyReportClassroomsBase.upload',
      context: context);

  @override
  Future<void> upload({bool isNew = true}) {
    return _$uploadAsyncAction.run(() => super.upload(isNew: isNew));
  }

  @override
  String toString() {
    return '''
model: ${model}
    ''';
  }
}
