// // ignore_for_file: constant_identifier_names

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:kidszone_app/views/_init/components/hexcolor/hex_color.dart';
// import 'package:responsive_builder/responsive_builder.dart';

// class MainSettings {
//   /* api */
//   static const String UrlSonEk = kReleaseMode ? "" : "/WebApi";
//   static const String ApiUrl = kReleaseMode ? "webapi.kidszoneapp.net" : "192.168.1.16";
//   static const String OnEk = kReleaseMode ? "https://" : "http://";

//   /* api */

// /* font sizes*/
//   static const textSizeSmall = 12;
//   static const textSizeSMedium = 14;
//   static const textSizeMedium = 16.0;
//   static const textSizeLargeMedium = 18.0;
//   static const textSizeNormal = 20.0;
//   static const textSizeLarge = 24.0;
//   static const textSizeXLarge = 28.0;
//   static const textSizeXXLarge = 30.0;
//   static const textSizeBig = 50.0;

//   static const spacing_control_half = 2.0;
//   static const spacing_control = 4.0;
//   static const spacing_standard = 8.0;
//   static const spacing_middle = 10.0;
//   static const spacing_standard_new = 16.0;
//   static const spacing_large = 24.0;
//   static const spacing_xlarge = 32.0;
//   static const spacing_xxLarge = 40.0;
// /* font sizes*/

// /* colors */
//   static const appTextColorPrimary = Color(0xff6551A0);
//   static const appColorPrimary = Color(0xFF6F35A5);
//   static const appborderColor = Color(0xFF212121);
//   static const appPalColor = Color(0xFF4a536b);
//   static const kPrimaryLightColor = Color(0xFFF1E6FF);
// /* colors */

// /* config */
//   static const double appNavigationBarHeight = 60;

// /*fonts*/
//   static const fontRegular = 'Regular';
//   static const fontMedium = 'Medium';
//   static const fontSemiBold = 'Semibold';
//   static const fontBold = 'Bold';

//   static List<DropdownMenuItem<String>> operatorList(TextStyle style) {
//     var list = _operatorList.map(
//       (data) => DropdownMenuItem<String>(
//         value: data.key.toString(),
//         child: Text(
//           data.value ?? "",
//           style: style,
//         ),
//       ),
//     );
//     return list.toList();
//   }

//   static final List<KeyValueModel> _operatorList = [
//     KeyValueModel(key: 'contains', value: 'İçerir'),
//     KeyValueModel(key: '2', value: 'Sınıf Listesi'),
//     KeyValueModel(key: '3', value: 'Öğrenci Listesi'),
//     KeyValueModel(key: '4', value: 'Sadece Öğretmenler'),
//   ];
// }

// String lang(String val) {
//   return val;
// }

// class ThemeColors {
//   static Color mor = HexColor("#65539E");
//   static Color acikPempe = HexColor("#EF9CC3");
//   static Color beyaz = HexColor("#ffffff");
//   static Color text = HexColor("#000000");
//   static Color textAcik = HexColor("#6a6a77");
// }

// class MyBlock {
//   static horizontal(BuildContext context, {double x = 1}) {
//     return (MediaQuery.of(context).size.width / 100) * x;
//   }

//   static ModelSize size(BuildContext context, {double x = 1, double y = 1, double? yuzde}) {
//     var deviceType = getDeviceType(MediaQuery.of(context).size);
//     var xx = 0.0;
//     var yy = 0.0;
//     var _yuzdeHeight = 0.0;
//     var _yuzdeWidth = 0.0;
//     switch (deviceType) {
//       case DeviceScreenType.desktop:
//         xx = x * 6.0;
//         yy = y * 6.0;
//         break;
//       case DeviceScreenType.tablet:
//         xx = x * 3.0;
//         yy = y * 3.0;
//         break;
//       case DeviceScreenType.mobile:
//         xx = x;
//         yy = y;
//         if (yuzde != null) {
//           _yuzdeHeight = MediaQuery.of(context).size.height / 100 * yuzde;
//           _yuzdeWidth = MediaQuery.of(context).size.width / 100 * yuzde;
//         }
//         break;
//       // ignore: deprecated_member_use
//       case DeviceScreenType.Mobile:
//         break;
//       // ignore: deprecated_member_use
//       case DeviceScreenType.Tablet:
//         break;
//       // ignore: deprecated_member_use
//       case DeviceScreenType.Desktop:
//         break;
//       // ignore: deprecated_member_use
//       case DeviceScreenType.Watch:
//         break;
//       case DeviceScreenType.watch:
//         break;
//     }
//     //var size = (MediaQuery.of(context).size.width / 100) * x;
//     return ModelSize(xx, yy, _yuzdeHeight, _yuzdeWidth);
//   }

//   static vertical(BuildContext context, {double x = 1}) {
//     return (MediaQuery.of(context).size.height / 100) * x;
//   }
// }

// class ModelSize {
//   double x;
//   double y;
//   double yuzdeHeight;
//   double yuzdeWidth;
//   ModelSize(this.x, this.y, this.yuzdeHeight, this.yuzdeWidth);
// }
