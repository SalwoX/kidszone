import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../common/infrastructure/work_context.dart';
import '../../../../../core/extension/context_extension.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../_init/components/input/rounded_input_field.dart';
import '../../../../_init/components/widgets/rounded_button.dart';
import '../../../../_init/error/page_error.dart';
import '../../../../_init/models/user_model.dart';
import '../../../../_init/view_model/base_view_model.dart';
import '../../../../home/announcement/view/notice_view.dart';
import '../../viewmodel/view_model_security.dart';
import 'background_security.dart';

class BodySecurity extends StatefulWidget {
  final UserModel? userModel;

  BodySecurity({Key? key, this.userModel}) : super(key: key);

  @override
  State<BodySecurity> createState() => _BodySecurityState();
}

class _BodySecurityState extends State<BodySecurity> {
  final vm = ViewModelSecurity();

  @override
  Widget build(BuildContext context) {
    vm.model = widget.userModel;
    return BackgroundSecurity(
      child: SingleChildScrollView(
        child: Observer(
          builder: (_) {
            switch (vm.Status) {
              case PageState.LOADING:
                return Center(child: CircularProgressIndicator());
              case PageState.SUCCESS:
                _kullaniciKaydet(model: vm.model!);
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushReplacement(
                    context,
                    new MaterialPageRoute(builder: (context) => PageNoticeView()),
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
                return securityItems(vm, context);
              default:
                return SizedBox();
            }
          },
        ),
        // child: BlocBuilder(
        //     bloc: _loginBloc,
        //     builder: (context, LoginState state) {
        //       if (state is LoginLoadedState) {
        //         return securityItems(context, _loginBloc);
        //       } else if (state is LoadingState) {
        //         return CircularProgressIndicator();
        //       } else if (state is LoginSecurityLoadedState) {
        //         _kullaniciKaydet(model: state.model);

        //         WidgetsBinding.instance.addPostFrameCallback((_) {
        //           Navigator.pushReplacement(
        //             context,
        //             new MaterialPageRoute(builder: (context) => PageDashboard()),
        //           );
        //         });
        //         return CircularProgressIndicator();
        //       } else if (state is ErrorState) {
        //         return Center(
        //           child: Text(state.exception.toString()),
        //         );
        //       } else {
        //         return Container(child: Center(child: Text('Hata x')));
        //       }
        //     }),
      ),
    );
  }

  Column securityItems(vm, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          LocaleKeys.condition_entry_login.tr(),
          style: context.textTheme.bodyLarge,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        SvgPicture.asset(
          "assets/icons/login.svg",
          height: MediaQuery.of(context).size.height * 0.35,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        RoundedInputField(
          hintText: LocaleKeys.condition_security_code.tr(),
          onChanged: (value) {
            vm.model?.confirmCode = value;
          },
          icon: Icons.security,
          inputFormatters: FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          inputType: TextInputType.phone,
        ),
        RoundedButton(
          text: LocaleKeys.condition_entry_login.tr(),
          press: () {
            vm.loginSecurityCode(context);
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        // kz.AlreadyHaveAnAccountCheck(
        //   press: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) {
        //           return pages.PageSignUp();
        //         },
        //       ),
        //     );
        //   },
        // ),
      ],
    );
  }

  /*void login(BuildContext context, KullaniciModel kullaniciModel,
      SizingInformation sizingInformation) async {
    loadingPanel(context: context, durum: true);
    var res = await ApiServices().loginSecurity(
        kullaniciModel.tel, kullaniciModel.sifre, kullaniciModel.onayKodu);
    if (res.data != null) {
      WorkContext.user = KullaniciModel.fromJson(res.data  as Map<String,dynamic>);
      _kullaniciKaydet(WorkContext.user, sizingInformation);

      loadingPanel(context: context, durum: false);
      Navigator.pushReplacementNamed(context, PageDashboard.tag);
    } else {
      loadingPanel(context: context, durum: false);
      toast(res.message);
    }
  }*/
  void _kullaniciKaydet({
    required UserModel model,
  }) async {
    try {
      WorkContext().saveUser(model);
      /*if (sizingInformation.devicePageType == DevicePageType.Mobile) {
        var db = DatabaseHelper();
        await db.logininsert(model);
      } else {
        await DosyaIslemleri().writeFile(json.encode(model), "lkogin");
      }*/
    } catch (e) {}
  }
}
