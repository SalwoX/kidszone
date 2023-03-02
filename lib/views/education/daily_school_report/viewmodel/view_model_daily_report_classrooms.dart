import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../common/app_config.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../register.dart';
import '../../../_init/models/filter_model.dart';
import '../../../_init/models/mobile_result.dart';
import '../../../_init/view_model/base_view_model.dart';
import '../../../registration/class_room/model/classroom_model.dart';
import '../../../registration/class_room/service/repository_classroom.dart';

part 'view_model_daily_report_classrooms.g.dart';

class ViewModelDailyReportClassrooms = _ViewModelDailyReportClassroomsBase with _$ViewModelDailyReportClassrooms;

abstract class _ViewModelDailyReportClassroomsBase extends BaseViewModel<ClassroomModel, RepositoryClassroom> with Store {
  RepositoryClassroom rep = resolve<RepositoryClassroom>();

  @override
  void setContext(BuildContext ctx) => this.ctx = ctx;

  @override
  void init() {}

  @override
  var page_title = LocaleKeys.condition_classes.tr();

  @override
  var page_subTitle = "";

  @observable
  var model = <ClassroomModel>[];

  void setList(List<ClassroomModel> _model, bool yeni) {
    lastRegistration = _model.length < AppConfig.pageSize;
    if (yeni)
      model = _model;
    else
      model.addAll(_model);
  }

  @action
  Future<void> upload({bool isNew = true}) async {
    try {
      var filterModel = FilterModel(fields: fields, page: 0, pageSize: AppConfig.pageSize);

      var rep = resolve<RepositoryClassroom>();
      Status = PageState.LOADING;
      var res = await rep.getListTeacherDependentClasses(filterModel: filterModel);
      if (res is List<ClassroomModel>) {
        model = res;
        Status = PageState.SUCCESS;
      } else if (res is MobileResult) {
        if (res.statusCode == "1") {
          Status = PageState.SUCCESS;
          model = [];
        } else {
          Status = PageState.ERROR;
          model = [];
        }
      }
    } catch (e) {
      Status = PageState.ERROR;
    }
  }

  Future<void> reload() async {
    lastRegistration = false;
    filter.page = 1;
    await upload();
  }

  Future<void> nextList() async {
    if (!lastRegistration) {
      filter.page += 1;
      await upload(isNew: false);
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }
  }
}
