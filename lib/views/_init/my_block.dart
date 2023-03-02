// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class MyBlock {
  static double horizontal(BuildContext? context, {double x = 1}) {
    return (MediaQuery.of(context!).size.width / 100) * x;
  }

  static double vertical(BuildContext context, {double x = 1}) {
    return (MediaQuery.of(context).size.height / 100) * x;
  }
}

class ModelSize {
  double x = 0;
  double y = 0;
  double percentHeight = 0;
  double percentWidth = 0;
  ModelSize(this.x, this.y, this.percentHeight, this.percentWidth);
}
