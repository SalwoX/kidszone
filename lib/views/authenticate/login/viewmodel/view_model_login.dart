import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../../register.dart';
import '../../../_init/components/widgets/kzsnack_widget_minifity.dart';
import '../../../_init/models/user_model.dart';
import '../../../_init/view_model/base_view_model.dart';
import '../../login_security/view/page_login_security.dart';
import '../service/repository_login.dart';

part 'view_model_login.g.dart';

class ViewModelLogin = _ViewModelLoginBase with _$ViewModelLogin;

abstract class _ViewModelLoginBase extends BaseViewModel<UserModel, RepositoryLogin> with Store {
  @override
  void setContext(BuildContext ctx) => this.ctx = ctx;

  final RepositoryLogin rep = resolve<RepositoryLogin>();

  @observable
  bool isloading = false;

  @observable
  String? phone;

  @observable
  String? password;

  @observable
  String? securityCode;

  @observable
  UserModel? model;

  void isLogin(BuildContext context) async {
    Status = PageState.LOADING;
    try {
      var login = await rep.login(phone: phone!, password: password!);
      if (login.id != null) {
        model = login;
        Status = PageState.SUCCESS;
      } else {
        model = null;
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.condition_not_succesfull.tr() + LocaleKeys.condition_wrong_users.tr(),
            messageType: MessageType.Warning,
          ),
        );
      }
    } catch (_) {
      model = null;
      exception = _.toString();
      Status = PageState.ERROR;
      //!Eksik:Error Sayfasına Yönlendirilecek
      //PageError(exception: _)
    }

    if (model != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => PageLoginSecurity(userModel: model)),
        );
      });
    }
  }
}
