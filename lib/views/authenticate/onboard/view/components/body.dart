import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:universal_platform/universal_platform.dart';

import '../../../../../common/infrastructure/work_context.dart';
import '../../../../../core/extension/context_extension.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../../register.dart';
import '../../../../_init/components/widgets/rounded_button.dart';
import '../../../../_init/router/app_router.dart';
import '../../../login/service/repository_login.dart';
import '../../../login/view/page_login.dart';
import 'background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              LocaleKeys.welcome_title.tr(namedArgs: {'name': WorkContext.nameSurname}),
              style: context.textTheme.bodyLarge,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: MediaQuery.of(context).size.height * 0.45,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            RoundedButton(
              text: LocaleKeys.condition_continue.tr(),
              press: () async {
                var sonuc = await _userControl();
                if (sonuc) {
                  resolve<AppRouter>().replace(RouteNoticeView());
                  //Navigator.pushReplacementNamed(context, PageNotiveView.tags);
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PageLogin();
                      },
                    ),
                  );
                }
              },
            ),

            // RoundedButton(
            //   text: "SIGN UP",
            //   color: kPrimaryLightColor,
            //   textColor: Colors.black,
            //   press: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return PageSignUp();
            //         },
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  Future<bool> _userControl() async {
    try {
      var rep = resolve<RepositoryLogin>();
      if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
        //var db = DatabaseHelper();
        //  WorkContext.user = await db.loginGet();
        if (WorkContext.userModel?.id != null) {
          var control = await rep.loginSecurityCode(phone: WorkContext.userModel!.phoneNumber!, password: WorkContext.userModel!.password!, securityCode: WorkContext.userModel!.confirmCode!);
          if (control.id == null) {
            return false;
          }
          WorkContext().saveUser(control);

          return true;
        } else {
          return false;
        }
      } else {
        //  var data = await DosyaIslemleri().readFile("lkogin");
        //  if (data.isNotEmpty && data != "-1") {
        //  var users = KullaniciModel.fromJson(jsonDecode(data));
        //    WorkContext.user = users;

        if (WorkContext.userModel != null) {
          var control = await rep.loginSecurityCode(phone: WorkContext.userModel!.phoneNumber!, password: WorkContext.userModel!.password!, securityCode: WorkContext.userModel!.confirmCode!);
          if (control.id == null) {
            return false;
          }
          WorkContext().saveUser(control);
          return true;
        } else {
          return false;
        }
        //    }
        //    return false;
      }
    } catch (e) {
      return false;
    }
  }
}
