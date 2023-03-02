import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../data/repositories/repository_common.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../../register.dart';
import '../../../../_init/components/widgets/kzsnack_widget_minifity.dart';
import '../../../../_init/models/mobile_result.dart';
import '../../../../_init/view_model/base_view_model.dart';
import '../../model/preregistration_model.dart';
import '../model/preregistration_notes_model.dart';
import '../service/repository_preregistrationnotes.dart';

part 'view_model_preregistration_notes.g.dart';

class ViewModelPreregistrationNotes = _ViewModelPreregistrationNotesBase with _$ViewModelPreregistrationNotes;

abstract class _ViewModelPreregistrationNotesBase extends BaseViewModel<PreregistrationNotesModel, RepositoryPreregistrationNotes> with Store {
  @override
  void setContext(BuildContext ctx) => this.ctx = ctx;

  int bottomNavigationBarIndex = 0;
  final formKey = GlobalKey<FormState>();

  @observable
  var title = LocaleKeys.pageRegistrationPreregistrationNotes_notes.tr();

  @observable
  var newRegistrationActive = false;

  @observable
  var preregistrationId = 0;

  // #region Kayıt
  @observable
  var repCommon = resolve<RepositoryCommon>();

  @observable
  bool? active;

  @observable
  var nameSurname = TextEditingController();

  @observable
  var idNo = TextEditingController();

  @observable
  var phoneNumber = TextEditingController();

  @observable
  var password = TextEditingController();

  @observable
  var mail = TextEditingController();

  @observable
  var visibleClassroom = TextEditingController();

  @observable
  var color = TextEditingController();

  @observable
  var birthDate = TextEditingController();

  @observable
  var address = TextEditingController();

  @observable
  var description = TextEditingController();

  @observable
  var lessonClasses = TextEditingController();

  @observable
  var imgUrl = TextEditingController();

  @observable
  var permission = TextEditingController();

  @observable
  bool? mobileLogin;

  @observable
  bool? webLogin;

  @observable
  var picker = ImagePicker();

  @observable
  var model = PreregistrationModel();
  // #endregion

  //#region Arama Sayfası

  @observable
  List<File> photoList = [];

  //#endregion

  // #region Kayıt İşlemleri

  Future<void> addOrUpdate(PreregistrationNotesModel model, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      model.active = model.active ?? true;
      var repRegistration = resolve<RepositoryPreregistrationNotes>();

      var res = await repRegistration.addOrUpdate(
        model: model,
        files: photoList,
      );

      if (res is PreregistrationNotesModel) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageRegistrationPreregistrationNotes_saved.tr(),
            messageType: MessageType.Success,
          ),
        );
        model = res;
      } else if (res is MobileResult) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageRegistrationPreregistrationNotes_not_saved.tr() + (res.message ?? ''),
            messageType: MessageType.Error,
          ),
        );
      }
    }
    saveEnable = true;
  }
  // #endregion
}
