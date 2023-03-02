import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/regex_extension.dart';

//#region Edit
//#region input

// ignore: must_be_immutable
class KzTextEdit extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  FormFieldValidator<String>? validator;
  final IconData? icon;
  final String? svgPath;
  final TextInputType? inputType;
  final bool isRequired;
  final bool enabled;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final Widget? suffixIcon;

  KzTextEdit({
    Key? key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.icon,
    this.svgPath,
    this.suffixIcon,
    this.inputType,
    this.isRequired = false,
    required this.onSaved,
    this.onChanged,
    this.enabled = true,
  }) : super(key: key);

  @override
  _KzTextEditState createState() => _KzTextEditState();
}

class _KzTextEditState extends State<KzTextEdit> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.controller,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIconConstraints: const BoxConstraints(minHeight: 1),
          contentPadding: const EdgeInsets.all(1),
          labelText: widget.labelText,
          labelStyle: context.textTheme.labelMedium,
          suffixIcon: widget.suffixIcon,
          icon: widget.icon != null
              ? Icon(
                  widget.icon,
                  color: context.theme.iconTheme.color,
                )
              : SvgPicture.asset(
                  widget.svgPath ?? '',
                  height: 24.0,
                  width: 24.0,
                  color: context.theme.iconTheme.color,
                ),
        ),
        keyboardType: widget.inputType,
        validator: widget.validator ??
            (value) {
              return validation(
                value,
                widget.inputType,
                widget.isRequired,
                widget.labelText,
              );
            },
        onSaved: widget.onSaved,
        onChanged: widget.onChanged,
        enabled: widget.enabled,
      ),
    );
    // ignore: dead_code
  }
}

//#endregion
//#region input multiline
// ignore: must_be_immutable
class KzTextEditMultiLine extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  FormFieldValidator<String>? validator;
  final IconData? icon;
  final String? svgPath;
  final TextInputType? inputType;
  final bool isRequired;
  final int? maxLines;
  Function(String?)? onSaved;

  KzTextEditMultiLine(
      {Key? key, required this.controller, required this.labelText, this.validator, this.icon, this.svgPath, this.inputType, this.maxLines, required this.onSaved, required this.isRequired})
      : super(key: key);

  @override
  _KzTextEditMultiLineState createState() => _KzTextEditMultiLineState();
}

class _KzTextEditMultiLineState extends State<KzTextEditMultiLine> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIconConstraints: const BoxConstraints(minHeight: 0),
        contentPadding: const EdgeInsets.all(1),
        labelText: widget.labelText,
        labelStyle: context.textTheme.labelMedium,
        icon: widget.icon != null
            ? Icon(
                widget.icon,
                color: context.theme.iconTheme.color,
                size: context.theme.iconTheme.size,
              )
            : widget.svgPath == null
                ? null
                : SvgPicture.asset(
                    widget.svgPath ?? '',
                    height: 24.0,
                    width: 24.0,
                  ),
      ),
      maxLines: widget.maxLines ?? 3,
      keyboardType: widget.inputType,
      validator: widget.validator ??
          (value) {
            return validation(
              value,
              widget.inputType,
              widget.isRequired,
              widget.labelText,
            );
          },
      onSaved: widget.onSaved,
    );
  }
}

