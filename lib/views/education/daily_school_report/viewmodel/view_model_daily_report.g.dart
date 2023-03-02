// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_model_daily_report.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ViewModelDailyReport on ViewModelDailyReportBase, Store {
  late final _$repCommonAtom =
      Atom(name: 'ViewModelDailyReportBase.repCommon', context: context);

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

  late final _$reportsAtom =
      Atom(name: 'ViewModelDailyReportBase.reports', context: context);

  @override
  ObservableList<Reports> get reports {
    _$reportsAtom.reportRead();
    return super.reports;
  }

  @override
  set reports(ObservableList<Reports> value) {
    _$reportsAtom.reportWrite(value, super.reports, () {
      super.reports = value;
    });
  }

  late final _$modelAtom =
      Atom(name: 'ViewModelDailyReportBase.model', context: context);

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

  @override
  String toString() {
    return '''
repCommon: ${repCommon},
reports: ${reports},
model: ${model}
    ''';
  }
}
