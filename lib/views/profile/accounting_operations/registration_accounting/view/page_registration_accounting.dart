import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../_init/components/appbar/custom_appbar.dart';
import '../../../../_init/components/button/KzNumericStepButton.dart';
import '../../../../_init/components/dropdown/dropdownlist/dropdown_search.dart';
import '../../../../_init/components/input/kz_edit_widgets.dart';
import '../../../../_init/models/filter_model.dart';
import '../../../../_init/my_block.dart';
import '../../../../_init/themes/colors.dart';
import '../../../../registration/student/model/student_model.dart';
import '../viewmodel/viewmodel_registration_accounting.dart';

class PageRegistrationAccounting extends StatefulWidget {
  PageRegistrationAccounting({Key? key}) : super(key: key);

  final ViewModelRegistrationAccounting vm = ViewModelRegistrationAccounting();

  @override
  State<PageRegistrationAccounting> createState() => _PageRegistrationAccountingState();
}

class _PageRegistrationAccountingState extends State<PageRegistrationAccounting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.theme.iconTheme.color,
        child: Icon(
          Icons.check,
          color: ThemeColors.darkWhite,
        ),
        onPressed: () {
          //TODO Kayıt işlemi için doldurulacak
        },
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            CustomAppBar(
              innerBoxIsScrolled,
              headerWidgets: [
                Text(
                  //TODO lokalizasyon işlemleri tamamlanacak
                  "Öğrenci Muhasebe Kaydı",
                  style: context.textTheme.displayLarge,
                ),
              ],
              isBackButton: true,
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 12.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownSearch<StudentModel>(
                  dropdownSearchDecoration: InputDecoration(
                    contentPadding: EdgeInsets.all(1),
                    icon: Icon(
                      Icons.more_horiz,
                      color: context.theme.iconTheme.color,
                    ),
                    labelText: "Öğrenci Seçin",
                    labelStyle: context.textTheme.labelMedium,
                  ),
                  controller: widget.vm.dropdownController,
                  onSaved: (model) {
                    widget.vm.model.studentId = model!.id;
                  },
                  maxHeight: 500,
                  mode: Mode.BOTTOM_SHEET,
                  showClearButton: true,
                  isFilteredOnline: true,
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear, color: ThemeColors.white, size: MyBlock.horizontal(context, x: 30)),
                        onPressed: () {
                          widget.vm.dropdownController.clear();
                        },
                      ),
                    ),
                  ),
                  compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
                  filterFn: (item, filter) {
                    if (filter!.isEmpty) return true;
                    return item!.nameSurname!.toLowerCase().contains(filter.toLowerCase());
                  },
                  onFind: (filter) async {
                    var fields = <Field>[];
                    if (filter != null && filter.isNotEmpty) {
                      fields.add(Field(fieldName: "Name", fieldOperator: "startswith", fieldValue: filter));
                      fields.add(Field(fieldName: "Type", fieldOperator: "eq", fieldValue: "4"));
                    }

                    var list = widget.vm.repCommon.getStudentList(fields);
                    return list;
                  },
                  itemAsString: (val) => "${val!.nameSurname!}",
                  selectedItemFuture: (filter) async {
                    var fields = <Field>[];
                    if (filter != null && filter.isNotEmpty) {
                      fields.add(Field(fieldName: "Id", fieldOperator: "eq", fieldValue: filter));
                    }
                    var list = await widget.vm.repCommon.getStudentList(fields);
                    return list;
                  },
                ),
              ),
              KzTextEdit(
                icon: Icons.attach_money_sharp,
                controller: widget.vm.agreementAmountController,
                inputType: TextInputType.number,
                labelText: "Sözleşme Tutarı",
                onSaved: (value) {},
              ),
              KzTextEdit(
                icon: Icons.percent_outlined,
                controller: widget.vm.discountRateController,
                inputType: TextInputType.number,
                labelText: "İskonto Oranı",
                onChanged: (value) {
                  //iskonto tutarı hesabı
                  widget.vm.discountAmountController.text = (widget.vm.agreementAmountController.text.toDouble() * widget.vm.discountRateController.text.toDouble() / 100).toStringAsFixed(2);
                },
                onSaved: (value) {},
              ),
              KzTextEdit(
                icon: Icons.discount_outlined,
                controller: widget.vm.discountAmountController,
                inputType: TextInputType.number,
                labelText: "İskonto Tutarı",
                onChanged: (value) {
                  //iskonto oranı hesabı
                  widget.vm.discountRateController.text = (widget.vm.discountAmountController.text.toDouble() * 100 / widget.vm.agreementAmountController.text.toDouble()).toStringAsFixed(2);
                },
                onSaved: (value) {},
              ),
              KzTextEdit(
                icon: Icons.payments_outlined,
                controller: widget.vm.advanceController,
                inputType: TextInputType.number,
                labelText: "Peşinat",
                onChanged: (value) {
                  //toplam tutar hesabı
                  widget.vm.totalController.text =
                      (widget.vm.agreementAmountController.text.toDouble() - widget.vm.discountAmountController.text.toDouble() - widget.vm.advanceController.text.toDouble()).toStringAsFixed(2);
                },
                onSaved: (value) {},
              ),
              KzTextEdit(
                icon: Icons.add_box_rounded,
                controller: widget.vm.totalController,
                labelText: "Toplam",
                onSaved: (value) {},
              ),
              KzNumericStepButton(
                minValue: 1,
                maxValue: DateTime.daysPerWeek * 4,
                step: 1,
                title: "Ödeme Günü Seçiniz",
                value: widget.vm.paymentDay,
                onChanged: (value) {
                  widget.vm.paymentDay = value;
                },
              ),
              KzNumericStepButton(
                minValue: 1,
                maxValue: 12,
                step: 1,
                title: "Taksit Sayısı",
                value: widget.vm.installmentNum,
                onChanged: (value) {
                  widget.vm.installmentNum = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
