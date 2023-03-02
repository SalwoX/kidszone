import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../core/extension/context_extension.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../views/_init/my_block.dart';
import '../../../common/model/clipper.dart';
import 'page_payments.dart';
import '../../view_model/view_model_accounting.dart';
import '../../../views/_init/logger/logger_mixin.dart';

// ignore: must_be_immutable
class AccountingStatistics extends StatefulWidget {
  var vm = ViewModelAccounting();
  AccountingStatistics({Key? key}) : super(key: key);

  @override
  _AccountingStatisticsState createState() => _AccountingStatisticsState();
}

class _AccountingStatisticsState extends State<AccountingStatistics> with LoggerMixin {
  String pickedTour = "...";
  List tourList = [
    LocaleKeys.condition_three_dots.tr(),
    LocaleKeys.condition_all_users.tr(),
    LocaleKeys.condition_class_list.tr(),
    LocaleKeys.condition_student_list.tr(),
    LocaleKeys.condition_just_teacher.tr()
  ];

  @override
  void initState() {
    super.initState();
    widget.vm.getStudentList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(AppBar().preferredSize.width, AppBar().preferredSize.height * 1.5),
        child: Stack(
          children: [
            AppBar(
              shadowColor: Colors.transparent,
              title: Text(LocaleKeys.accountingStatisticsPage_accounting_statistics.tr()),
              centerTitle: false,
              backgroundColor: Color(0xff65539E),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    height: AppBar().preferredSize.height * 1.35,
                    child: Wrap(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: MyBlock.horizontal(context, x: 25),
                            height: MyBlock.horizontal(context, x: 9),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.horizontal(left: Radius.circular(MyBlock.horizontal(context, x: 3)))),
                            child: Center(
                              child: Container(
                                  height: MyBlock.horizontal(context, x: 9),
                                  child: Center(
                                    child: Text(
                                      LocaleKeys.accountingStatisticsPage_collective_notification_send.tr(),
                                      textAlign: TextAlign.center,
                                      style: context.textTheme.bodyLarge,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ))),
          ],
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
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
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 3)),
                child: Column(
                  children: [
                    SizedBox(
                      height: MyBlock.vertical(context, x: 1),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2)),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 3)],
                          borderRadius: BorderRadius.horizontal(left: Radius.circular(MyBlock.horizontal(context, x: 10)), right: Radius.circular(MyBlock.horizontal(context, x: 5)))),
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
                                        pickedTour = value.toString();
                                      });
                                    },
                                    value: pickedTour,
                                    items: tourList.map((e) => DropdownMenuItem(value: e, child: Text(e.toString()))).toList()),
                                Text(
                                  LocaleKeys.accountingStatisticsPage_type.tr(),
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
                      height: MyBlock.vertical(context, x: 3),
                    ),
                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: widget.vm.studentListModel
                          .map((item) => GestureDetector(
                                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PagePayments())),
                                child: Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(MyBlock.horizontal(context, x: 2)),
                                        child: Container(
                                            padding: EdgeInsets.all(MyBlock.horizontal(context, x: 2)),
                                            decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xffF19BC3)),
                                            child: Icon(Icons.person, color: Colors.white, size: MyBlock.horizontal(context, x: 9))),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.nameSurname ?? '',
                                            style: context.textTheme.bodyLarge,
                                          ),
                                          SizedBox(
                                            height: MyBlock.vertical(context, x: 1),
                                          ),
                                          Text(
                                            LocaleKeys.accountingStatisticsPage_dormitory_payment.tr(),
                                            style: context.textTheme.bodySmall,
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            LocaleKeys.accountingStatisticsPage_hundred_and_fifty.tr(),
                                            style: context.textTheme.bodyMedium,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: MyBlock.horizontal(context, x: 17),
                                        width: MyBlock.horizontal(context, x: 10),
                                        decoration: BoxDecoration(
                                            color: Color(0xff6551A0),
                                            borderRadius:
                                                BorderRadius.horizontal(left: Radius.circular(MyBlock.horizontal(context, x: 100)), right: Radius.circular(MyBlock.horizontal(context, x: 30)))),
                                        child: Icon(
                                          Icons.send_rounded,
                                          color: Colors.white,
                                          size: MyBlock.horizontal(context, x: 7),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                          .toList(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
