import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../themes/colors.dart';

//#region input

class KzFilterTextEdit extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final FormFieldValidator<String>? validator;
  final TextInputType inputType;

  const KzFilterTextEdit({
    Key? key,
    required this.controller,
    required this.labelText,
    this.validator,
    required this.inputType,
  }) : super(key: key);

  @override
  _KzFilterTextEditState createState() => _KzFilterTextEditState();
}

class _KzFilterTextEditState extends State<KzFilterTextEdit> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextFormField(
        controller: widget.controller,
        style: context.textTheme.bodyMedium,
        cursorHeight: 2,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: appborderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(width: 0.5, color: appborderColor),
          ),
          prefixStyle: context.textTheme.bodySmall,
          labelText: widget.labelText,
          labelStyle: context.textTheme.bodyMedium,
        ),
        cursorColor: white,
        keyboardType: widget.inputType,
        validator: widget.validator,
      ),
    );
  }
}

//#endregion
