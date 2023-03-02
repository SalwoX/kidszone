import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../generated/locale_keys.g.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../register.dart';
import '../../../_init/components/appbar/custom_appbar.dart';
import '../../../_init/components/button/save_button_model.dart';
import '../../../_init/components/dropdown/kz_dropdown.dart';
import '../../../_init/components/input/kz_edit_widgets.dart';
import '../../../_init/my_block.dart';
import '../../../_init/router/app_router.dart';
import '../../../_init/themes/colors.dart';
import '../model/daily_report_template_detail_model.dart';
import '../model/reports.dart';
import '../viewmodel/view_model_daily_report.dart';

// ignore: must_be_immutable
class PageDailyReport extends StatefulWidget {
  PageDailyReport({Key? key, this.reports}) : super(key: key);

  List<Reports>? reports;

  ViewModelDailyReport vm = ViewModelDailyReport();

  @override
  State<PageDailyReport> createState() => _PageDailyReportState();
}

class _PageDailyReportState extends State<PageDailyReport> {
  @override
  void initState() {
    super.initState();
    if (widget.reports == null) {
      widget.reports = widget.vm.reports;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SaveButtonModal(
        buttons: [
          SaveModalButton(
            icon: Icons.save,
            text: LocaleKeys.pageDailyReport_save.tr(),
          )
        ],
        title: LocaleKeys.pageDailyReport_daily_report_transactions.tr(),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            CustomAppBar(
              innerBoxIsScrolled,
              headerWidgets: [
                Text(widget.vm.page_title,
                    style: context.textTheme.displayLarge),
              ],
              iconButton: [
                SaveButtonModal(buttons: [
                  SaveModalButton(
                    icon: Icons.save,
                    text: LocaleKeys.pageDailyReport_edit_report.tr(),
                    onTab: () => resolve<AppRouter>().push(
                      RouteEditReport(),
                    ),
                  ),
                  SaveModalButton(
                      icon: Icons.save,
                      text: LocaleKeys.pageDailyReport_show_student_list.tr()),
                  SaveModalButton(
                      icon: Icons.save,
                      text: LocaleKeys.pageDailyReport_add_food_list.tr())
                ], title: LocaleKeys.pageDailyReport_choose_transaction.tr()),
              ],
              isBackButton: true,
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  KzTextEdit(
                    icon: Icons.list,
                    controller: TextEditingController(),
                    labelText: LocaleKeys.pageDailyReport_teacher_note.tr(),
                    onSaved: (value) {
                      widget.vm.model.teacherNote = value;
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: MyBlock.vertical(context, x: 2.5),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: MyBlock.horizontal(context, x: 3)),
                            child: Container(
                              padding: EdgeInsets.all(
                                  MyBlock.horizontal(context, x: 2)),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        spreadRadius: 2,
                                        blurRadius: 5)
                                  ],
                                  borderRadius: BorderRadius.circular(
                                      MyBlock.horizontal(context, x: 7))),
                              child: Column(
                                children: itemDailyReport(context),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: MyBlock.vertical(context, x: 5),
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff65539E)),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    MyBlock.horizontal(context, x: 3))),
                            padding: EdgeInsets.all(
                                MyBlock.horizontal(context, x: 1.5)),
                            child: Text(
                              LocaleKeys.condition_daily_report.tr(),
                              style: context.textTheme.bodyMedium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Stack(children: [
                    Column(
                      children: [
                        SizedBox(
                          height: MyBlock.vertical(context, x: 2.5),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MyBlock.horizontal(context, x: 3)),
                          child: Container(
                            padding: EdgeInsets.all(
                                MyBlock.horizontal(context, x: 2)),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      spreadRadius: 2,
                                      blurRadius: 5)
                                ],
                                borderRadius: BorderRadius.circular(
                                    MyBlock.horizontal(context, x: 7))),
                            child: Column(
                              children: itemEducationReport(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: MyBlock.vertical(context, x: 5),
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff65539E)),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  MyBlock.horizontal(context, x: 3))),
                          padding: EdgeInsets.all(
                              MyBlock.horizontal(context, x: 1.5)),
                          child: Text(
                            LocaleKeys.pageDailyReport_education_report.tr(),
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  itemEducationReport(BuildContext context) {
    var widgetList = <Widget>[];
    widget.reports!
        .where((e) => e.reportType == ReportType.education)
        .forEach((item) {
      if (item.contentType == ContentType.haveOptions) {
        widgetList.add(
          KzDropDown(
            title: item.title!,
            value: item.value,
            list: item.options!
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: context.textTheme.labelMedium,
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                item.value = value!;
              });
            },
          ),
        );
      } else {
        widgetList.add(KzTextEdit(
            controller: TextEditingController(),
            labelText: item.title!,
            onSaved: (value) {
              item.value = value;
            }));
      }
    });
    return widgetList;
  }

  itemDailyReport(BuildContext context) {
    var widgetList = <Widget>[];
    widget.reports!
        .where((e) => e.reportType == ReportType.daily)
        .forEach((item) {
      if (item.contentType == ContentType.haveOptions) {
        widgetList.add(
          KzDropDown(
            title: item.title!,
            value: item.value,
            list: item.options!
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: context.textTheme.labelMedium,
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                item.value = value!;
              });
            },
          ),
        );
      } else {
        widgetList.add(KzTextEdit(
            controller: TextEditingController(),
            labelText: item.title!,
            onSaved: (value) {
              item.value = value;
            }));
      }
    });
    return widgetList;
  }
}
