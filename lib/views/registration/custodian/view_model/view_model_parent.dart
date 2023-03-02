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
import '../model/parent_model.dart';
import '../service/repository_parent.dart';

part 'view_model_parent.g.dart';

class ViewModelParent = _ViewModelParentBase with _$ViewModelParent;

abstract class _ViewModelParentBase extends BaseViewModel<ParentModel, RepositoryParent> with Store {
  @override
  void setContext(BuildContext ctx) => this.ctx = ctx;

  int bottomNavigationBarIndex = 0;

  @override
  var page_title = LocaleKeys.pageRegistrationParent_parent.tr();

  @override
  final String page_subTitle = "";

  // #region Kayıt
  @observable
  var repCommon = resolve<RepositoryCommon>();

  @observable
  bool? active;

  @observable
  var studentIds = TextEditingController();

  @observable
  var nameSurname = TextEditingController();

  @observable
  var idNo = TextEditingController();

  @observable
  var phoneNumber = TextEditingController();

  @observable
  var job = TextEditingController();

  @observable
  var mail = TextEditingController();

  @observable
  var birthDate = TextEditingController();

  @observable
  var type = TextEditingController();

  @observable
  var description = TextEditingController();

  @observable
  var address = TextEditingController();

  @observable
  var confirmCode = TextEditingController();

  @observable
  var password = TextEditingController();

  @observable
  var permissions = TextEditingController();

  @observable
  bool? mobileLogin;

  @observable
  var picker = ImagePicker();

  @observable
  var model = ParentModel();
  // #endregion

  //#region Arama Sayfası

  @observable
  List<File> photoList = [];

  //#endregion

  // #region Kayıt İşlemleri

  Future<void> addOrUpdate(ParentModel model, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      model.active = model.active ?? true;
      var repRegistration = resolve<RepositoryParent>();

      var res = await repRegistration.addOrUpdate(
        model: model,
        files: photoList,
      );

      if (res is ParentModel) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageRegistrationParent_saved.tr(),
            messageType: MessageType.Success,
          ),
        );
        model = res;
      } else if (res is MobileResult) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageRegistrationParent_not_saved.tr() + (res.message ?? ''),
            messageType: MessageType.Error,
          ),
        );
      }
    }
    saveEnable = true;
  }
  // #endregion
}
