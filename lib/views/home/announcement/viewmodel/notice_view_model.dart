import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../data/repositories/repository_common.dart';
import '../service/repository_notice.dart';
import '../../../../register.dart';
import '../../../_init/components/widgets/kzsnack_widget_minifity.dart';
import '../../../_init/models/mobile_result.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:mobx/mobx.dart';
import 'package:kidszone_app/views/_init/view_model/base_view_model.dart';
import '../../../../common/app_config.dart';
import '../../../_init/models/filter_model.dart';
import '../model/notice_model.dart';

part 'notice_view_model.g.dart';

class PageNoticeViewModel = _PageNoticeViewModelBase with _$PageNoticeViewModel;

abstract class _PageNoticeViewModelBase extends BaseViewModel<NoticeModel, RepositoryNotice> with Store {
  @override
  void setContext(BuildContext ctx) => this.ctx = ctx;

  @override
  var page_title = LocaleKeys.announcementViewModel_title.tr();

  @override
  var page_subTitle = LocaleKeys.announcementViewModel_sub_title.tr();

  // #region Kayıt
  @observable
  var repCommon = resolve<RepositoryCommon>();

  @observable
  var targetGroup = TextEditingController();

  @observable
  var targetClassroom = TextEditingController();

  @observable
  var targetTeacher = TextEditingController();

  @observable
  var title = TextEditingController();

  @observable
  var content = TextEditingController();

  @observable
  var link = TextEditingController();

  @observable
  var imgUrl = TextEditingController();

  @observable
  var pinned = false;

  @observable
  var visibleClassroom = false;

  @observable
  bool visibleTeacher = false;

  @observable
  var picker = ImagePicker();

  @observable
  var model = NoticeModel();
  // #endregion

//#region Arama Sayfası

  @override
  FilterModel get filter => FilterModel(page: 1, pageSize: AppConfig.pageSize, fields: <Field>[], sort: "Constant DESC, RegistrationDate DESC");

  @observable
  List<File> photoList = [];

//#endregion

// #region Kayıt İşlemleri

  Future<void> addOrUpdate(NoticeModel model, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      model.sharingDate = model.sharingDate ?? DateTime.now();
      model.active = model.active ?? true;
      model.targetGroup = targetGroup.text.toString().toInt();
      model.constant = pinned;
      var repRegistration = resolve<RepositoryNotice>();

      var res = await repRegistration.addOrUpdate(
        model: model,
        files: photoList,
      );

      if (res is NoticeModel) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.announcementViewModel_success_massage.tr(),
            messageType: MessageType.Success,
          ),
        );
        model = res;
      } else if (res is MobileResult) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.announcementViewModel_error_massage.tr() + (res.message ?? ''),
            messageType: MessageType.Error,
          ),
        );
      }
    }
    saveEnable = true;
  }
// #endregion
}
