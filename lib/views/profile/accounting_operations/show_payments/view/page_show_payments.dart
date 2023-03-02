import 'package:flutter/material.dart';

import '../../../../_init/components/appbar/custom_appbar.dart';
import '../../../../_init/components/dropdown/kz_dropdown.dart';
import '../../../../_init/my_block.dart';
import '../viewmodel/view_model_show_payments.dart';

class PageShowPayments extends StatefulWidget {
  PageShowPayments({Key? key}) : super(key: key);

  final ViewModelShowPayments vm = ViewModelShowPayments();
  @override
  State<PageShowPayments> createState() => _PageShowPaymentsState();
}

class _PageShowPaymentsState extends State<PageShowPayments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            CustomAppBar(
              innerBoxIsScrolled,
              headerWidgets: [
                Text("Ödemeler"),
              ],
              isBackButton: true,
            ),
          ];
        },
        body: Column(
          children: [
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
                        child: KzDropDown(
                          onChanged: (value) {
                            setState(() {
                              widget.vm.pickedOdeme = value.toString();
                            });
                          },
                          title: "Ödeme Türü",
                          list: widget.vm.odemeList
                              .map((e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  ))
                              .toList(),
                          value: widget.vm.pickedOdeme,
                        ),
                      ),
                      SizedBox(
                        height: MyBlock.vertical(context, x: 2),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2)),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 3)],
                            borderRadius: BorderRadius.horizontal(left: Radius.circular(MyBlock.horizontal(context, x: 10)), right: Radius.circular(MyBlock.horizontal(context, x: 5)))),
                        child: KzDropDown(
                          onChanged: (value) {
                            setState(() {
                              widget.vm.pickedKasa = value.toString();
                            });
                          },
                          value: widget.vm.pickedKasa,
                          title: "Kasa Adı",
                          list: widget.vm.kasaList.map((e) => DropdownMenuItem(child: Text(e), value: e)).toList(),
                        ),
                      ),
                      SizedBox(
                        height: MyBlock.vertical(context, x: 3),
                      ),
                      SafeArea(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 0.5)),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 3)],
                              borderRadius: BorderRadius.horizontal(left: Radius.circular(MyBlock.horizontal(context, x: 5)), right: Radius.circular(MyBlock.horizontal(context, x: 5)))),
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
                                        "Fatura No",
                                        style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.1), fontWeight: FontWeight.bold, color: Color(0xff65539E)),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Center(
                                      child: Text(
                                        "İsim",
                                        style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.1), fontWeight: FontWeight.bold, color: Color(0xff65539E)),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Center(
                                      child: Text(
                                        "Ödeme Adı",
                                        style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.1), fontWeight: FontWeight.bold, color: Color(0xff65539E)),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Center(
                                      child: Text(
                                        "Ödeme Türü",
                                        style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.1), fontWeight: FontWeight.bold, color: Color(0xff65539E)),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Center(
                                      child: Text(
                                        "Ödenen",
                                        style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.1), fontWeight: FontWeight.bold, color: Color(0xff65539E)),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ListView(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: List.generate(10, (index) => index).map<Widget>((e) {
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
                                                (e + 1).toString(),
                                                style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.1), fontWeight: FontWeight.bold, color: Color(0xff65539E)),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Center(
                                              child: Text(
                                                "Aybike GEMCİ",
                                                style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.1), fontWeight: FontWeight.bold, color: Color(0xff65539E)),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Center(
                                              child: Text(
                                                "1",
                                                style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.1), fontWeight: FontWeight.bold, color: Color(0xff65539E)),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Center(
                                                child: Text(
                                              "E. Ödemesi",
                                              style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.1), fontWeight: FontWeight.bold, color: Color(0xff65539E)),
                                              textAlign: TextAlign.center,
                                            )),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Center(
                                                child: Text(
                                              "900.00",
                                              style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.1), fontWeight: FontWeight.bold, color: Color(0xff65539E)),
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
      ),
    );
  }
}
