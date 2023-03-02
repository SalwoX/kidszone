import 'package:flutter/material.dart';

import '../../themes/colors.dart';
import '../text/text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
 final String? hintText;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged, required this.hintText,
  }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState(onChanged);
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  final ValueChanged<String> onChanged;
  bool _passwordVisible = true;

  _RoundedPasswordFieldState(this.onChanged);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: _passwordVisible,
        onChanged: onChanged,
        cursorColor: ThemeColors.purple,
        decoration: InputDecoration(
          hintText:widget.hintText,
          icon: Icon(
            Icons.lock,
            color: ThemeColors.purple,
          ),
          suffixIcon: GestureDetector(
            onTapDown: inContact, //call this method when incontact
            onTapUp: outContact, //call this method when contact with screen is removed
            child: Icon(
              Icons.remove_red_eye,
              color: ThemeColors.purple,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  void inContact(TapDownDetails details) {
    setState(() {
      _passwordVisible = false;
    });
  }

  void outContact(TapUpDetails details) {
    setState(() {
      _passwordVisible = true;
    });
  }
}
