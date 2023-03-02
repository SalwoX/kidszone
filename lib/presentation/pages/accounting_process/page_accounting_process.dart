import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../views/_init/my_block.dart';
import 'package:kidszone_app/common/model/clipper.dart';
import '../../../views/_init/logger/logger_mixin.dart';

class PageAccountingProcess extends StatefulWidget {
  const PageAccountingProcess({Key? key}) : super(key: key);

  @override
  _PageAccountingProcessState createState() => _PageAccountingProcessState();
}

class _PageAccountingProcessState extends State<PageAccountingProcess> with LoggerMixin {
  TextEditingController cashBoxEdit = TextEditingController();
  TextEditingController creditCardEdit = TextEditingController();
  TextEditingController transferEftEdit = TextEditingController();
  TextEditingController edit4 = TextEditingController();
  TextEditingController edit5 = TextEditingController();
  TextEditingController edit6 = TextEditingController();
  TextEditingController edit7 = TextEditingController();
  TextEditingController edit8 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: Column(
          children: [
            Text(LocaleKeys.accountingProcessPage_settings.tr()),
          ],
        ),
        backgroundColor: Color(0xff65539E),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
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
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 2)),
                              boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)]),
                          padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.5)),
                          child: Text(
                            LocaleKeys.accountingProcessPage_cashier_transactions.tr(),
                            style: context.appTheme.textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 3)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MyBlock.vertical(context),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 0.5)),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)],
                                borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 10))),
                            child: Padding(
                              padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.5)),
                              child: TextField(
                                style: context.appTheme.textTheme.bodyMedium,
                                controller: cashBoxEdit,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 3)),
                                    labelText: LocaleKeys.accountingProcessPage_cash_box.tr(),
                                    labelStyle: context.appTheme.textTheme.bodyMedium,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MyBlock.vertical(context, x: 3),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 0.5)),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)],
                                borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 10))),
                            child: Padding(
                              padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.5)),
                              child: TextField(
                                style: context.appTheme.textTheme.bodyMedium,
                                controller: creditCardEdit,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 3)),
                                    labelText: LocaleKeys.accountingProcessPage_credit_card.tr(),
                                    labelStyle: context.appTheme.textTheme.bodyMedium,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MyBlock.vertical(context, x: 3),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 0.5)),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)],
                                borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 10))),
                            child: Padding(
                              padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.5)),
                              child: TextField(
                                style: context.appTheme.textTheme.bodyMedium,
                                controller: transferEftEdit,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 3)),
                                    labelText: LocaleKeys.accountingProcessPage_eft.tr(),
                                    labelStyle: context.appTheme.textTheme.bodyMedium,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MyBlock.vertical(context, x: 3),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 0.5)),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)],
                                borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 10))),
                            child: Padding(
                              padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.5)),
                              child: TextField(
                                style: context.appTheme.textTheme.bodyMedium,
                                controller: edit4,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 3)),
                                    labelText: LocaleKeys.accountingProcessPage_four.tr(),
                                    labelStyle: context.appTheme.textTheme.bodyMedium,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MyBlock.vertical(context, x: 3),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 0.5)),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)],
                                borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 10))),
                            child: Padding(
                              padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.5)),
                              child: TextField(
                                style: context.appTheme.textTheme.bodyMedium,
                                controller: edit5,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 3)),
                                    labelText: LocaleKeys.accountingProcessPage_five.tr(),
                                    labelStyle: context.appTheme.textTheme.bodyMedium,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MyBlock.vertical(context, x: 3),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 0.5)),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)],
                                borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 10))),
                            child: Padding(
                              padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.5)),
                              child: TextField(
                                style: context.appTheme.textTheme.bodyMedium,
                                controller: edit6,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 3)),
                                    labelText: LocaleKeys.accountingProcessPage_six.tr(),
                                    labelStyle: context.appTheme.textTheme.bodyMedium,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MyBlock.vertical(context, x: 3),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 0.5)),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)],
                                borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 10))),
                            child: Padding(
                              padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.5)),
                              child: TextField(
                                style: context.appTheme.textTheme.bodyMedium,
                                controller: edit7,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 3)),
                                    labelText: LocaleKeys.accountingProcessPage_seven.tr(),
                                    labelStyle: context.appTheme.textTheme.bodyMedium,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MyBlock.vertical(context, x: 3),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 0.5)),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)],
                                borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 10))),
                            child: Padding(
                              padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.5)),
                              child: TextField(
                                style: context.appTheme.textTheme.bodyMedium,
                                controller: edit8,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 3)),
                                    labelText: LocaleKeys.accountingProcessPage_eight.tr(),
                                    labelStyle: context.appTheme.textTheme.bodyMedium,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MyBlock.vertical(context, x: 2),
                          ),
                          TextButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3)))),
                                  backgroundColor: MaterialStateProperty.all(Color(0xff6551A0))),
                              onPressed: () => setState(() {}),
                              child: Text(
                                LocaleKeys.accountingProcessPage_save.tr(),
                                style: context.appTheme.textTheme.bodySmall,
                              )),
                          SizedBox(
                            height: MyBlock.vertical(context, x: 5),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
