import 'package:flutter/material.dart';
import '../../../../core/extension/context_extension.dart';
import '../../my_block.dart';

import 'kzsnack_widget.dart';

enum MessageType { Success, Info, Warning, Error }

// ignore: must_be_immutable
class KzSnackWidgetMinifit extends StatefulWidget {
  String? message;
  Color? bgColor;
  TextStyle? textStyle;
  Widget? leadingWidget;
  MessageType? messageType;

  KzSnackWidgetMinifit({@required this.message, @required this.messageType});

  @override
  _KzSnackWidgetMinifitState createState() => _KzSnackWidgetMinifitState();
}

class _KzSnackWidgetMinifitState extends State<KzSnackWidgetMinifit> {
  @override
  Widget build(BuildContext context) {
    if (widget.messageType == MessageType.Success) {
      widget.bgColor = Colors.white;
      widget.textStyle = context.textTheme.bodyLarge;
      widget.leadingWidget = Icon(
        Icons.check_circle_outline_rounded,
        size: MyBlock.horizontal(context, x: 9),
        color: Color(0xff6551A0),
      );
    } else if (widget.messageType == MessageType.Info) {
      widget.bgColor = Colors.white;
      widget.textStyle = context.textTheme.bodyLarge;
      widget.leadingWidget = Icon(
        Icons.check_circle_outline_rounded,
        size: MyBlock.horizontal(context, x: 9),
        color: Color(0xFF51A05E),
      );
    } else if (widget.messageType == MessageType.Warning) {
      widget.bgColor = Colors.white;
      widget.textStyle = context.textTheme.bodyLarge;
      widget.leadingWidget = Icon(
        Icons.check_circle_outline_rounded,
        size: MyBlock.horizontal(context, x: 9),
        color: Color(0xFFA09151),
      );
    } else if (widget.messageType == MessageType.Error) {
      widget.bgColor = Colors.white;
      widget.textStyle = context.textTheme.bodyLarge;
      widget.leadingWidget = Icon(
        Icons.check_circle_outline_rounded,
        size: MyBlock.horizontal(context, x: 9),
        color: Color(0xFFA0515E),
      );
    }
    return KzSnackWidget(
      message: widget.message,
      bgColor: widget.bgColor,
      textStyle: widget.textStyle,
      leadingWidget: widget.leadingWidget,
    );
  }
}
