import 'package:flutter/material.dart';
import '../../my_block.dart';

// ignore: must_be_immutable
class KzSnackWidget extends StatefulWidget {
  String? message;
  Color? bgColor;
  TextStyle? textStyle;
  Widget? leadingWidget;

  KzSnackWidget({
    @required this.message,
    @required this.bgColor,
    @required this.textStyle,
    this.leadingWidget,
  });

  @override
  _KzSnackWidgetState createState() => _KzSnackWidgetState();
}

class _KzSnackWidgetState extends State<KzSnackWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: widget.bgColor!, boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 5)], borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: MyBlock.vertical(context, x: 4), horizontal: MyBlock.horizontal(context, x: 4)),
              child: Center(
                  child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.leadingWidget != null
                      ? Row(
                          children: [
                            widget.leadingWidget!,
                            SizedBox(
                              width: MyBlock.horizontal(context, x: 3),
                            ),
                          ],
                        )
                      : Container(),
                  Expanded(
                    flex: 1,
                    child: Text(
                      widget.message!,
                      style: widget.textStyle!,
                    ),
                  ),
                ],
              )),
            )));
  }
}
