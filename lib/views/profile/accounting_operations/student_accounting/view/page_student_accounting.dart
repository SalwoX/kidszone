import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/extension/context_extension.dart';
import '../../../../../core/extension/convert_extension.dart';
import '../../../../../generated/locale_keys.g.dart';

import '../../../../_init/components/appbar/custom_appbar.dart';
import '../../../../_init/components/dropdown/kz_dropdown.dart';
import '../../../../_init/components/input/kz_edit_widgets.dart';
import '../../../../_init/my_block.dart';
import '../viewmodel/viewmodel_student_accounting.dart';

// ignore: must_be_immutable
class PageStudentAccounting extends StatefulWidget {
  PageStudentAccounting({Key? key}) : super(key: key);

  ViewModelStudentAccounting vm = ViewModelStudentAccounting();

  @override
  State<PageStudentAccounting> createState() => _PageStudentAccountingState();
}

class _PageStudentAccountingState extends State<PageStudentAccounting> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            CustomAppBar(
              innerBoxIsScrolled,
              headerWidgets: [
                Text(
                  widget.vm.page_title,
                  style: context.textTheme.displayLarge,
                ),
              ],
              isBackButton: true,
            ),
          ];
        },
        body: Column(
          children: [
            Padding(padding: EdgeInsets.all(8.0)),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MyBlock.horizontal(context, x: 3)),
                  child: Column(
                    children: [
                      KzDropDown(
                        onChanged: (value) {
                          setState(() {
                            widget.vm.educationPay = value.toString();
                          });
                        },
                        value: widget.vm.educationPay,
                        list: widget.vm.payList
                            .map((e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e.toString(),
                                ))
                            .toList(),
                        title: LocaleKeys.schoolAccountingDetail_education_payment.tr(),
                      ),
                      SizedBox(
                        height: MyBlock.vertical(context, x: 3),
                      ),
                      KzTextEditMultiLine(
                        controller: widget.vm.commentController,
                        labelText: LocaleKeys.studentAccountingPage_comment.tr(),
                        onSaved: (value) {},
                        icon: Icons.comment,
                        isRequired: true,
                      ),
                      SizedBox(
                        height: MyBlock.vertical(context, x: 2),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            /*"Sözleşme Tarihi: " +*/
                            widget.vm.selectedStudent!.agreementDate.toString(),
                            style: TextStyle(
                                fontSize: MyBlock.horizontal(context, x: 2.2),
                                color: Color(0xff65539E)),
                          ),
                          Text(
                            /*"Başlangıç Fiyatı: " +*/
                            widget.vm.selectedStudent!.startingPrice.toString(),
                            style: TextStyle(
                                fontSize: MyBlock.horizontal(context, x: 2.2),
                                color: Color(0xff65539E)),
                          ),
                          Text(
                            /*"Sözleşme Tutarı: " +*/
                            widget.vm.selectedStudent!.agreementAmount
                                .toString(),
                            style: TextStyle(
                                fontSize: MyBlock.horizontal(context, x: 2.2),
                                color: Color(0xff65539E)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MyBlock.vertical(context, x: 2),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: MyBlock.horizontal(context, x: 0.5)),
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
                                    MyBlock.horizontal(context, x: 5)),
                                right: Radius.circular(
                                    MyBlock.horizontal(context, x: 5)))),
                        child: DataTable(
                          sortColumnIndex: 0,
                          columnSpacing: 20.0,
                          columns: widget.vm.columns,
                          rows: widget.vm.selectedStudent!.details!
                              .map((e) => DataRow(cells: [
                                    DataCell(Text(e.id.toString())),
                                    DataCell(Text(e.date.format(formatString: 'dd.MM.yyyy').toString())),
                                    DataCell(Text(e.amount.toString())),
                                    DataCell(Text(e.paid.toString())),
                                    DataCell(Text(e.remaining.toString())),
                                  ]))
                              .toList(),
                        ),
                      ),
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
