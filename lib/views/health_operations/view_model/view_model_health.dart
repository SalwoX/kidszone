import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../common/app_config.dart';
import '../../../data/repositories/repository_common.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../register.dart';
import '../../_init/components/widgets/kzsnack_widget_minifity.dart';
import '../../_init/models/mobile_result.dart';
import '../../_init/view_model/base_view_model.dart';
import '../../registration/student/model/student_model.dart';
import '../model/health_detail_model.dart';
import '../model/health_model.dart';
import '../service/repository_health.dart';

part 'view_model_health.g.dart';

class ViewModelHealth = _ViewModelSaglikBase with _$ViewModelHealth;

abstract class _ViewModelSaglikBase extends BaseViewModel<HealthModel, RepositoryHealth> with Store {
  @override
  void setContext(BuildContext ctx) => this.ctx = ctx;

  int bottomNavigationBarIndex = 0;
  final formKey = GlobalKey<FormState>();

  @observable
  var title = LocaleKeys.pageHealthProcess_health_care.tr();

  // #region Kayıt
  @observable
  var repCommon = resolve<RepositoryCommon>();

  @observable
  bool? active;

  @observable
  var selectedStudent = StudentModel();

  @observable
  var studentId = TextEditingController();

  @observable
  var size = TextEditingController();

  @observable
  var weight = TextEditingController();

  @observable
  bool? chronicIllness;

  @observable
  var description = TextEditingController();

  @observable
  var picker = ImagePicker();

  @observable
  var modelList = <HealthModel>[];

  @observable
  var model = HealthModel(healthDetailModels: []);

  @observable
  var modelDetail = ObservableList<HealthDetailModel>();

  @observable
  var studentList = <StudentModel>[];

  // #endregion

  //#region Arama Sayfası

  @observable
  List<File> photoList = [];

  void setList(List<HealthModel> model, bool isNew) {
    lastRegistration = model.length < AppConfig.pageSize;
    if (isNew)
      modelList = model;
    else
      modelList.addAll(model);
  }

  @action
  void set(HealthModel _model) {
    model = _model;
    model.healthDetailModels = model.healthDetailModels ?? [];
    modelDetail.addAll(model.healthDetailModels!);
    if (modelDetail.length == 0) {
      modelDetail.add(HealthDetailModel(id: 0));
    }
  }

  Future<bool> get() async {
    try {
      var repGet = resolve<RepositoryHealth>();
      Status = PageState.LOADING;
      var res = await repGet.get(filterModel: filter);
      if (res is HealthModel) {
        Status = PageState.SUCCESS;
        set(res);
      } else if (res is MobileResult) {
        if (res.statusCode == "1") {
          Status = PageState.SUCCESS;
          set(HealthModel(id: 0));
        } else {
          Status = PageState.ERROR;
        }
      }
    } catch (e) {
      Status = PageState.ERROR;
    }
    return true;
  }

  //#endregion

  @action
  void addAnotherMedicament() {
    modelDetail.add(HealthDetailModel(id: 0));
  }

  @action
  Future<void> getStudents() async {
    try {
      var repGet = resolve<RepositoryCommon>();
      Status = PageState.LOADING;
      var res = await repGet.getStudentList(fields);
      studentList = res;
    } catch (e) {
      Status = PageState.ERROR;
    }
  }

  // #region Kayıt İşlemleri
  @action
  Future<void> addOrUpdate(HealthModel model, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      //model.aktif = model.aktif ?? true;
      var repRegistration = resolve<RepositoryHealth>();

      var res = await repRegistration.addOrUpdate(
        model: model,
        files: photoList,
      );

      if (res is HealthModel) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageHealthProcess_saved.tr(),
            messageType: MessageType.Success,
          ),
        );
        model = res;
      } else if (res is MobileResult) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageHealthProcess_not_saved.tr() + (res.message ?? ''),
            messageType: MessageType.Error,
          ),
        );
      }
    }
    saveEnable = true;
  }
  // #endregion
}
