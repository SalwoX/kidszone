import 'package:flutter/material.dart';

import '../../common/utils/hexcolor.dart';
import '../../views/_init/themes/colors.dart';

ThemeData mor = ThemeData(
  primaryColor: HexColor("#65539E"),
  scaffoldBackgroundColor: Colors.white,
  textTheme: _getTextTheme(),
  backgroundColor: ThemeColors.mainPurple,
  iconTheme: IconThemeData(
    color: ThemeColors.darkPurple,

    size: 24,
  ),
primaryIconTheme: IconThemeData(
    color: ThemeColors.lightPurple,
    size: 24,
  ),
  bottomAppBarColor: ThemeColors.darkPurple,
).copyWith(useMaterial3: true);

TextTheme _getTextTheme() {
  return TextTheme(
    //bodies
    bodySmall: TextStyle(
      fontFamily: 'Nunito',
      color: ThemeColors.textBlack,
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Nunito',
      color: ThemeColors.textBlack,
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Nunito',
      color: ThemeColors.textBlack,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    ),
    //end

    //headlines
    headlineSmall: TextStyle(
      fontFamily: 'Nunito',
      color: ThemeColors.mainPurple,
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Nunito',
      color: ThemeColors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: TextStyle(
      fontFamily: 'Nunito',
      color: ThemeColors.white,
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
    ),
    //end

    //labels
    labelSmall: TextStyle(
      fontFamily: 'Nunito',
      color: Colors.cyan,
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Nunito',
      color: ThemeColors.textBlack,
      fontSize: 13.0,
      fontWeight: FontWeight.normal,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Nunito',
      color: ThemeColors.textBlack,
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ),
    //end

    //titles
    titleSmall: TextStyle(),
    titleMedium: TextStyle(),
    titleLarge: TextStyle(),
    //end

    //displays
    displaySmall: TextStyle(
      fontFamily: 'Nunito',
      color: ThemeColors.white,
      fontSize: 11.0,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Nunito',
      color: ThemeColors.white,
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
    ),
    displayLarge: TextStyle(
      fontFamily: 'Nunito',
      color: ThemeColors.white,
      fontSize: 17.0,
      fontWeight: FontWeight.bold,
    ),

    //end

    /*
    headline1: TextStyle(),
    headline2: TextStyle(),
    headline3: TextStyle(),
    headline4: TextStyle(),
    headline5: TextStyle(),
    headline6: TextStyle(),
    //end



    //subtitles
    subtitle1: TextStyle(),
    subtitle2: TextStyle(),
    //end
*/

/*
    //buttons
    button: TextStyle(),
    //end
    overline: TextStyle(),


    caption: TextStyle(),*/
  );
}