//#endregion
//#endregion
String? validation(String? value, TextInputType? inputType, bool isRequired, String? label) {
  if (inputType != null || isRequired) {
    if (!isRequired) {
      return null;
    } else if (isRequired && inputType == null) {
      if (value == null || value.isEmpty) {
        return '$label alanı zorunludur!';
      } else {
        return null;
      }
    } else if (inputType == TextInputType.number) {
      if (value == null || value.isEmpty || !value.isNumeric()) {
        return '$label geçersiz karakter!';
      }
    } else if (inputType == TextInputType.emailAddress) {
      if (value == null || value.isEmpty || !value.isEmail()) {
        return '$label gecerli bir adres giriniz';
      } else {
        return null;
      }
    } else if (inputType == TextInputType.name) {
      if (value == null || value.isEmpty) {
        return '$label alanı zorunludur!';
      } else {
        return null;
      }
    } else if (inputType == TextInputType.phone) {
      if (value == null || value.isEmpty || !value.isPhone()) {
        return '$label alanı zorunludur!';
      } else {
        return null;
      }
    } else if (inputType == TextInputType.url) {
      if (value == null || value.isEmpty || value.isUrl()) {
        return '$label alanı zorunludur!';
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
  return null;
}

enum kzTextEditEnums {
  /// * Type String
  labelText,

  /// * Type FormFieldValidator<String>?
  validator,

  /// * Type IconData?
  icon,

  /// * Type TextInputType?
  inputType,

  /// * isRequired Type bool
  enabled,

  /// * Type bool
  isRequired,

  /// * Type Function(String?)?
  onSaved
}

// // ignore: must_be_immutable
// class KzTextEditz extends StatefulWidget {
//   final TextEditingController controller;
//   final Map<kzTextEditEnums, dynamic> extra;

//   const KzTextEditz({Key? key, required this.controller, required this.extra})
//       : super(key: key);

//   @override
//   _KzTextEditzState createState() => _KzTextEditzState();
// }

// class _KzTextEditzState extends State<KzTextEditz> {
//   @override
//   void initState() {
//     super.initState();
//     /*if ((widget.inputType != null && widget.validator == null) ||
//         (widget.isRequired && widget.validator == null)) {
//       if (widget.isRequired && widget.inputType == null) {
//         widget.validator = (value) {
//           if (value == null || value.isEmpty) {
//             return widget.labelText + ' alanı zorunludur!';
//           } else
//             return null;
//         };
//       } else if (widget.inputType == TextInputType.number) {
//         widget.validator = (value) {
//           if (value == null || value.isEmpty || !value.isNumeric()) {
//             return widget.labelText + ' geçersiz karakter!';
//           }
//         };
//       } else if (widget.inputType == TextInputType.emailAddress) {
//         widget.validator = (value) {
//           if (value == null || value.isEmpty || !value.isEmail())
//             return 'gecerli bir email adresi giriniz';
//           else
//             return null;
//         };
//       } else if (widget.inputType == TextInputType.name) {
//         widget.validator = (value) {
//           if (value == null || value.isEmpty)
//             return widget.labelText + ' alanı zorunludur!';
//           else
//             return null;
//         };
//       } else if (widget.inputType == TextInputType.phone) {
//         widget.validator = (value) {
//           if (value == null || value.isEmpty || !value.isPhone())
//             return widget.labelText + ' alanı zorunludur!';
//           else
//             return null;
//         };
//       } else if (widget.inputType == TextInputType.url) {
//         widget.validator = (value) {
//           if (value == null || value.isEmpty || value.isUrl())
//             return widget.labelText + ' alanı zorunludur!';
//           else
//             return null;
//         };
//       }
//     }*/
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//           borderRadius:
//               BorderRadius.circular(MyBlock.horizontal(context, x: 10))),
//       elevation: 3,
//       child: Padding(
//         padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.5)),
//         child: Row(
//           children: [
//             Container(
//                 padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1)),
//                 decoration: const BoxDecoration(
//                     shape: BoxShape.circle, color: Color(0xff6551A0)),
//                 child: Icon(widget.extra[kzTextEditEnums.icon],
//                     color: Colors.white,
//                     size: MyBlock.horizontal(context, x: 9))),
//             Expanded(
//               child: TextFormField(
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: MyBlock.vertical(context, x: 2)),
//                 controller: widget.controller,
//                 decoration: InputDecoration(
//                     contentPadding: EdgeInsets.symmetric(
//                         vertical: 0,
//                         horizontal: MyBlock.horizontal(context, x: 3)),
//                     labelText: widget.extra[kzTextEditEnums.labelText],
//                     labelStyle: TextStyle(
//                         color: Colors.black54,
//                         fontSize: MyBlock.vertical(context, x: 1.7)),
//                     border: InputBorder.none,
//                     focusedBorder: InputBorder.none),
//                 keyboardType: widget.extra[kzTextEditEnums.inputType],
//                 validator: widget.extra[kzTextEditEnums.validator] ??
//                     (value) {
//                       return validation(
//                         value,
//                         widget.extra[kzTextEditEnums.inputType],
//                         widget.extra[kzTextEditEnums.isRequired] ?? false,
//                         widget.extra[kzTextEditEnums.labelText],
//                       );
//                     },
//                 onSaved: widget.extra[kzTextEditEnums.onSaved],
//                 enabled: widget.extra[kzTextEditEnums.enabled],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
