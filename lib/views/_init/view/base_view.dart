// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

abstract class BaseView extends StatefulWidget {
  @required
  String? get tag => this.toString();

  @required
  String? title;

  @required
  String? subTitle;

  BaseView({Key? key}) : super(key: key);
}
