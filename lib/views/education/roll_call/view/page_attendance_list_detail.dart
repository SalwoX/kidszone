// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kidszone_app/core/extension/datetime_extensions.dart';
import 'package:kidszone_app/generated/locale_keys.g.dart';
import 'package:kidszone_app/views/_init/logger/logger_mixin.dart';
import 'package:kidszone_app/views/_init/my_block.dart';

import '../model/attendance_model.dart';

class PageAttendanceListDetail extends StatefulWidget {
  AttendanceModel? item;
  List<AttendanceDetail>? details;
  PageAttendanceListDetail({Key? key, this.item, this.details}) : super(key: key);

  @override
  State<PageAttendanceListDetail> createState() => _PageAttendanceListDetailState();
}

class _PageAttendanceListDetailState extends State<PageAttendanceListDetail> with LoggerMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _studentHistory(context, widget.item!, widget.details!),
    );
  }

  Widget _studentHistory(BuildContext context, AttendanceModel item, List<AttendanceDetail> details) {
    return Column(
      children: [
        SizedBox(
          height: MyBlock.vertical(context, x: 2),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 3)),
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.white, boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)], borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MyBlock.vertical(context),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 1, blurRadius: 3)], shape: BoxShape.circle, color: item.gender == 2 ? Color(0xffF19BC3) : Color(0xff78C0FF)),
                        child: Padding(
                          padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.6)),
                          child: Icon(
                            Icons.person_rounded,
                            size: MyBlock.horizontal(context, x: 9),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MyBlock.vertical(context, x: 0.6),
                      ),
                      Container(
                        height: MyBlock.vertical(context, x: 3),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2.2)),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              item.nameSurname ?? "",
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: MyBlock.horizontal(context, x: 3.2), color: Color(0xff6551A0)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MyBlock.vertical(context),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MyBlock.vertical(context),
                ),
                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: details.map((detail) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 5)],
                              borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3)),
                            child: ExpansionTile(
                              trailing: detail.active == true
                                  ? Icon(
                                      Icons.done_all_rounded,
                                      color: Color(0xff0586EC),
                                      size: MyBlock.horizontal(context, x: 6),
                                    )
                                  : detail.active == false
                                      ? Icon(
                                          Icons.clear,
                                          color: Color(0xffCB3E3B),
                                          size: MyBlock.horizontal(context, x: 6),
                                        )
                                      : Text("Tatil", style: TextStyle(fontSize: MyBlock.vertical(context, x: 1.6), color: Color(0xff3EBB2C))),
                              title: Text(detail.date.toDate, style: TextStyle(fontSize: MyBlock.vertical(context, x: 1.6), fontWeight: FontWeight.bold, color: Color(0xff6551A0))),
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.all(MyBlock.horizontal(context, x: 2)),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(LocaleKeys.condition_entry_school.tr(),
                                                style: TextStyle(fontSize: MyBlock.vertical(context, x: 1.6), fontWeight: FontWeight.bold, color: Color(0xffF19BC3))),
                                            SizedBox(
                                              height: MyBlock.vertical(context, x: 0.5),
                                            ),
                                            Text(LocaleKeys.condition_delivery_person.tr(),
                                                style: TextStyle(fontSize: MyBlock.vertical(context, x: 1.6), fontWeight: FontWeight.bold, color: Color(0xffF19BC3))),
                                            SizedBox(
                                              height: MyBlock.vertical(context, x: 0.5),
                                            ),
                                            Text(LocaleKeys.condition_out_school.tr(),
                                                style: TextStyle(fontSize: MyBlock.vertical(context, x: 1.6), fontWeight: FontWeight.bold, color: Color(0xffF19BC3))),
                                            SizedBox(
                                              height: MyBlock.vertical(context, x: 0.5),
                                            ),
                                            Text(LocaleKeys.condition_receiver.tr(),
                                                style: TextStyle(fontSize: MyBlock.vertical(context, x: 1.6), fontWeight: FontWeight.bold, color: Color(0xffF19BC3)))
                                          ],
                                        ),
                                        SizedBox(
                                          width: MyBlock.horizontal(context, x: 3),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(detail.checkInTime ?? '', style: TextStyle(fontSize: MyBlock.vertical(context, x: 1.6), fontWeight: FontWeight.bold, color: Color(0xff6551A0))),
                                            SizedBox(
                                              height: MyBlock.vertical(context, x: 0.5),
                                            ),
                                            Text(detail.submitter ?? '', style: TextStyle(fontSize: MyBlock.vertical(context, x: 1.6), fontWeight: FontWeight.bold, color: Color(0xff6551A0))),
                                            SizedBox(
                                              height: MyBlock.vertical(context, x: 0.5),
                                            ),
                                            Text(detail.checkOutTime ?? '', style: TextStyle(fontSize: MyBlock.vertical(context, x: 1.6), fontWeight: FontWeight.bold, color: Color(0xff6551A0))),
                                            SizedBox(
                                              height: MyBlock.vertical(context, x: 0.5),
                                            ),
                                            Text(detail.receiver ?? '', style: TextStyle(fontSize: MyBlock.vertical(context, x: 1.6), fontWeight: FontWeight.bold, color: Color(0xff6551A0))),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MyBlock.vertical(context, x: 1.5),
                        )
                      ],
                    );
                  }).toList(),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
