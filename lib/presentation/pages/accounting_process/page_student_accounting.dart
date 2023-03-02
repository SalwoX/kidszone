import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../common/model/clipper.dart';
import '../../../core/extension/context_extension.dart';
import '../../../generated/locale_keys.g.dart';
import 'model/student_accounting_detail_model.dart';
import '../../../views/_init/my_block.dart';
import '../../view_model/view_model_accounting.dart';
import '../../../views/registration/student/model/student_model.dart';
import '../../../views/_init/logger/logger_mixin.dart';

// ignore: must_be_immutable
class PageStudentAccounting extends StatefulWidget {
  var vm = ViewModelAccounting();

  PageStudentAccounting({Key? key}) : super(key: key);

  @override
  _PageStudentAccountingState createState() => _PageStudentAccountingState();
}

class _PageStudentAccountingState extends State<PageStudentAccounting>
    with LoggerMixin {
  TextEditingController noteEdit = TextEditingController();

  String educationPayment = "...";
  List paymentList = [
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
  void initState() async {
    super.initState();
    widget.vm.fields.clear();
    await widget.vm.getStudentList();
    for (var kid in widget.vm.studentListModel) {
      String kidsName = kid.nameSurname ?? '';
      if (!kidsName.contains("\n")) {
        String kidsLastName = kidsName.split(" ").last;
        kid.nameSurname =
            kidsName.replaceFirst(kidsLastName, "\n" + kidsLastName);
      }
    }
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
                    title: Text(
                      LocaleKeys.paymentPage_student_accounting.tr(),
                    ),
                    backgroundColor: Color(0xff65539E),
                  ),
                  Visibility(
                    visible: widget.vm.selectedStudent.id == 0,
                    child: Align(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                              width:
                                                  MyBlock.horizontal(context),
                                            ),
                                            Icon(
                                              Icons.search,
                                              color: Color(0xff65539E),
                                            ),
                                            SizedBox(
                                              width:
                                                  MyBlock.horizontal(context),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                            height: MyBlock.horizontal(context,
                                                x: 5),
                                            child: TextField(
                                              controller: searchEdit,
                                              decoration: InputDecoration(
                                                  border: InputBorder.none),
                                              style:
                                                  context.textTheme.bodyLarge,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ))),
                  ),
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
                          color: Color(0xff65539E),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MyBlock.vertical(context, x: 0),
                        ),
                        Visibility(
                          visible: widget.vm.selectedStudent.id == 0,
                          child: Column(
                            children: [
                              Text(
                                LocaleKeys.studentAccountingPage_select_student
                                    .tr(),
                                style: context.textTheme.bodyMedium,
                              ),
                              SizedBox(
                                height: MyBlock.vertical(context, x: 2),
                              ),
                              GridView(
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.only(
                                    left: MyBlock.horizontal(context, x: 3),
                                    right: MyBlock.horizontal(context, x: 3),
                                    top: MyBlock.vertical(context, x: 1),
                                    bottom: MyBlock.vertical(context, x: 3)),
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing:
                                            MyBlock.horizontal(context, x: 4),
                                        mainAxisSpacing:
                                            MyBlock.vertical(context, x: 4),
                                        crossAxisCount: 4),
                                children: widget.vm.studentListModel
                                    .map((e) => studentItem(e, context))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: widget.vm.selectedStudent.id != 0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: MyBlock.horizontal(context, x: 3)),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MyBlock.horizontal(context, x: 2)),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black26,
                                            spreadRadius: 2,
                                            blurRadius: 5)
                                      ],
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(
                                              MyBlock.horizontal(context,
                                                  x: 10)),
                                          right: Radius.circular(
                                              MyBlock.horizontal(context,
                                                  x: 5)))),
                                  child: Row(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.all(
                                              MyBlock.horizontal(context,
                                                  x: 2)),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff6551A0)),
                                          child: Icon(Icons.list,
                                              color: Colors.white,
                                              size: MyBlock.horizontal(context,
                                                  x: 8))),
                                      SizedBox(
                                          width: MyBlock.horizontal(context,
                                              x: 5)),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            DropdownButton(
                                                isExpanded: true,
                                                style: context
                                                    .textTheme.bodyMedium,
                                                onChanged: (value) {
                                                  setState(() {
                                                    educationPayment =
                                                        value.toString();
                                                  });
                                                },
                                                value: educationPayment,
                                                items: paymentList
                                                    .map((e) =>
                                                        DropdownMenuItem(
                                                            value: e,
                                                            child: Text(
                                                                e.toString())))
                                                    .toList()),
                                            Text(
                                              LocaleKeys
                                                  .studentAccountingPage_tuituon_payment
                                                  .tr(),
                                              style:
                                                  context.textTheme.bodyLarge,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                          width: MyBlock.horizontal(context,
                                              x: 2)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MyBlock.vertical(context, x: 3),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: MyBlock.horizontal(
                                                context,
                                                x: 0.5)),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black26,
                                                  spreadRadius: 2,
                                                  blurRadius: 5)
                                            ],
                                            borderRadius:
                                                BorderRadius.horizontal(
                                                    left: Radius.circular(
                                                        MyBlock.horizontal(
                                                            context,
                                                            x: 10)),
                                                    right: Radius.circular(
                                                        MyBlock.horizontal(
                                                            context,
                                                            x: 5)))),
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                              MyBlock.horizontal(context,
                                                  x: 1.5)),
                                          child: Row(
                                            children: [
                                              Container(
                                                  padding: EdgeInsets.all(
                                                      MyBlock.horizontal(
                                                          context,
                                                          x: 1)),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Color(0xff6551A0)),
                                                  child: Icon(
                                                      Icons.comment_outlined,
                                                      color: Colors.white,
                                                      size: MyBlock.horizontal(
                                                          context,
                                                          x: 9))),
                                              Expanded(
                                                  child: TextField(
                                                style: context
                                                    .textTheme.bodyMedium,
                                                controller: noteEdit,
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 0,
                                                            horizontal:
                                                                MyBlock
                                                                    .horizontal(
                                                                        context,
                                                                        x: 3)),
                                                    labelText: LocaleKeys
                                                        .studentAccountingPage_comment
                                                        .tr(),
                                                    labelStyle: context
                                                        .textTheme.bodyMedium,
                                                    border: InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none),
                                              ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MyBlock.horizontal(context, x: 3),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                          padding: EdgeInsets.all(
                                              MyBlock.horizontal(context,
                                                  x: 2)),
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black26,
                                                    spreadRadius: 2,
                                                    blurRadius: 5)
                                              ],
                                              shape: BoxShape.circle,
                                              color: Colors.white),
                                          child: Icon(Icons.list,
                                              color: Color(0xff6551A0),
                                              size: MyBlock.horizontal(context,
                                                  x: 10))),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: MyBlock.vertical(context, x: 2),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      LocaleKeys
                                              .studentAccountingPage_date_of_contract
                                              .tr() +
                                          (widget.vm.studentAccountingRecord
                                                      .agreementDate ==
                                                  null
                                              ? ''
                                              : DateFormat('dd.MM.yyyy').format(
                                                  widget
                                                      .vm
                                                      .studentAccountingRecord
                                                      .agreementDate!,
                                                )),
                                      style: context.textTheme.bodyMedium,
                                    ),
                                    Text(
                                      LocaleKeys.condition_starting_price.tr() +
                                          widget.vm.studentAccountingRecord
                                              .startingPrice
                                              .toString(),
                                      style: context.textTheme.bodyMedium,
                                    ),
                                    Text(
                                      LocaleKeys.condition_contract_amount +
                                          widget.vm.studentAccountingRecord
                                              .agreementAmount
                                              .toString(),
                                      style: context.textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: MyBlock.vertical(context, x: 2),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MyBlock.horizontal(context, x: 0.5)),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black26,
                                            spreadRadius: 2,
                                            blurRadius: 5)
                                      ],
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(
                                              MyBlock.horizontal(context,
                                                  x: 5)),
                                          right: Radius.circular(
                                              MyBlock.horizontal(context,
                                                  x: 5)))),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: MyBlock.vertical(context, x: 1),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Center(
                                              child: Text(
                                                LocaleKeys.condition_name.tr(),
                                                style:
                                                    context.textTheme.bodyLarge,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Center(
                                              child: Text(
                                                LocaleKeys.condition_date.tr(),
                                                style:
                                                    context.textTheme.bodyLarge,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Center(
                                              child: Text(
                                                LocaleKeys.condition_quantity
                                                    .tr(),
                                                style:
                                                    context.textTheme.bodyLarge,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Center(
                                              child: Text(
                                                LocaleKeys.condition_paid.tr(),
                                                style:
                                                    context.textTheme.bodyLarge,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Center(
                                              child: Text(
                                                LocaleKeys
                                                    .accountingProcessPage_remainder
                                                    .tr(),
                                                style:
                                                    context.textTheme.bodyLarge,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      ListView(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        children: widget
                                            .vm.studentAccountingRecord.details!
                                            .map<Widget>((e) {
                                          return paymentListItem(context, e);
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.vm.selectedStudent.id != 0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MyBlock.horizontal(context, x: 10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100))),
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xff6551A0))),
                                onPressed: () => setState(() {}),
                                child: Text(
                                  LocaleKeys.condition_print.tr(),
                                  style: context.textTheme.bodyMedium,
                                )),
                            TextButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100))),
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xff6551A0))),
                                onPressed: () {},
                                child: Text(
                                  LocaleKeys
                                      .studentAccountingPage_delete_payment_plan
                                      .tr(),
                                  style: context.textTheme.bodyMedium,
                                )),
                          ],
                        ),
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

  Column paymentListItem(BuildContext context, StudentAccountingDetailModel e) {
    return Column(
      children: [
        Divider(
          indent: 5,
          endIndent: 5,
          height: MyBlock.vertical(context, x: 3),
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  (widget.vm.studentAccountingRecord.details!
                              .indexWhere((element) => element == e) +
                          1)
                      .toString(),
                  style: context.textTheme.bodyLarge,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  DateFormat("dd.MM.yyyy").format(e.date!),
                  style: context.textTheme.bodyLarge,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  e.amount.toString(),
                  style: context.textTheme.bodyLarge,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                  child: Text(
                e.paid.toString(),
                style: context.textTheme.bodyLarge,
              )),
            ),
            Expanded(
              flex: 2,
              child: Center(
                  child: Text(
                e.remaining.toString(),
                style: context.textTheme.bodyLarge,
              )),
            ),
          ],
        ),
      ],
    );
  }

  GestureDetector studentItem(StudentModel item, BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.vm.selectedStudent = item;
        // assert(widget.vm.seciliOgrenci!["info"] is List);
        // setState(() {
        //   widget.vm.seciliOgrenciInfo = widget.vm.seciliOgrenci!["info"];
        // });
      },
      child: Wrap(
        children: [
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26, spreadRadius: 2, blurRadius: 5)
                ],
                borderRadius:
                    BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
            child: Column(
              children: [
                SizedBox(
                  height: MyBlock.vertical(context),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26, spreadRadius: 1, blurRadius: 3)
                    ],
                    shape: BoxShape.circle,
                    color: item.gender == 2
                        ? Color(0xffF19BC3)
                        : Color(0xff78C0FF),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.all(MyBlock.horizontal(context, x: 1.6)),
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
                    padding: EdgeInsets.symmetric(
                        horizontal: MyBlock.horizontal(context, x: 2.2)),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        item.nameSurname ?? '',
                        style: context.textTheme.bodyLarge,
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
    );
  }
}
