import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../common/infrastructure/work_context.dart';
import '../../../../../core/extension/context_extension.dart';
import '../../../../../data/core/apiservices.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../../register.dart';
import '../../../../_init/components/input/rounded_input_field.dart';
import '../../../../_init/components/input/rounded_password_field.dart';
import '../../../../_init/components/widgets/already_have_an_account_acheck.dart';
import '../../../../_init/components/widgets/rounded_button.dart';
import '../../../../_init/error/page_error.dart';
import '../../../../_init/router/app_router.dart';
import '../../../../_init/themes/widgets.dart';
import '../../../../_init/view_model/base_view_model.dart';
import '../../../login_security/view/page_login_security.dart';
import '../../../singup/view/page_signup.dart';
import '../../viewmodel/view_model_login.dart';
import 'background.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final vm = ViewModelLogin();

    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Observer(
          builder: (_) {
            switch (vm.Status) {
              case PageState.LOADING:
                return Center(child: CircularProgressIndicator());
              case PageState.SUCCESS:
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => PageLoginSecurity(userModel: vm.model)),
                  );
                });
                return CircularProgressIndicator();
              case PageState.ERROR:
                return PageError(
                    exception: vm.exception,
                    function: () {
                      vm.Status = PageState.NORMAL;
                    });
              case PageState.INITAL:
                return loginItems(size, vm, context);
              default:
                return SizedBox();
            }
          },
        ),
      ),
    );
  }

  Column loginItems(Size size, ViewModelLogin vm, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          LocaleKeys.login_title.tr(),
          style: context.textTheme.headlineSmall,
        ),
        SizedBox(height: size.height * 0.03),
        SvgPicture.asset(
          "assets/icons/login.svg",
          height: size.height * 0.35,
        ),
        SizedBox(height: size.height * 0.03),

        /// daha sonra inputları tek bır widget costume indir
        RoundedInputField(
          hintText: LocaleKeys.login_first_input.tr(),
          onChanged: (value) {
            vm.phone = value;
          },
          icon: Icons.phone_android,
          inputFormatters: FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          inputType: TextInputType.phone,
        ),
        RoundedPasswordField(
          hintText: LocaleKeys.condition_password.tr(),
          onChanged: (value) {
            vm.password = value;
          },
        ),
        RoundedButton(
          text: LocaleKeys.condition_continue.tr(),
          press: () {
            vm.isLogin(context);
          },
        ),
        SizedBox(height: size.height * 0.03),
        AlreadyHaveAnAccountCheck(
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return PageSignUp();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

void login(BuildContext context, String phone, String password) async {
  loadingPanel(context: context, durum: true);
  var res = await ApiServices().login(phone, password);
  if (res.id != null) {
    WorkContext().saveUser(res);
    loadingPanel(context: context, durum: false);
    resolve<AppRouter>().push(RouteLoginSecurity());
  } else {
    //loadingPanel(context: context, durum: false);
    //toast(res.message);
  }
}
