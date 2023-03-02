import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';
import '../../my_block.dart';
import '../../themes/colors.dart';

class SaveButtonModal extends StatefulWidget {
  final List<Widget?> buttons;
  final String title;
  final IconData? menuButtonIcon;

  const SaveButtonModal({
    Key? key,
    required this.buttons,
    required this.title,
    this.menuButtonIcon,
  }) : super(key: key);

  @override
  _SaveButtonModalState createState() => _SaveButtonModalState();
}

class _SaveButtonModalState extends State<SaveButtonModal> {
  List<Widget> widgets = [];
  @override
  Widget build(BuildContext context) {
    _build();
    return Container(
      height: 50.0,
      width: 50.0,
      child: FloatingActionButton(
        backgroundColor: ThemeColors.mainPurple,
        child: Icon(
          widget.menuButtonIcon ?? Icons.menu,
        ),
        onPressed: () => floatingModel(),
      ),
    );
  }

  floatingModel() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(MyBlock.horizontal(context, x: 6)),
          ),
        ),
        builder: (context) {
          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: widgets,
            ),
          );
        });
  }

  Widget _sizeBox() {
    return SizedBox(
      height: MyBlock.vertical(context, x: 1),
    );
  }

  Widget _driver() {
    return Divider(
      endIndent: MyBlock.horizontal(context, x: 6),
      indent: MyBlock.horizontal(context, x: 6),
      height: 0.5,
    );
  }

  _build() {
    widgets = []; //her build de yeniden listeye eklemesin diye listeyi sıfırlıyoruz
    widgets.add(SizedBox(
      height: MyBlock.vertical(context, x: 1.5),
    ));

    widgets.add(Text(
      widget.title,
      style: context.textTheme.bodyLarge,
    ));

    for (var m in widget.buttons) {
      {
        if (m != null) {
          widgets.add(m);
          widgets.add(_sizeBox());
          widgets.add(_driver());
          widgets.add(_sizeBox());
        }
      }
    }
    widgets.add(
      Padding(
        padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 16)),
        child: TextButton(
          onPressed: () => Navigator.pop(context),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2)),
            child: Text(
              "Vazgeç",
              style: context.textTheme.displayLarge,
            ),
          ),
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(double.maxFinite, 0)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
              backgroundColor: MaterialStateProperty.all(const Color(0xff65539E))),
        ),
      ),
    );
    widgets.add(
      SizedBox(
        height: MyBlock.vertical(context, x: 1),
      ),
    );
  }
}

// ignore: must_be_immutable
class SaveModalButton extends StatefulWidget {
  final Function()? onTab;
  final IconData icon;
  final String text;
  bool enable;

  SaveModalButton({
    Key? key,
    this.onTab,
    required this.icon,
    required this.text,
    this.enable = true,
  }) : super(key: key);

  @override
  _SaveModalButtonState createState() => _SaveModalButtonState();
}

class _SaveModalButtonState extends State<SaveModalButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.enable ? widget.onTab : null,
      child: Ink(
        child: SizedBox(
          width: double.maxFinite,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: MyBlock.horizontal(context, x: 16),
              ),
              Icon(widget.icon, color: ThemeColors.purple, size: MyBlock.horizontal(context, x: 10)),
              SizedBox(
                width: MyBlock.horizontal(context, x: 4),
              ),
              Text(
                widget.text,
                style: context.textTheme.labelLarge,
              )
            ],
          ),
        ),
      ),
    );
  }
}
/*
StyledButton(
              child: Text("TAP ME"),
              style: keyboardStyle,
              pressedStyle: keyboardStyle.copyWith(
                shadows: [
                  ShapeShadow(blurRadius: 3, spreadRadius: 1, color: Colors.grey.shade700, offset: Offset(0, 3)),
                  ShapeShadow(blurRadius: 0, color: Colors.teal, offset: Offset(0, 2)),
                  ShapeShadow(blurRadius: 0, spreadRadius: -1, color: Colors.tealAccent.shade400, offset: Offset(0, 1)),
                ],
                transform: SmoothMatrix4()..translate(0.toPXLength, -2.toPXLength),
              ),
              hoveredStyle: keyboardStyle.copyWith(
                shadows: [
                  ShapeShadow(blurRadius: 10, spreadRadius: 1, color: Colors.grey.shade700, offset: Offset(0, 10)),
                  ShapeShadow(blurRadius: 0, color: Colors.teal, offset: Offset(0, 11)),
                  ShapeShadow(blurRadius: 0, spreadRadius: -1, color: Colors.tealAccent.shade400, offset: Offset(0, 10)),
                ],
                transform: SmoothMatrix4()..translate(0.toPXLength, -11.toPXLength),
              ),
              curve: Curves.elasticOut,
              duration: Duration(milliseconds: 3000),
              onPressed: () {
                print("Tapped!");
              },
            ),
 */