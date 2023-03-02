import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kidszone_app/core/extension/context_extension.dart';
import 'package:kidszone_app/generated/locale_keys.g.dart';
import 'package:kidszone_app/views/_init/logger/logger_mixin.dart';
import 'package:kidszone_app/views/_init/my_block.dart';
import 'package:kidszone_app/common/model/clipper.dart';

class PageLessonHours extends StatefulWidget {
  const PageLessonHours({Key? key}) : super(key: key);

  @override
  _PageLessonHoursState createState() => _PageLessonHoursState();
}

class _PageLessonHoursState extends State<PageLessonHours> with LoggerMixin {
  String pickedDays = LocaleKeys.pageLessonHours_three_dots;
  List daysList = [
    LocaleKeys.pageLessonHours_three_dots.tr(),
    LocaleKeys.pageLessonHours_monday.tr(),
    LocaleKeys.pageLessonHours_tuesday.tr(),
    LocaleKeys.pageLessonHours_wednesday.tr(),
    LocaleKeys.pageLessonHours_Thursday.tr(),
    LocaleKeys.pageLessonHours_friday.tr()
  ];

  String pickedHours = LocaleKeys.pageLessonHours_three_dots.tr();
  List hoursList = [
    LocaleKeys.pageLessonHours_three_dots.tr(),
    LocaleKeys.pageLessonHours_ones.tr(),
    LocaleKeys.pageLessonHours_twos.tr(),
    LocaleKeys.pageLessonHours_three.tr(),
    LocaleKeys.pageLessonHours_four.tr(),
    LocaleKeys.pageLessonHours_five.tr()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(LocaleKeys.pageLessonHours_lesson_hours.tr()),
        shadowColor: Colors.transparent,
        backgroundColor: Color(0xff65539E),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MyBlock.vertical(context, x: 3),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2)),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)],
                            borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 10))),
                        child: Row(
                          children: [
                            Container(
                                padding: EdgeInsets.all(MyBlock.horizontal(context, x: 2)),
                                decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xff6551A0)),
                                child: Icon(Icons.list, color: Colors.white, size: MyBlock.horizontal(context, x: 8))),
                            SizedBox(width: MyBlock.horizontal(context, x: 5)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DropdownButton(
                                      isExpanded: true,
                                      style: context.textTheme.bodyMedium,
                                      onChanged: (value) {
                                        setState(() {
                                          pickedDays = value.toString();
                                        });
                                      },
                                      value: pickedDays,
                                      items: daysList.map((e) => DropdownMenuItem(value: e, child: Text(e.toString()))).toList()),
                                  Text(
                                    LocaleKeys.pageLessonHours_lesson_days.tr(),
                                    style: context.textTheme.bodyLarge,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: MyBlock.horizontal(context, x: 2)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MyBlock.vertical(context, x: 2),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2)),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)],
                            borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 10))),
                        child: Row(
                          children: [
                            Container(
                                padding: EdgeInsets.all(MyBlock.horizontal(context, x: 2)),
                                decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xff6551A0)),
                                child: Icon(Icons.list, color: Colors.white, size: MyBlock.horizontal(context, x: 8))),
                            SizedBox(width: MyBlock.horizontal(context, x: 5)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DropdownButton(
                                      isExpanded: true,
                                      style: context.textTheme.bodyMedium,
                                      onChanged: (value) {
                                        setState(() {
                                          pickedHours = value.toString();
                                        });
                                      },
                                      value: pickedHours,
                                      items: hoursList.map((e) => DropdownMenuItem(value: e, child: Text(e.toString()))).toList()),
                                  Text(
                                    LocaleKeys.pageLessonHours_lesson_number.tr(),
                                    style: context.textTheme.bodyLarge,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: MyBlock.horizontal(context, x: 2)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MyBlock.vertical(context, x: 5),
                      ),
                      pickedHours != LocaleKeys.pageLessonHours_three.tr()
                          ? Container(
                              padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2), vertical: MyBlock.horizontal(context, x: 1)),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)],
                                  borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 2))),
                              child: Text(
                                LocaleKeys.pageLessonHours_lesson_hours_week.tr(),
                                style: context.textTheme.bodySmall,
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: MyBlock.vertical(context, x: 2),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: pickedHours.toString() != LocaleKeys.pageLessonHours_three_dots.tr() ? int.parse(pickedHours.toString()) : 0,
                        itemBuilder: (context, index) {
                          return lessonWidget(index);
                        },
                      )
                    ],
                  ),
                )),
                ClipPath(
                  clipper: BottomClipper(myVal: MyBlock.horizontal(context, x: 6)),
                  child: Container(
                    width: double.maxFinite,
                    height: MyBlock.horizontal(context, x: 6),
                    decoration: BoxDecoration(
                      color: Color(0xff65539E),
                    ),
                  ),
                ),
                SafeArea(
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2)),
                          child: Container(
                              padding: EdgeInsets.all(MyBlock.horizontal(context, x: 2)),
                              decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xff6551A0)),
                              child: Icon(Icons.done, color: Colors.white, size: MyBlock.horizontal(context, x: 8))),
                        ))),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget lessonWidget(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MyBlock.vertical(context, x: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 5), vertical: MyBlock.horizontal(context, x: 5)),
            decoration: BoxDecoration(
                color: Color(0xff6551A0), boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)], borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
            child: Text(
              LocaleKeys.pageLessonHours_lesson.tr() + (index + 1).toString(),
              style: context.textTheme.bodyMedium,
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 5), vertical: MyBlock.horizontal(context, x: 5)),
                decoration: BoxDecoration(
                    color: Colors.white, boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)], borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
                child: Container(
                  width: MyBlock.horizontal(context, x: 13),
                  height: MyBlock.vertical(context, x: 1.7),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: MyBlock.vertical(context, x: 1)), border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(
                width: MyBlock.horizontal(context, x: 1.5),
              ),
              Container(
                width: MyBlock.horizontal(context, x: 5),
                child: Divider(
                  thickness: 5,
                  color: Color(0xff65539E),
                ),
              ),
              SizedBox(
                width: MyBlock.horizontal(context, x: 1.5),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 5), vertical: MyBlock.horizontal(context, x: 5)),
                decoration: BoxDecoration(
                    color: Colors.white, boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)], borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
                child: Container(
                  width: MyBlock.horizontal(context, x: 13),
                  height: MyBlock.vertical(context, x: 1.7),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: MyBlock.vertical(context, x: 1)), border: InputBorder.none),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
