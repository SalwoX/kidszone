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
import '../model/group_model.dart';
import '../service/repository_group.dart';

part 'view_model_group.g.dart';

class ViewModelGroup = _ViewModelGroupBase with _$ViewModelGroup;

abstract class _ViewModelGroupBase extends BaseViewModel<GroupModel, RepositoryGroup> with Store {
  @override
  void setContext(BuildContext ctx) => this.ctx = ctx;

  int bottomNavigationBarIndex = 0;
  final formKey = GlobalKey<FormState>();

  @observable
  var title = LocaleKeys.pageGroup_daily_group.tr();

  // #region Kayıt
  @observable
  var repCommon = resolve<RepositoryCommon>();

  @observable
  bool? active;

  @observable
  var type = TextEditingController();

  @observable
  var name = TextEditingController();

  @observable
  var description = TextEditingController();

  @observable
  var picker = ImagePicker();

  @observable
  var model = GroupModel();
  // #endregion

  //#region Arama Sayfası

  @observable
  List<File> photoList = [];

  //#endregion

  // #region Kayıt İşlemleri

  Future<void> addOrUpdate(GroupModel model, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      model.active = model.active ?? true;
      var repRegistration = resolve<RepositoryGroup>();

      var res = await repRegistration.addOrUpdate(
        model: model,
        files: photoList,
      );

      if (res is GroupModel) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageGroup_saved.tr(),
            messageType: MessageType.Success,
          ),
        );
        model = res;
      } else if (res is MobileResult) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageGroup_not_saved.tr() + (res.message ?? ''),
            messageType: MessageType.Error,
          ),
        );
      }
    }
    saveEnable = true;
  }
  // #endregion
}
