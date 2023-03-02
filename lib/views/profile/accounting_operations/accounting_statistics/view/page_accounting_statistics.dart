import 'package:flutter/material.dart';
import 'package:kidszone_app/register.dart';
import 'package:kidszone_app/views/_init/components/appbar/custom_appbar.dart';
import 'package:kidszone_app/views/_init/router/app_router.dart';

import '../../../../_init/components/dropdown/kz_dropdown.dart';
import '../../../../_init/my_block.dart';
import '../viewmodel/view_model_accounting_statistics.dart';

class PageAccountingStatistics extends StatefulWidget {
  PageAccountingStatistics({Key? key}) : super(key: key);

  final ViewModelAccountingStatistics vm = ViewModelAccountingStatistics();
  @override
  State<PageAccountingStatistics> createState() =>
      _PageAccountingStatisticsState();
}

class _PageAccountingStatisticsState extends State<PageAccountingStatistics> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            CustomAppBar(
              innerBoxIsScrolled,
              headerWidgets: [
                Text("Muhasebe Detay"),
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
                  padding: EdgeInsets.symmetric(horizontal:MyBlock.horizontal(context,x: 3)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MyBlock.vertical(context, x: 1),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                            MyBlock.horizontal(context, x: 2)),
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
                                    MyBlock.horizontal(context,
                                        x: 5)))),
                        child: KzDropDown(
                          onChanged: (value) {
                            setState(() {
                              widget.vm.pickedTur = value.toString();
                            });
                          },
                          title: "Kullanıcı Grubu",
                          list: widget.vm.turList.map((e) => DropdownMenuItem(child: Text(e), value: e)).toList(),
                          value: widget.vm.pickedTur,
                        ),
                      ),
                      SizedBox(
                        height: MyBlock.vertical(context, x: 3),
                      ),
                      ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: List.generate(20, (index) => index).map((e) => GestureDetector(
                          onTap: ()=>resolve<AppRouter>().push(RouteShowPayments()),
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MyBlock.horizontal(context,x: 3))),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(MyBlock.horizontal(context,x: 2)),
                                  child: Container(
                                      padding: EdgeInsets.all(
                                          MyBlock.horizontal(context, x: 2)),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xffF19BC3)),
                                      child: Icon(Icons.person,
                                          color: Colors.white,
                                          size: MyBlock.horizontal(context, x: 9))),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Aybike GEMCİ",style: TextStyle(
                                        fontSize: MyBlock.vertical(context, x: 1.6),
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff6551A0)),),
                                    SizedBox(
                                      height: MyBlock.vertical(context, x: 1),
                                    ),
                                    Text("Yurt Ödemesi 15-Eyl-2020",style: TextStyle(
                                        fontSize: MyBlock.vertical(context, x: 1.3),
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xffB5ACD2)),),

                                  ],
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text("150.00",style: TextStyle(
                                        fontSize: MyBlock.vertical(context, x: 1.6),
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff6551A0)),),
                                  ),
                                ),
                                Container(height: MyBlock.horizontal(context,x: 17),width: MyBlock.horizontal(context,x: 10),decoration: BoxDecoration(color: Color(0xff6551A0),borderRadius: BorderRadius.horizontal(left: Radius.circular(MyBlock.horizontal(context,x: 100)),right: Radius.circular(MyBlock.horizontal(context,x: 30)))),child: Icon(Icons.send_rounded,color: Colors.white,size: MyBlock.horizontal(context,x: 7),),)
                              ],
                            ),
                          ),
                        )).toList(),
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
