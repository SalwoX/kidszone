import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/extension/context_extension.dart';
import '../../my_block.dart';
import '../../themes/colors.dart';

Widget profileMenuItems({required String title, IconData? icons, String? svg, Object? arguments, required BuildContext context, required GestureTapCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: MyBlock.horizontal(context, x: 8),
          width: MyBlock.horizontal(context, x: 29) * 0.75,
          decoration: BoxDecoration(color: ThemeColors.mainPurple, borderRadius: BorderRadius.vertical(bottom: Radius.circular(MyBlock.horizontal(context, x: 5)))),
        ),
        Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)],
                    borderRadius: BorderRadius.circular(
                      MyBlock.horizontal(context, x: 3),
                    ),
                  ),
                  padding: EdgeInsets.all(MyBlock.horizontal(context, x: 2.5)),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)],
                      borderRadius: BorderRadius.circular(
                        MyBlock.horizontal(context, x: 3),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(MyBlock.horizontal(context, x: 2)),
                      child: Column(
                        children: [
                          icons != null
                              ? Icon(
                                  icons,
                                  color: ThemeColors.mainPurple,
                                  size: MyBlock.horizontal(context, x: 20),
                                )
                              : svg != null
                                  ? SvgPicture.asset(
                                      svg,
                                      height: MyBlock.horizontal(context, x: 20),
                                      width: MyBlock.horizontal(context, x: 20),
                                    )
                                  : Container(),
                          SizedBox(
                            height: MyBlock.horizontal(context, x: 3),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MyBlock.horizontal(context, x: 29),
                  decoration: BoxDecoration(
                    color: ThemeColors.mainPurple,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(
                        MyBlock.horizontal(context, x: 3),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(title, style: context.textTheme.displaySmall),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

class ListViewWidget {
  Widget iconTextItem({
    required BuildContext context,
    required String text,
    required GestureTapCallback onTap,
    IconData? icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: MyBlock.horizontal(context, x: 2),
                ),
                Container(
                    padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1)),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xffF19BC3)),
                    child: Icon(icon ?? Icons.person_rounded, color: Colors.white, size: MyBlock.horizontal(context, x: 8))),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(MyBlock.horizontal(context, x: 3.5)),
              child: Text(text, style: context.textTheme.headlineSmall),
            ),
            Opacity(
              opacity: 0,
              child: Row(
                children: [
                  SizedBox(
                    width: MyBlock.horizontal(context, x: 2),
                  ),
                  Container(
                      padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1)),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xffF19BC3)),
                      child: Icon(Icons.person_rounded, color: Colors.white, size: MyBlock.horizontal(context, x: 7))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget centerTextItem({
    required BuildContext context,
    required String text,
    required GestureTapCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            MyBlock.horizontal(
              context,
              x: 3,
            ),
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(
              MyBlock.horizontal(
                context,
                x: 3.5,
              ),
            ),
            child: Text(
              text,
              style: context.textTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );
  }
}
