import 'package:flutter/material.dart';
import '../../my_block.dart';
import '../../themes/colors.dart';

class KzToggleButton extends StatefulWidget {
  KzToggleButton({Key? key, this.onPressed, required this.isSelected, required this.children}) :
        super(key: key);

  final List<bool> isSelected;
  final List<Widget> children;
  final Function(int)? onPressed;

  @override
  State<KzToggleButton> createState() => _KzToggleButtonState();
}

class _KzToggleButtonState extends State<KzToggleButton> {
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      onPressed: widget.onPressed ?? null,
      children: widget.children,
      isSelected: widget.isSelected,
      selectedColor: ThemeColors.darkWhite,
      fillColor: ThemeColors.mainPurple,
      direction: Axis.horizontal,
      constraints: BoxConstraints(
        minHeight: 35.0,
        minWidth: 70.0,
      ),
      borderRadius: BorderRadius.circular(
        MyBlock.horizontal(context, x: 2),
      ),

    );
  }


}
