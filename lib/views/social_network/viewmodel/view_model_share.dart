import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../data/repositories/repository_common.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../register.dart';
import '../../_init/components/widgets/kzsnack_widget_minifity.dart';
import '../../_init/models/mobile_result.dart';
import '../../_init/view_model/base_view_model.dart';
import '../model/social_network_model.dart';
import '../service/repository_share.dart';

part 'view_model_share.g.dart';

class ViewModelShare = _ViewModelShareBase with _$ViewModelShare;

abstract class _ViewModelShareBase extends BaseViewModel<SocialNetworkModel, RepositoryShare> with Store {
  final _formKey = GlobalKey<FormState>();

  @override
  void setContext(BuildContext ctx) => this.ctx = ctx;
  @observable
  var targetGroup = TextEditingController();

  @observable
  var targetClassroom = TextEditingController();

  @observable
  var picker = ImagePicker();

  @observable
  var targetTeacher = TextEditingController();

  var linkController = TextEditingController();

  var imgUrl = TextEditingController();
  @observable
  List<File> photoList = [];

  @observable
  bool visibleClassroom = false;

  @observable
  bool visibleTeacher = false;

  @observable
  bool visibleStudent = false;

  @observable
  var model = SocialNetworkModel();

  var repCommon = resolve<RepositoryCommon>();

  @observable
  var comment = TextEditingController();

  @observable
  List<bool> isSelected = [true, false, false];

  Future<void> register() async {
    if (_formKey.currentState!.validate()) {
      try {
        _formKey.currentState!.save();

        //! özel modele eklenmesi gereken datalar
        var res = await rep.addOrUpdate(model: model, files: photoList);
        if (res is SocialNetworkModel) {
          showTopSnackBar(
            ctx,
            KzSnackWidgetMinifit(
              message: LocaleKeys.pageRegistrationClassroom_saved.tr(),
              messageType: MessageType.Success,
            ),
          );

          model = res;
        } else if (res is MobileResult) {
          showTopSnackBar(
            ctx,
            KzSnackWidgetMinifit(
              message: LocaleKeys.pageRegistrationClassroom_warning.tr() + (res.message ?? ''),
              messageType: MessageType.Error,
            ),
          );
        }
      } catch (e) {
        showTopSnackBar(
          ctx,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageRegistrationClassroom_warning_messages.tr(),
            messageType: MessageType.Error,
          ),
        );
      }
    }
  }
}
