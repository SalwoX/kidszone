import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../_init/logger/logger_mixin.dart';
import '../../../_init/my_block.dart';
import '../../../../common/model/clipper.dart';
import '../../../../data/temporary_model/attendanceKidsList.dart';

class PageAttendanceProcess extends StatefulWidget {
  const PageAttendanceProcess({Key? key}) : super(key: key);

  @override
  _PageAttendanceProcessState createState() => _PageAttendanceProcessState();
}

class _PageAttendanceProcessState extends State<PageAttendanceProcess> with LoggerMixin {
  Map<String, dynamic>? pickedKid;
  List<Map<String, dynamic>>? pickedKidInfo = [];

  List<Map<String, dynamic>>? kidList = KidListAttendance().kidList;

  @override
  void initState() {
    super.initState();
    setState(() {
      kidList!.insertAll(
        0,
        kidList!,
      );
    });
    for (var kid in kidList!) {
      String kidsName = kid["name"].toString();
      if (!kidsName.contains("\n")) {
        String kidsLastName = kidsName.split(" ").last;
        kid["name"] = kidsName.replaceFirst(kidsLastName, "\n" + kidsLastName);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: Column(
          children: [
            Text(LocaleKeys.pageAttendanceProcess_polling_operations.tr()),
          ],
        ),
        backgroundColor: Color(0xff65539E),
        actions: [
          IconButton(
            icon: Icon(Icons.analytics_outlined),
            onPressed: () => {} /*Navigator.push(context, MaterialPageRoute(builder: (context) => Istatistikler()))*/,
          )
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: BottomClipper(myVal: MyBlock.horizontal(context, x: 6)),
                child: Container(
                  width: double.maxFinite,
                  height: MyBlock.horizontal(context, x: 12),
                  decoration: BoxDecoration(
                    color: Color(0xff65539E),
                  ),
                ),
              ),
              Container(
                height: MyBlock.horizontal(context, x: 12),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.white), color: Color(0xff65539E), borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
                    padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.5)),
                    child: Text(
                      LocaleKeys.pageAttendanceProcess_date.tr(),
                      style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.1), color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MyBlock.vertical(context, x: 0),
                  ),
                  pickedKid == null
                      ? Column(
                          children: [
                            Text(
                              LocaleKeys.pageAttendanceProcess_choose_student.tr(),
                              style: TextStyle(fontSize: MyBlock.vertical(context, x: 1.6), fontWeight: FontWeight.bold, color: Color(0xff6551A0)),
                            ),
                            SizedBox(
                              height: MyBlock.vertical(context, x: 2),
                            ),
                            GridView(
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.only(
                                  left: MyBlock.horizontal(context, x: 3), right: MyBlock.horizontal(context, x: 3), top: MyBlock.vertical(context, x: 1), bottom: MyBlock.vertical(context, x: 3)),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: MyBlock.horizontal(context, x: 4), mainAxisSpacing: MyBlock.vertical(context, x: 4), crossAxisCount: 4),
                              children: kidList!
                                  .map((Map<String, dynamic> e) => GestureDetector(
                                        onTap: () {
                                          pickedKid = e;
                                          assert(pickedKid!["info"] is List);
                                          setState(() {
                                            pickedKidInfo = pickedKid!["info"] as List<Map<String, String>>;
                                          });
                                        },
                                        child: Wrap(
                                          children: [
                                            Container(
                                              width: double.maxFinite,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)],
                                                  borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: MyBlock.vertical(context),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 1, blurRadius: 3)],
                                                        shape: BoxShape.circle,
                                                        color: e["gender"] == "female" ? Color(0xffF19BC3) : Color(0xff78C0FF)),
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
                                                          e["name"].toString(),
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
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            SizedBox(
                              height: MyBlock.vertical(context, x: 2),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 3)),
                              child: Container(
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)],
                                    borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
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
                                                boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 1, blurRadius: 3)],
                                                shape: BoxShape.circle,
                                                color: pickedKid!["gender"] == "female" ? Color(0xffF19BC3) : Color(0xff78C0FF)),
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
                                                  pickedKid!["name"].toString(),
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
                                      children: pickedKidInfo!.map((Map<String, dynamic> e) {
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
                                                  trailing: e["status"] == "true"
                                                      ? Icon(
                                                          Icons.done_all_rounded,
                                                          color: Color(0xff0586EC),
                                                          size: MyBlock.horizontal(context, x: 6),
                                                        )
                                                      : e["status"] == "false"
                                                          ? Icon(
                                                              Icons.clear,
                                                              color: Color(0xffCB3E3B),
                                                              size: MyBlock.horizontal(context, x: 6),
                                                            )
                                                          : Text(LocaleKeys.pageAttendanceProcess_holiday.tr(),
                                                              style: TextStyle(fontSize: MyBlock.vertical(context, x: 1.6), color: Color(0xff3EBB2C))),
                                                  title:
                                                      Text(e["date"].toString(), style: TextStyle(fontSize: MyBlock.vertical(context, x: 1.6), fontWeight: FontWeight.bold, color: Color(0xff6551A0))),
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
                                                                Text(LocaleKeys.pageAttendanceProcess_school_entry_time.tr(),
                                                                    style: TextStyle(fontSize: MyBlock.vertical(context, x: 1.6), fontWeight: FontWeight.bold, color: Color(0xffF19BC3))),
                                                                SizedBox(
                                                                  height: MyBlock.vertical(context, x: 0.5),
                                                                ),
                                                                Text(LocaleKeys.pageAttendanceProcess_delivery_person.tr(),
                                                                    style: TextStyle(fontSize: MyBlock.vertical(context, x: 1.6), fontWeight: FontWeight.bold, color: Color(0xffF19BC3))),
                                                                SizedBox(
                                                                  height: MyBlock.vertical(context, x: 0.5),
                                                                ),
                                                                Text(LocaleKeys.pageAttendanceProcess_school_exit_time.tr(),
                                                                    style: TextStyle(fontSize: MyBlock.vertical(context, x: 1.6), fontWeight: FontWeight.bold, color: Color(0xffF19BC3))),
                                                                SizedBox(
                                                                  height: MyBlock.vertical(context, x: 0.5),
                                                                ),
                                                                Text(LocaleKeys.pageAttendanceProcess_receiver.tr(),
                                                                    style: TextStyle(fontSize: MyBlock.vertical(context, x: 1.6), fontWeight: FontWeight.bold, color: Color(0xffF19BC3)))
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              width: MyBlock.horizontal(context, x: 3),
                                                            ),
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text(e["enterTime"].toString(),
                                                                    style: TextStyle(fontSize: MyBlock.vertical(context, x: 1.6), fontWeight: FontWeight.bold, color: Color(0xff6551A0))),
                                                                SizedBox(
                                                                  height: MyBlock.vertical(context, x: 0.5),
                                                                ),
                                                                Text(e["deliveryParent"].toString(),
                                                                    style: TextStyle(fontSize: MyBlock.vertical(context, x: 1.6), fontWeight: FontWeight.bold, color: Color(0xff6551A0))),
                                                                SizedBox(
                                                                  height: MyBlock.vertical(context, x: 0.5),
                                                                ),
                                                                Text(e["exitTime"].toString(),
                                                                    style: TextStyle(fontSize: MyBlock.vertical(context, x: 1.6), fontWeight: FontWeight.bold, color: Color(0xff6551A0))),
                                                                SizedBox(
                                                                  height: MyBlock.vertical(context, x: 0.5),
                                                                ),
                                                                Text(e["recieverParent"].toString(),
                                                                    style: TextStyle(fontSize: MyBlock.vertical(context, x: 1.6), fontWeight: FontWeight.bold, color: Color(0xff6551A0))),
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
                        ),
                  SizedBox(
                    height: MyBlock.vertical(context, x: 5),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
