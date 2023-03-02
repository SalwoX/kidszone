import 'package:flutter/material.dart';
import '../../../../common/utils/translate.dart';
import '../../../_init/components/widgets/kzsnack_widget_minifity.dart';
import '../../../../register.dart';
import '../../../_init/models/user_model.dart';
import '../../../_init/view_model/base_view_model.dart';

import 'package:mobx/mobx.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../login/service/repository_login.dart';

part 'view_model_security.g.dart';

class ViewModelSecurity = _ViewModelSecurityBase with _$ViewModelSecurity;

abstract class _ViewModelSecurityBase extends BaseViewModel<UserModel, RepositoryLogin> with Store {
  @override
  void setContext(BuildContext ctx) => this.ctx = ctx;

  @override
  void init() {}

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

  void loginSecurityCode(BuildContext context) async {
    Status = PageState.LOADING;
    try {
      var login = await rep.loginSecurityCode(
        phone: model!.phoneNumber!,
        password: model!.password!,
        securityCode: model!.confirmCode!,
      );
      if (login.id != null) {
        model = login;
        Status = PageState.SUCCESS;
      } else {
        model = null;
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: lang('Başarısız') + ('Güvenlik kodu yanlış.'),
            messageType: MessageType.Warning,
          ),
        );
      }
    } catch (_) {
      model = null;
      exception = _.toString();
      Status = PageState.ERROR;
    }
  }
}
