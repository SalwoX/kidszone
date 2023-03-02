import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../../common/model/clipper.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../views/_init/themes/colors.dart';
import '../../../views/_init/my_block.dart';

import '../../../views/_init/logger/logger_mixin.dart';

class PagePayments extends StatefulWidget {
  const PagePayments({Key? key}) : super(key: key);

  @override
  _PagePaymentsState createState() => _PagePaymentsState();
}

class _PagePaymentsState extends State<PagePayments> with LoggerMixin {
  String pickedPayment = LocaleKeys.condition_three_dots.tr();
  List paymentList = [
    LocaleKeys.condition_three_dots.tr(),
    LocaleKeys.condition_all_users.tr(),
    LocaleKeys.condition_class_list.tr(),
    LocaleKeys.condition_student_list.tr(),
    LocaleKeys.condition_just_teacher.tr()
  ];

  String pickedBox = "...";
  List boxList = [
    LocaleKeys.condition_three_dots.tr(),
    LocaleKeys.condition_all_users.tr(),
    LocaleKeys.condition_class_list.tr(),
    LocaleKeys.condition_student_list.tr(),
    LocaleKeys.condition_just_teacher.tr()
  ];

  TextEditingController searchEdit = TextEditingController();

  double searchWidth = 0;

  bool allLoaded = false;

  @override
  void initState() {
    super.initState();
    startSync();
  }

