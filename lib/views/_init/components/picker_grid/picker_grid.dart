import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import '../hexcolor/hex_color.dart';

// ignore: must_be_immutable
class PickerGrid extends StatefulWidget {
  TextEditingController screenPickerColor;
  String? heading;
  String? subheading;
  PickerGrid({
    Key? key,
    required this.screenPickerColor,
    required this.heading,
    this.subheading,
  }) : super(key: key);

  @override
  _PickerGridState createState() => _PickerGridState();
}

class _PickerGridState extends State<PickerGrid> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Padding(
    padding: const EdgeInsets.all(6),
    child: Card(
      elevation: 2,
      child: ColorPicker(
        // Use the screenPickerColor as start color.
        color: widget.screenPickerColor.text.isEmpty
            ? Colors.blue
            : HexColor(
                widget.screenPickerColor.text,
              ),
        enableShadesSelection: true,
        enableOpacity: false,
        pickersEnabled: const <ColorPickerType, bool>{
          ColorPickerType.both: false,
          ColorPickerType.primary: true,
          ColorPickerType.accent: false,
          ColorPickerType.bw: false,
          ColorPickerType.custom: false,
          ColorPickerType.wheel: false,
        },
        // Update the screenPickerColor using the callback.
        onColorChanged: (Color color) => setState(
          () => widget.screenPickerColor.text = color.toHex(),
        ),
        width: 44,
        height: 44,
        borderRadius: 22,
        heading: Text(
          widget.heading!,
          //  style: Theme.of(context).textTheme.headline5,
        ),
        subheading: widget.subheading != null
            ? Text(
                widget.subheading!,
                //  style: Theme.of(context).textTheme.subtitle1,
              )
            : null,
      ),
    ),
        ),
      );
  }
}
