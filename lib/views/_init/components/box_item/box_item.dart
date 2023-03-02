import 'package:flutter/material.dart';
import '../../themes/colors.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../my_block.dart';

class BoxItem extends StatefulWidget {
  final Function()? onTap;
  final String? text;
  final bool? active;

  BoxItem({Key? key, this.onTap, this.active, this.text}) : super(key: key);

  @override
  State<BoxItem> createState() => _BoxItemState();
}

class _BoxItemState extends State<BoxItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap ?? null,
      child: Wrap(
        children: [
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: ThemeColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 2,
                  blurRadius: 5,
                )
              ],
              borderRadius: BorderRadius.circular(
                MyBlock.horizontal(context, x: 3),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: MyBlock.vertical(context),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 1, blurRadius: 3)],
                    shape: BoxShape.circle,
                    color: widget.active == true ? Color(0xffF19BC3) : Color(0xff78C0FF), //temaya eklenecek
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.6)),
                    child: Icon(
                      Icons.person_rounded,
                      color: Colors.white,
                      size: MyBlock.horizontal(context, x: 9),
                    ),
                  ),
                ),
                SizedBox(
                  height: MyBlock.vertical(context, x: 0.6),
                ),
                Container(
                  height: MyBlock.vertical(context, x: 4),
                  child: FittedBox(
                    child: Text(
                      widget.text ?? '',
                      style: context.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: MyBlock.vertical(context),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