  startSync() async {
    Future.delayed(Duration.zero).then((value) {
      searchWidth = MyBlock.horizontal(context, x: 10);
      setState(() {
        allLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return allLoaded
        ? Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: Size(AppBar().preferredSize.width,
                  AppBar().preferredSize.height * 1.5),
              child: Stack(
                children: [
                  AppBar(
                    shadowColor: Colors.transparent,
                    title:
                        Text(LocaleKeys.paymentPage_student_accounting.tr()),
                    backgroundColor: Color(0xff65539E),
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          height: AppBar().preferredSize.height * 1.35,
                          child: Wrap(
                            children: [
                              AnimatedContainer(
                                width: searchWidth,
                                height: MyBlock.horizontal(context, x: 8),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(
                                            MyBlock.horizontal(context,
                                                x: 3)))),
                                duration: Duration(milliseconds: 500),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (searchWidth !=
                                              MyBlock.horizontal(context,
                                                  x: 10)) {
                                            searchWidth = MyBlock.horizontal(
                                                context,
                                                x: 10);
                                          } else {
                                            searchWidth = MyBlock.horizontal(
                                                context,
                                                x: 80);
                                          }
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: MyBlock.horizontal(context),
                                          ),
                                          Icon(
                                            Icons.search,
                                            color: Color(0xff65539E),
                                          ),
                                          SizedBox(
                                            width: MyBlock.horizontal(context),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                          height:
                                              MyBlock.horizontal(context, x: 5),
                                          child: TextField(
                                            controller: searchEdit,
                                            decoration: InputDecoration(
                                                border: InputBorder.none),
                                            style: context.textTheme.bodyMedium,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ))),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: Container(
                        height: MyBlock.horizontal(context, x: 7),
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    MyBlock.horizontal(context, x: 2))),
                            padding: EdgeInsets.all(
                                MyBlock.horizontal(context, x: 1.5)),
                            child: Text(
                              LocaleKeys.paymentPage_deleted_bill.tr(),
                              style: context.appTheme.textTheme.bodyLarge,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            body: Column(
              children: [
                Stack(
                  children: [
                    ClipPath(
                      clipper: BottomClipper(
                          myVal: MyBlock.horizontal(context, x: 6)),
                      child: Container(
                        width: double.maxFinite,
                        height: MyBlock.horizontal(context, x: 6),
                        decoration: BoxDecoration(
                          color: ThemeColors.mainPurple,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MyBlock.horizontal(context, x: 3)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MyBlock.vertical(context, x: 1),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: MyBlock.horizontal(context, x: 2)),
                            decoration: BoxDecoration(
                                color: ThemeColors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: ThemeColors.textBlack,
                                      spreadRadius: 1,
                                      blurRadius: 3)
                                ],
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(
                                        MyBlock.horizontal(context, x: 10)),
                                    right: Radius.circular(
                                        MyBlock.horizontal(context, x: 5)))),
                            child: Row(
                              children: [
                                Container(
                                    padding: EdgeInsets.all(
                                        MyBlock.horizontal(context, x: 2)),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xff6551A0)),
                                    child: Icon(Icons.list,
                                        color: ThemeColors.white,
                                        size:
                                            MyBlock.horizontal(context, x: 8))),
                                SizedBox(
                                    width: MyBlock.horizontal(context, x: 5)),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DropdownButton(
                                          isExpanded: true,
                                          style: context.textTheme.bodyLarge,
                                          onChanged: (value) {
                                            setState(() {
                                              pickedPayment = value.toString();
                                            });
                                          },
                                          value: pickedPayment,
                                          items: paymentList
                                              .map((e) => DropdownMenuItem(
                                                  value: e,
                                                  child: Text(e.toString())))
                                              .toList()),
                                      Text(
                                        LocaleKeys.paymentPage_payment_type.tr(),
                                        style: context.textTheme.bodyLarge,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    width: MyBlock.horizontal(context, x: 2)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MyBlock.vertical(context, x: 2),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: MyBlock.horizontal(context, x: 2)),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 1,
                                      blurRadius: 3)
                                ],
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(
                                        MyBlock.horizontal(context, x: 10)),
                                    right: Radius.circular(
                                        MyBlock.horizontal(context, x: 5)))),
                            child: Row(
                              children: [
                                Container(
                                    padding: EdgeInsets.all(
                                        MyBlock.horizontal(context, x: 2)),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xff6551A0)),
                                    child: Icon(Icons.list,
                                        color: Colors.white,
                                        size:
                                            MyBlock.horizontal(context, x: 8))),
                                SizedBox(
                                    width: MyBlock.horizontal(context, x: 5)),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DropdownButton(
                                          isExpanded: true,
                                          style: context.textTheme.bodyLarge,
                                          onChanged: (value) {
                                            setState(() {
                                              pickedBox = value.toString();
                                            });
                                          },
                                          value: pickedBox,
                                          items: boxList
                                              .map((e) => DropdownMenuItem(
                                                  value: e,
                                                  child: Text(e.toString())))
                                              .toList()),
                                      Text(LocaleKeys.condition_name.tr(),
                                          style: context.textTheme.bodyLarge)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    width: MyBlock.horizontal(context, x: 2)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MyBlock.vertical(context, x: 3),
                          ),
                          SafeArea(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MyBlock.horizontal(context, x: 0.5)),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 1,
                                        blurRadius: 3)
                                  ],
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(
                                          MyBlock.horizontal(context, x: 5)),
                                      right: Radius.circular(
                                          MyBlock.horizontal(context, x: 5)))),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: MyBlock.vertical(context, x: 1),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Center(
                                          child: Text(
                                            LocaleKeys.paymentPage_bill_no.tr(),
                                            style: context.textTheme.bodyLarge,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Center(
                                          child: Text(
                                            LocaleKeys.condition_name.tr(),
                                            style: context.textTheme.bodyLarge,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Center(
                                          child: Text(
                                            LocaleKeys.paymentPage_payment_name.tr(),
                                            style: context.textTheme.bodyLarge,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Center(
                                          child: Text(
                                            LocaleKeys.paymentPage_payment_type.tr(),
                                            style: context.textTheme.bodyLarge,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Center(
                                          child: Text(
                                            LocaleKeys.condition_paid.tr(),
                                            style: context.textTheme.bodyLarge,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  ListView(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    children:
                                        List.generate(10, (index) => index)
                                            .map<Widget>((e) {
                                      return Column(
                                        children: [
                                          Divider(
                                            indent: 5,
                                            endIndent: 5,
                                            height:
                                                MyBlock.vertical(context, x: 3),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Center(
                                                  child: Text(
                                                    (e + 1).toString(),
                                                    style: context
                                                        .textTheme.bodyLarge,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Center(
                                                  child: Text(
                                                    LocaleKeys
                                                        .payment_name_aybike,
                                                    style: context
                                                        .textTheme.bodyLarge,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Center(
                                                  child: Text(
                                                    "1",
                                                    style: context
                                                        .textTheme.bodyLarge,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Center(
                                                    child: Text(
                                                      LocaleKeys.payment_e_payment,
                                                  style: context
                                                      .textTheme.bodyLarge,
                                                  textAlign: TextAlign.center,
                                                )),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Center(
                                                    child: Text(
                                                      LocaleKeys
                                                      .payment_nine_hundred,
                                                  style: context
                                                      .textTheme.bodyLarge,
                                                  textAlign: TextAlign.center,
                                                )),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
