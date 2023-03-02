import 'package:flutter/material.dart';
import '../../../../_init/components/appbar/custom_appbar.dart';
import '../../../../_init/components/input/kz_edit_widgets.dart';
import '../../../../_init/themes/colors.dart';
import 'package:kidszone_app/views/profile/accounting_operations/settings/viewmodel/view_model_accounting_settings.dart';
import '../../../../_init/my_block.dart';

class PageAccountingSettings extends StatefulWidget {
  PageAccountingSettings({Key? key}) : super(key: key);

  final ViewModelAccountingSettings vm = ViewModelAccountingSettings();

  @override
  State<PageAccountingSettings> createState() => _PageAccountingSettingsState();
}

class _PageAccountingSettingsState extends State<PageAccountingSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            CustomAppBar(
              innerBoxIsScrolled,
              headerWidgets: [
                Text("Ayarlar"),
              ],
              isBackButton: true,
            ),
          ];
        },
        body: Form(
          key: widget.vm.formKey,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: MyBlock.horizontal(context, x: 12),
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: ThemeColors.mainPurple),
                                  color: ThemeColors.mainPurple,
                                  borderRadius: BorderRadius.circular(
                                      MyBlock.horizontal(context, x: 2)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 1,
                                        blurRadius: 1)
                                  ]),
                              padding: EdgeInsets.all(
                                  MyBlock.horizontal(context, x: 1.5)),
                              child: Text(
                                "Kasa İşlemleri",
                                style: TextStyle(
                                    fontSize:
                                        MyBlock.horizontal(context, x: 3.1),
                                    color: ThemeColors.darkWhite),
                              ),
                            ),
                          ),
                        )
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
                                height: MyBlock.vertical(context),
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
                                    borderRadius: BorderRadius.circular(
                                        MyBlock.horizontal(context, x: 10))),
                                child: Padding(
                                  padding: EdgeInsets.all(
                                      MyBlock.horizontal(context, x: 1.5)),
                                  child: KzTextEdit(
                                    icon: Icons.cases_outlined,
                                    controller: widget.vm.nakitKasasiEdit,
                                    labelText: "Nakit Kasası",
                                    onSaved: (String? value) {},
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MyBlock.vertical(context, x: 3),
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
                                    borderRadius: BorderRadius.circular(
                                        MyBlock.horizontal(context, x: 10))),
                                child: Padding(
                                  padding: EdgeInsets.all(
                                      MyBlock.horizontal(context, x: 1.5)),
                                  child: KzTextEdit(
                                    icon: Icons.credit_card,
                                    controller: widget.vm.krediKartiEdit,
                                    labelText: "Kredi Kartı",
                                    onSaved: (String? value) {},
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MyBlock.vertical(context, x: 3),
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
                                    borderRadius: BorderRadius.circular(
                                        MyBlock.horizontal(context, x: 10))),
                                child: Padding(
                                  padding: EdgeInsets.all(
                                      MyBlock.horizontal(context, x: 1.5)),
                                  child: KzTextEdit(
                                    icon: Icons.compare_arrows_outlined,
                                    controller: widget.vm.havaleEftEdit,
                                    labelText: "Havale / EFT",
                                    onSaved: (String? value) {},
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MyBlock.vertical(context, x: 3),
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
                                    borderRadius: BorderRadius.circular(
                                        MyBlock.horizontal(context, x: 10))),
                                child: Padding(
                                  padding: EdgeInsets.all(
                                      MyBlock.horizontal(context, x: 1.5)),
                                  child: KzTextEdit(
                                    icon: Icons.cases_outlined,
                                    controller: widget.vm.edit4,
                                    labelText: "4",
                                    onSaved: (String? value) {},
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MyBlock.vertical(context, x: 3),
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
                                    borderRadius: BorderRadius.circular(
                                        MyBlock.horizontal(context, x: 10))),
                                child: Padding(
                                  padding: EdgeInsets.all(
                                      MyBlock.horizontal(context, x: 1.5)),
                                  child: KzTextEdit(
                                    icon: Icons.cases_outlined,
                                    controller: widget.vm.edit5,
                                    labelText: "5",
                                    onSaved: (String? value) {},
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MyBlock.vertical(context, x: 3),
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
                                    borderRadius: BorderRadius.circular(
                                        MyBlock.horizontal(context, x: 10))),
                                child: Padding(
                                  padding: EdgeInsets.all(
                                      MyBlock.horizontal(context, x: 1.5)),
                                  child: KzTextEdit(
                                    icon: Icons.cases_outlined,
                                    controller: widget.vm.edit6,
                                    labelText: "6",
                                    onSaved: (String? value) {},
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MyBlock.vertical(context, x: 3),
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
                                    borderRadius: BorderRadius.circular(
                                        MyBlock.horizontal(context, x: 10))),
                                child: Padding(
                                  padding: EdgeInsets.all(
                                      MyBlock.horizontal(context, x: 1.5)),
                                  child: KzTextEdit(
                                    icon: Icons.cases_outlined,
                                    controller: widget.vm.edit7,
                                    labelText: "7",
                                    onSaved: (String? value) {},
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MyBlock.vertical(context, x: 3),
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
                                    borderRadius: BorderRadius.circular(
                                        MyBlock.horizontal(context, x: 10))),
                                child: Padding(
                                  padding: EdgeInsets.all(
                                      MyBlock.horizontal(context, x: 1.5)),
                                  child: KzTextEdit(
                                    icon: Icons.cases_outlined,
                                    controller: widget.vm.edit8,
                                    labelText: "8",
                                    onSaved: (String? value) {},
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MyBlock.vertical(context, x: 2),
                              ),
                              TextButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      MyBlock.horizontal(
                                                          context,
                                                          x: 3)))),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color(0xff6551A0))),
                                  onPressed: () {},
                                  child: Text(
                                    "Kaydet",
                                    style: TextStyle(color: Colors.white),
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
        ),
      ),
    );
  }
}
