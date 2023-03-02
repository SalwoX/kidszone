import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../generated/locale_keys.g.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function() press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? LocaleKeys.login_dont_have_an_account.tr() : LocaleKeys.login_already_have_an_account.tr(),
          style: context.textTheme.bodyMedium,
        ),
        GestureDetector(
          onTap: press,
          child: Text(login ? LocaleKeys.condition_sign_up.tr() : LocaleKeys.condition_sign_up.tr(), style: context.textTheme.bodyLarge),
        )
      ],
    );
  }
}
