import 'package:flutter/material.dart';
import '../../../../common/utils/translate.dart';
import '../../themes/colors.dart';
import '../../my_block.dart';

// ignore: must_be_immutable
class Gender extends StatefulWidget {
  final Function(int?)? onPress;
  int? gender;
  Gender({Key? key, this.onPress, required this.gender}) : super(key: key);

  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  var genderList = [lang('Kız'), lang('Erkek')];

  var isGirl = false;
  var isBoy = false;

  @override
  void initState() {
    super.initState();
    widget.gender ??= 2;
    isGirl = widget.gender == 2;
    isBoy = widget.gender == 1;
  }

  @override
  Widget build(BuildContext context) {
    isGirl = widget.gender == 2;
    isBoy = widget.gender == 1;
    return Padding(
      padding: EdgeInsets.all(MyBlock.horizontal(context, x: 2.5)),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: ToggleButtons(
                constraints: BoxConstraints.expand(
                  height: MyBlock.vertical(context, x: 5),
                  width: MyBlock.horizontal(context, x: 42.0),
                ),
                selectedColor: const Color(0xff65539E),
                color: const Color(0xff65539E),
                fillColor: const Color(0xff65539E),
                onPressed: widget.onPress,
                borderRadius: BorderRadius.circular(20.0),
                isSelected: [isGirl, isBoy],
                children: genderList
                    .map<Widget>((e) => SizedBox(
                          width: MyBlock.horizontal(context, x: 40),
                          child: Center(
                            child: Text(
                              e,
                              style: TextStyle(
                                fontSize:  16.0,
                                color: e == lang('Kız') && isGirl
                                    ? ThemeColors.white
                                    : e == lang('Erkek') && isBoy
                                        ? ThemeColors.white
                                        : ThemeColors.textBlack,
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
