import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';
import '../../themes/colors.dart';

// ignore: must_be_immutable
class RoundedButton extends StatelessWidget {
  final String text;
  final Function()? press;
  final Color color = ThemeColors.mainPurple;
  Color textColor;
  RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
            padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            ),
          ),
          //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          //color: color,
          onPressed: press,
          child: Text(
            text,
            style: context.textTheme.displayMedium,
          ),
        ),
      ),
    );
  }
}
