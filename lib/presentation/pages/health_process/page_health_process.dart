import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kidszone_app/views/_init/components/datetime/kz_datetime.dart';
import 'package:kidszone_app/views/_init/components/input/kz_edit_widgets.dart';
import 'package:kidszone_app/views/_init/logger/logger_mixin.dart';
import 'package:kidszone_app/views/_init/models/filter_model.dart';
import 'package:kidszone_app/views/_init/my_block.dart';
import 'package:kidszone_app/views/health_operations/view_model/view_model_health.dart';
import 'package:kidszone_app/views/registration/student/model/student_model.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../common/model/clipper.dart';
import '../../../common/utils/translate.dart';
import '../../../core/extension/convert_extension.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../views/_init/components/checbox/kz_checkbox.dart';

// ignore: must_be_immutable
class PageHealthProcess extends StatefulWidget {
  var vm = ViewModelHealth();

  PageHealthProcess({Key? key}) : super(key: key);

  @override
  State<PageHealthProcess> createState() => _PageHealthProcessState();
}

class _PageHealthProcessState extends State<PageHealthProcess> with LoggerMixin {
  @override
  void initState() {
    super.initState();
    widget.vm.getStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: Column(
          children: [
            Text(widget.vm.title, style: context.textTheme.displayLarge),
          ],
        ),
        backgroundColor: Color(0xff65539E),
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
                      LocaleKeys.pageHealthProcess_date.tr(),
                      style: context.textTheme.bodyMedium,
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
                  widget.vm.selectedStudent.id == null
                      ? Container(
                          child: Observer(builder: (_) {
                            return Column(
                              children: [
                                Text(
                                  lang(LocaleKeys.pageHealthProcess_choose_student.tr()),
                                  style: context.textTheme.bodySmall,
                                ),
                                SizedBox(
                                  height: MyBlock.vertical(context, x: 2),
                                ),
                                GridView(
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.only(
                                      left: MyBlock.horizontal(context, x: 3), right: MyBlock.horizontal(context, x: 3), top: MyBlock.vertical(context, x: 1), bottom: MyBlock.vertical(context, x: 3)),
                                  shrinkWrap: true,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: MyBlock.horizontal(context, x: 4),
                                    mainAxisSpacing: MyBlock.vertical(context, x: 4),
                                    crossAxisCount: 4,
                                  ),
                                  children: widget.vm.studentList.map((e) => boxitem(e, context)).toList(),
                                ),
                              ],
                            );
                          }),
                        )
                      : SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 3)),
                            child: Observer(builder: (_) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: MyBlock.vertical(context),
                                  ),
                                  Container(
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
                                              color: widget.vm.selectedStudent.gender == 2 ? Color(0xffF19BC3) : Color(0xff78C0FF)),
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
                                          height: MyBlock.vertical(context, x: 4),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2.2)),
                                            child: Text(
                                              widget.vm.selectedStudent.nameSurname ?? '',
                                              style: context.textTheme.bodyMedium,
                                              textAlign: TextAlign.center,
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
                                    height: MyBlock.vertical(context, x: 3),
                                  ),
                                  KzTextEdit(
                                    controller: widget.vm.size,
                                    labelText: lang(LocaleKeys.pageHealthProcess_length.tr()),
                                    inputType: TextInputType.number,
                                    isRequired: true,
                                    icon: Icons.height,
                                    onSaved: (value) {
                                      widget.vm.model.height = int.tryParse(
                                        value ?? '',
                                        radix: 0,
                                      );
                                    },
                                  ),
                                  KzTextEdit(
                                    controller: widget.vm.weight,
                                    labelText: lang(LocaleKeys.pageHealthProcess_kilo.tr()),
                                    inputType: TextInputType.number,
                                    isRequired: true,
                                    icon: Icons.height,
                                    onSaved: (value) {
                                      widget.vm.model.weight = int.tryParse(
                                        value ?? '',
                                        radix: 0,
                                      );
                                    },
                                  ),
                                  KzCheckBox(
                                    onChanged: (value) {
                                      widget.vm.model.chronicIllness = value;
                                    },
                                    title: lang('asdasd'),
                                    icon: Icons.local_hospital,
                                  ),
                                  KzTextEditMultiLine(
                                    controller: widget.vm.description,
                                    labelText: LocaleKeys.pageHealthProcess_explanation.tr(),
                                    isRequired: false,
                                    maxLines: 3,
                                    icon: Icons.description,
                                    onSaved: (value) {
                                      widget.vm.model.description = value;
                                    },
                                  ),
                                  ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: widget.vm.modelDetail.length,
                                    itemBuilder: (context, index) => medicamentItem(context, index),
                                  ),
                                  SafeArea(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 10)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TextButton(
                                              style: ButtonStyle(
                                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
                                                  backgroundColor: MaterialStateProperty.all(Color(0xff6551A0))),
                                              onPressed: () {
                                                widget.vm.addAnotherMedicament();
                                              },
                                              child: Text(
                                                LocaleKeys.pageHealthProcess_add_another_drug.tr(),
                                                style: context.textTheme.bodyMedium,
                                              )),
                                          TextButton(
                                              style: ButtonStyle(
                                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
                                                  backgroundColor: MaterialStateProperty.all(Color(0xff6551A0))),
                                              onPressed: () {},
                                              child: Text(
                                                LocaleKeys.pageHealthProcess_save.tr(),
                                                style: context.textTheme.bodyMedium,
                                              )),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector boxitem(StudentModel item, BuildContext context) {
    String kidsName = item.nameSurname ?? '';
    if (!kidsName.contains("\n")) {
      String kidsLastName = kidsName.split(" ").last;
      item.nameSurname = kidsName.replaceFirst(kidsLastName, "\n" + kidsLastName);
    }
    return GestureDetector(
      onTap: () async {
        widget.vm.selectedStudent = item;
        widget.vm.fields = [];
        widget.vm.fields.add(Field(
          fieldName: "du.OgrenciId",
          fieldOperator: "eq",
          fieldValue: item.id.toString(),
        ));
        await widget.vm.get();
        setState(() {});
      },
      child: Wrap(
        children: [
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.white, boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)], borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
            child: Column(
              children: [
                SizedBox(
                  height: MyBlock.vertical(context),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 1, blurRadius: 3)],
                    shape: BoxShape.circle,
                    color: item.gender == 2 ? Color(0xffF19BC3) : Color(0xff78C0FF),
                  ),
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
                        item.nameSurname ?? '',
                        style: context.textTheme.bodyMedium,
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

  Widget medicamentItem(BuildContext context, int index) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: MyBlock.vertical(context, x: 1)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2), vertical: MyBlock.vertical(context, x: 2)),
                decoration: BoxDecoration(
                    color: Colors.white, boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)], borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 5))),
                child: Column(
                  children: [
                    KzTextEdit(
                      controller: TextEditingController(),
                      labelText: LocaleKeys.pageHealthProcess_drug_name.tr(),
                      icon: Icons.dangerous_sharp,
                      onSaved: (value) {
                        widget.vm.modelDetail[index].medicamentName = value;
                      },
                    ),
                    KzTextEdit(
                      controller: TextEditingController(),
                      labelText: LocaleKeys.pageHealthProcess_dose.tr(),
                      icon: Icons.dangerous_sharp,
                      onSaved: (value) {
                        widget.vm.modelDetail[index].dose = value;
                      },
                    ),
                    KzTextEdit(
                      controller: TextEditingController(),
                      labelText: LocaleKeys.pageHealthProcess_time_range.tr(),
                      icon: Icons.dangerous_sharp,
                      inputType: TextInputType.number,
                      onSaved: (value) {
                        widget.vm.modelDetail[index].timeRange = value!.toInt();
                      },
                    ),
                    KzDateTime(
                      controller: TextEditingController(),
                      labelText: LocaleKeys.pageHealthProcess_start_date.tr(),
                      isRequired: true,
                      endDate: DateTime.now().add(const Duration(days: 3650)),
                      onSaved: (value) {
                        widget.vm.modelDetail[index].medicamentStartTime = value!.toDateTime();
                      },
                    ),
                    KzDateTime(
                      controller: TextEditingController(),
                      labelText: LocaleKeys.pageHealthProcess_end_date.tr(),
                      isRequired: true,
                      endDate: DateTime.now().add(const Duration(days: 3650)),
                      onSaved: (value) {
                        widget.vm.modelDetail[index].medicamentEndTime = value!.toDateTime();
                      },
                    ),
                    KzTextEdit(
                      controller: TextEditingController(),
                      labelText: LocaleKeys.pageHealthProcess_explanation.tr(),
                      icon: Icons.dangerous_sharp,
                      onSaved: (value) {
                        widget.vm.modelDetail[index].description = value;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.9, 0),
              child: Container(
                decoration: BoxDecoration(color: Color(0xff6551A0), shape: BoxShape.circle),
                width: MyBlock.vertical(context, x: 2),
                height: MyBlock.vertical(context, x: 2),
                child: Center(
                    child: FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          (index + 1).toString(),
                          style: context.textTheme.bodyMedium,
                        ))),
              ),
            )
          ],
        ),
        SizedBox(
          height: MyBlock.vertical(context),
        ),
      ],
    );
  }
}
