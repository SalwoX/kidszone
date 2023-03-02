import 'package:flutter/material.dart';
import '../../../_init/models/user_model.dart';

import 'components/body_security.dart';

// ignore: must_be_immutable
class PageLoginSecurity extends StatefulWidget {

  UserModel? userModel = UserModel();

  PageLoginSecurity({this.userModel});

  @override
  _PageLoginSecurityState createState() => _PageLoginSecurityState();
}

class _PageLoginSecurityState extends State<PageLoginSecurity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodySecurity(
        userModel: widget.userModel as UserModel,
      ),
    );
  }
}
