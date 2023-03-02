import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../data/repositories/repository_common.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../register.dart';
import '../../../_init/components/widgets/kzsnack_widget_minifity.dart';
import '../../../_init/models/mobile_result.dart';
import '../../../_init/view_model/base_view_model.dart';
import '../model/school_model.dart';
import '../service/repository_school.dart';

part 'view_model_school.g.dart';

class ViewModelSchool = _ViewModelSchoolBase with _$ViewModelSchool;

abstract class _ViewModelSchoolBase extends BaseViewModel<SchoolModel, RepositorySchool> with Store {
  @override
  void setContext(BuildContext ctx) => this.ctx = ctx;

  int bottomNavigationBarIndex = 0;
  final formKey = GlobalKey<FormState>();

  @observable
  var page_title = LocaleKeys.condition_school.tr();

  // #region Kayıt
  @observable
  var repCommon = resolve<RepositoryCommon>();

  @observable
  var name = TextEditingController();

  @observable
  var degree = TextEditingController();

  @observable
  var paketGroup = TextEditingController();

  @observable
  bool? active;

  @observable
  var paketGroupName = TextEditingController();

  @observable
  var numberOfStudent = TextEditingController();

  @observable
  var picker = ImagePicker();

  @observable
  var model = SchoolModel();
  // #endregion

  //#region Arama Sayfası

  @observable
  List<File> photoList = [];

  //#endregion

  // #region Kayıt İşlemleri

  Future<void> addOrUpdate(SchoolModel model, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      model.active = model.active ?? true;
      var repRegistration = resolve<RepositorySchool>();
      var res = await repRegistration.addOrUpdate(
        model: model,
        files: photoList,
      );

      if (res is SchoolModel) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.condition_saved.tr(),
            messageType: MessageType.Success,
          ),
        );
        model = res;
      } else if (res is MobileResult) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.condition_not_saved.tr() + (res.message ?? ''),
            messageType: MessageType.Error,
          ),
        );
      }
    }
    saveEnable = true;
  }
  // #endregion
}
