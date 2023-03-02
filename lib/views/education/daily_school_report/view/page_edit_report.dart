import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../generated/locale_keys.g.dart';
import 'package:mobx/mobx.dart';

import '../../../../register.dart';
import '../../../_init/components/appbar/custom_appbar.dart';
import '../../../_init/components/report_item/report_item.dart';
import '../../../_init/router/app_router.dart';
import '../../../_init/themes/colors.dart';
import '../model/daily_report_template_detail_model.dart';
import '../model/reports.dart';
import '../viewmodel/view_model_edit_report.dart';

class PageEditReport extends StatefulWidget {
  final ViewModelEditReport vm = ViewModelEditReport();

  PageEditReport({Key? key}) : super(key: key);

  @override
  State<PageEditReport> createState() => _PageEditReportState();
}

class _PageEditReportState extends State<PageEditReport> {
  @override
  void initState() {
    super.initState();
    if (widget.vm.reports.isEmpty) {
      widget.vm.reports = ObservableList<Reports>.of([
        Reports(),
      ]);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
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
              isBackButton: true, // geçici
            ),
          ];
        },
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Observer(
            builder: (_) {
              return Column(
                children: [
                  SizedBox(
                    height: 15.0,
                  ),
                  Column(
                    children: widget.vm.reports
                        .map((e) => ReportItem(
                              reportModel: e,
                              vm: widget.vm,
                            ))
                        .toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            widget.vm.reports.add(Reports(
                              title: "",
                              contentType: ContentType.haveWritten,
                              reportType: ReportType.daily,
                              options: [],
                              rowNumber: widget.vm.reports.length + 1,
                            ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ThemeColors.darkPurple,
                                boxShadow: [
                                  BoxShadow(
                                    color: ThemeColors.textLight,
                                    spreadRadius: 0.14,
                                    offset: Offset(1.5, 1),
                                    blurRadius: 1,
                                  )
                                ]),
                            child: Icon(
                              Icons.add,
                              size: 37.5,
                              color: ThemeColors.darkWhite,
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.check_outlined,
                            size: 37.5,
                            color: ThemeColors.mainPurple,
                          ),
                          onTap: () {
                            widget.vm.dailyReportSave();
                            resolve<AppRouter>().push(
                                RouteDailyReport(reports: widget.vm.reports));
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            widget.vm.reports.remove(widget.vm.reports.last);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: ThemeColors.darkPurple,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: ThemeColors.textLight,
                                  spreadRadius: 0.14,
                                  offset: Offset(1.5, 1),
                                  blurRadius: 1,
                                )
                              ],
                            ),
                            child: Icon(
                              Icons.remove,
                              size: 37.5,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
