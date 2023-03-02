import 'package:flutter/material.dart';
import '../../../../core/extension/context_extension.dart';
import '../../my_block.dart';
import '../../themes/colors.dart';

class KzCheckBox extends StatefulWidget {
  final bool checkedValue;
  final ValueChanged<bool?> onChanged;
  final String title;
  final bool labelPositionLeft;
  final IconData? icon;
  const KzCheckBox({Key? key, this.checkedValue = true, required this.onChanged, this.title = '', this.labelPositionLeft = false, this.icon}) : super(key: key);

  @override
  _KzCheckBoxState createState() => _KzCheckBoxState();
}

class _KzCheckBoxState extends State<KzCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.icon != null
            ? Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  widget.icon,
                ))
            : Container(
                child: SizedBox(
                  width: MyBlock.horizontal(context, x: 3),
                ),
              ),
        Expanded(
          child: CheckboxListTile(
            title: Text(
              widget.title,
              style: context.textTheme.labelMedium,
            ),
            activeColor: ThemeColors.purple,
            value: widget.checkedValue,
            onChanged: widget.onChanged,
            controlAffinity: widget.labelPositionLeft == true
                ? ListTileControlAffinity.leading
                : ListTileControlAffinity.trailing,
          ),
            ),
      ],
    );
 
  }
}
