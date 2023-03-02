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
import '../model/school_bus_model.dart';
import '../service/repository_schoolbus.dart';

part 'view_model_school_bus.g.dart';

class ViewModelSchoolBus = _ViewModelSchoolBusBase with _$ViewModelSchoolBus;

abstract class _ViewModelSchoolBusBase extends BaseViewModel<SchoolBusModel, RepositorySchoolBus> with Store {
  @override
  void setContext(BuildContext ctx) => this.ctx = ctx;

  int bottomNavigationBarIndex = 0;
  final formKey = GlobalKey<FormState>();

  @observable
  var title = LocaleKeys.pageRegisSchoolBus_service.tr();

  // #region Kayıt
  @observable
  var repCommon = resolve<RepositoryCommon>();

  @observable
  bool? active;

  @observable
  var profileName = TextEditingController();

  @observable
  var plate = TextEditingController();

  @observable
  var driver = TextEditingController();

  @observable
  var driverNum = TextEditingController();

  @observable
  var attendant = TextEditingController();

  @observable
  var attendantNum = TextEditingController();

  @observable
  var description = TextEditingController();

  @observable
  var picker = ImagePicker();

  @observable
  var model = SchoolBusModel();
  // #endregion

  //#region Arama Sayfası

  @observable
  List<File> photoList = [];

  //#endregion

  // #region Kayıt İşlemleri

  Future<void> addOrUpdate(SchoolBusModel model, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      model.active = model.active ?? true;
      var repRegistration = resolve<RepositorySchoolBus>();

      var res = await repRegistration.addOrUpdate(
        model: model,
        files: photoList,
      );

      if (res is SchoolBusModel) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageRegisSchoolBus_saved.tr(),
            messageType: MessageType.Success,
          ),
        );
        model = res;
      } else if (res is MobileResult) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageRegisSchoolBus_not_saved.tr() + (res.message ?? ''),
            messageType: MessageType.Error,
          ),
        );
      }
    }
    saveEnable = true;
  }
  // #endregion
}
