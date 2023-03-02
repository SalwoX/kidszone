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
import '../model/branch_model.dart';
import '../service/repository_branch.dart';

part 'view_model_branch.g.dart';

class ViewModelBranch = _ViewModelBranchBase with _$ViewModelBranch;

abstract class _ViewModelBranchBase extends BaseViewModel<BranchModel, RepositoryBranch> with Store {
  @override
  void setContext(BuildContext ctx) => this.ctx = ctx;

  int bottomNavigationBarIndex = 4;
  final formKey = GlobalKey<FormState>();

  @observable
  var page_title = LocaleKeys.pageRegisBranch_branch.tr();

  final String page_subTitle = "";

  // #region Kayıt
  @observable
  var repCommon = resolve<RepositoryCommon>();

  @observable
  var branchName = TextEditingController();

  @observable
  var address = TextEditingController();

  @observable
  var logoUrl = TextEditingController();

  @observable
  var phoneNumber = TextEditingController();

  @observable
  var mail = TextEditingController();

  @observable
  var slogan = TextEditingController();

  @observable
  bool? active;

  @observable
  var picker = ImagePicker();

  @observable
  var model = BranchModel();
  // #endregion

  //#region Arama Sayfası

  @observable
  List<File> photoList = [];

  //#endregion

  // #region Kayıt İşlemleri

  Future<void> addOrUpdate(BranchModel model, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      model.active = model.active ?? true;
      var repRegistration = resolve<RepositoryBranch>();

      var res = await repRegistration.addOrUpdate(
        model: model,
        files: photoList,
      );

      if (res is BranchModel) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageRegisBranch_saved.tr(),
            messageType: MessageType.Success,
          ),
        );
        model = res;
      } else if (res is MobileResult) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageRegisBranch_not_saved.tr() + (res.message ?? ''),
            messageType: MessageType.Error,
          ),
        );
      }
    }
    saveEnable = true;
  }
  // #endregion
}
