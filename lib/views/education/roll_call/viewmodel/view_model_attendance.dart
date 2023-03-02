import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../_init/view_model/base_view_model.dart';
import '../model/attendance_model.dart';
import '../service/repository_attendance.dart';

part 'view_model_attendance.g.dart';

class ViewModelAttendance = _ViewModelAttendanceBase with _$ViewModelAttendance;

abstract class _ViewModelAttendanceBase extends BaseViewModel<AttendanceModel, RepositoryAttendance> with Store {
  // RepositoryClassroom rep = resolve<RepositoryClassroom>();

  @override
  void setContext(BuildContext ctx) => this.ctx = ctx;

  @override
  void init() {}

  @override
  var page_title = LocaleKeys.condition_attendance.tr();

  @override
  var page_subTitle = "";

  var selectedItem = AttendanceModel();
}
