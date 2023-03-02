import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../themes/colors.dart';
import '../text/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String? hintText;
  final IconData icon;
  final ValueChanged<String>? onChanged;
  final TextInputType? inputType;
  final FilteringTextInputFormatter? inputFormatters;
  const RoundedInputField({
    Key? key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.inputType,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        keyboardType: inputType,
        inputFormatters: <TextInputFormatter>[
          inputFormatters as TextInputFormatter,
        ],
        onChanged: onChanged,
        cursorColor: ThemeColors.purple,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: ThemeColors.purple,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
