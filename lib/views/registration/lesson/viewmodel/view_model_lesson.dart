import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../common/app_config.dart';
import '../../../../data/repositories/repository_common.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../register.dart';
import '../../../_init/components/widgets/kzsnack_widget_minifity.dart';
import '../../../_init/models/filter_model.dart';
import '../../../_init/models/mobile_result.dart';
import '../../../_init/view_model/base_view_model.dart';
import '../model/lesson_model.dart';
import '../service/repository_lesson.dart';

part 'view_model_lesson.g.dart';

class ViewModelLesson = _ViewModelLessonBase with _$ViewModelLesson;

abstract class _ViewModelLessonBase extends BaseViewModel<LessonModel, RepositoryLesson> with Store {
  @override
  void setContext(BuildContext ctx) => this.ctx = ctx;

  @override
  void init() {}

  int bottomNavigationBarIndex = 0;
  final formKey = GlobalKey<FormState>();

  @observable
  var page_title = LocaleKeys.pageRegistrationLesson_lesson.tr();

  final String page_subTitle = "";

  @observable
  var scrollController = ScrollController();

  @observable
  var lastRegistration = false;

  @observable
  var oldFilterPage = 0;

  @observable
  var exception = "";

  // #region Kayıt
  @observable
  var repCommon = resolve<RepositoryCommon>();

  @observable
  var save = true;

  @observable
  var saveEnable = true;

  @observable
  bool? active;

  @observable
  var classroomId = TextEditingController();

  @observable
  var teacherId = TextEditingController();

  @observable
  var name = TextEditingController();

  @observable
  var shortName = TextEditingController();

  @observable
  var description = TextEditingController();

  @observable
  var color = TextEditingController();

  @observable
  var credit = TextEditingController();

  @observable
  var picker = ImagePicker();

  @observable
  var model = LessonModel();
  // #endregion

  //#region Arama Sayfası
  @observable
  PageState? _state;

  @observable
  FilterModel filter = FilterModel(
    page: 1,
    pageSize: AppConfig.pageSize,
    fields: <Field>[],
  );

  @observable
  List<Field> fields = [];

  @observable
  List<File> photoList = [];

  List<LessonModel> _modelList = [];
  List<LessonModel> get modelList => _modelList;

  void setList(List<LessonModel> model, bool isNew) {
    lastRegistration = model.length < AppConfig.pageSize;
    if (isNew)
      _modelList = model;
    else
      _modelList.addAll(model);
  }

  Future<void> getList({bool isNew = true}) async {
    try {
      var repGet = resolve<RepositoryLesson>();
      Status = PageState.LOADING;
      var res = await repGet.getList(filterModel: filter);
      if (res is List<LessonModel>) {
        Status = PageState.SUCCESS;
        setList(res, isNew);
      } else if (res is MobileResult) {
        if (res.statusCode == "1") {
          Status = PageState.SUCCESS;
          setList([], isNew);
        } else {
          Status = PageState.ERROR;
        }
      }
    } catch (e) {
      Status = PageState.ERROR;
    }
  }

  Future<void> reload() async {
    lastRegistration = false;
    filter.page = 1;
    await getList();
  }

  Future<void> nextList() async {
    if (!lastRegistration) {
      filter.page += 1;
      await getList(isNew: false);
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }
  }

  //#endregion

  // #region Kayıt İşlemleri

  Future<void> addOrUpdate(LessonModel model, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      model.active = model.active ?? true;
      var repKayit = resolve<RepositoryLesson>();

      var res = await repKayit.addOrUpdate(
        model: model,
        files: photoList,
      );

      if (res is LessonModel) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageRegistrationLesson_saved.tr(),
            messageType: MessageType.Success,
          ),
        );
        model = res;
      } else if (res is MobileResult) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageRegistrationLesson_not_saved.tr() + (res.message ?? ''),
            messageType: MessageType.Error,
          ),
        );
      }
    }
    saveEnable = true;
  }
  // #endregion
}
