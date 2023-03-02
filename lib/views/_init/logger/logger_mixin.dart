import 'package:flutter/cupertino.dart';
import 'project_logger.dart';

mixin LoggerMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    ProjectLogger.instance.logClassName(this);
    print('initState');
  }
}
