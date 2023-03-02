import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class ColorToHex extends Color {
  ///convert material colors to hexcolor
  static int _convertColorTHex(Color color) {
    var hex = '${color.value}';
    return int.parse(
      hex,
    );
  }

  ColorToHex(final Color color) : super(_convertColorTHex(color));
}

extension Hex on Color {
  /// return hex String
  String toHex({bool leadingHashSign = true, bool includeAlpha = false}) => '${leadingHashSign ? '#' : ''}'
      '${includeAlpha ? alpha.toRadixString(16).padLeft(2, '0') : ''}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';

  /// Return true if given Color is dark
  bool isDark() => getBrightness() < 128.0;

  /// Return true if given Color is light
  bool isLight() => !isDark();

  /// Returns Brightness of give Color
  double getBrightness() => (red * 299 + green * 587 + blue * 114) / 1000;

  /// Returns Luminance of give Color
  double getLuminance() => computeLuminance();
}
