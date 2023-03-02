import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/extension/context_extension.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../_init/components/input/rounded_input_field.dart';
import '../../../../_init/components/input/rounded_password_field.dart';
import '../../../../_init/components/widgets/already_have_an_account_acheck.dart';
import '../../../../_init/components/widgets/rounded_button.dart';
import '../../../login/view/page_login.dart';
import 'background.dart';
import 'or_divider.dart';
import 'social_icon.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              LocaleKeys.condition_sign_up.tr(),
              style: context.textTheme.bodyLarge,
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: LocaleKeys.singUppage_first_input.tr(),
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: LocaleKeys.condition_password.tr(),
              onChanged: (value) {},
            ),
            RoundedButton(
              text: LocaleKeys.condition_sign_up.tr(),
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PageLogin();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
