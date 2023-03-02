// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kidszone_app/generated/locale_keys.g.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../education/daily_school_report/model/daily_report_template_detail_model.dart';
import '../../../education/daily_school_report/model/reports.dart';
import '../../../education/daily_school_report/viewmodel/view_model_edit_report.dart';
import '../../my_block.dart';
import '../../themes/colors.dart';
import '../input/kz_edit_widgets.dart';
import '../toggle_button/kz_toggle_button.dart';

List<Widget> typesReport = <Widget>[
  Text(LocaleKeys.pageDailyReport_report_item_daily.tr()),
  Text(LocaleKeys.pageDailyReport_report_item_education.tr()),
];
List<Widget> typesContent = <Widget>[
  Text(LocaleKeys.pageDailyReport_report_item_optional.tr()),
  Text(LocaleKeys.pageDailyReport_report_item_written.tr()),
];

class ReportItem extends StatefulWidget {
  late Reports reportModel;
  final ViewModelEditReport vm;

  ReportItem({Key? key, required this.reportModel, required this.vm}) : super(key: key);

  final TextEditingController contentController = TextEditingController();

  final List<Widget> addedOpts = [];

  @override
  State<ReportItem> createState() => _ReportItemState();
}

class _ReportItemState extends State<ReportItem> {
  List<bool>? _selectedReportType;
  List<bool>? _selectedContentType;

  @override
  Widget build(BuildContext context) {
    optionsLoad();
    _selectedReportType = <bool>[widget.reportModel.reportType == ReportType.daily, widget.reportModel.reportType == ReportType.education];
    _selectedContentType = <bool>[widget.reportModel.contentType == ContentType.haveOptions, widget.reportModel.contentType == ContentType.haveWritten];
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MyBlock.horizontal(context, x: 4),
            vertical: MyBlock.vertical(context, x: 1.5),
          ),
          child: Container(
            padding: EdgeInsets.all(MyBlock.horizontal(context, x: 3)),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)],
              borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    KzToggleButton(
                      isSelected: _selectedReportType!,
                      children: typesReport,
                      onPressed: (int index) {
                        setState(() {
                          for (int i = 0; i < _selectedReportType!.length; i++) {
                            _selectedReportType![i] = i == index;
                          }
                        });
                        widget.reportModel.reportType = index == 0 ? ReportType.daily : ReportType.education;
                      },
                    ),
                    KzToggleButton(
                      isSelected: _selectedContentType!,
                      children: typesContent,
                      onPressed: (int index) {
                        setState(() {
                          for (int i = 0; i < _selectedContentType!.length; i++) {
                            _selectedContentType![i] = i == index;
                          }
                        });
                        widget.reportModel.contentType = index == 0 ? ContentType.haveOptions : ContentType.haveWritten;
                      },
                    ),
                  ],
                ),
                KzTextEdit(
                  icon: Icons.info_outline,
                  controller: TextEditingController(text: widget.reportModel.title),
                  labelText: LocaleKeys.pageDailyReport_report_item_title.tr(),
                  onSaved: (value) {
                    widget.reportModel.title = value;
                  },
                  onChanged: (value) {
                    widget.reportModel.title = value;
                  },
                ),
                Visibility(
                  child: Column(
                    children: [
                      KzTextEdit(
                        icon: Icons.widgets_outlined,
                        controller: widget.contentController,
                        labelText: LocaleKeys.pageDailyReport_report_item_options.tr(),
                        suffixIcon: GestureDetector(
                          child: Icon(Icons.add),
                          onTap: () {
                            setState(() {
                              widget.reportModel.options?.add(widget.contentController.text.toString());
                            });
                          },
                        ),
                        onSaved: (value) {},
                      ),
                    ],
                  ),
                  visible: _selectedContentType![0],
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: widget.addedOpts,
                    ))
              ],
            ),
          ),
        ),
        Center(
          heightFactor: 0.4,
          widthFactor: 1.55,
          child: Container(
            height: MyBlock.vertical(context, x: 8),
            width: MyBlock.horizontal(context, x: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.vm.reports.first != widget.reportModel
                    ? GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle, color: ThemeColors.mainPurple),
                          child: Padding(
                            padding: const EdgeInsets.all(0.5),
                            child: Icon(
                              Icons.arrow_upward_rounded,
                              color: ThemeColors.white,
                            ),
                          ),
                        ),
                        onTap: () {
                          var dataRowNumber = widget.reportModel.rowNumber;
                          int newInt = widget.vm.reports.indexOf(widget.vm.reports.firstWhere((e) => e.rowNumber == dataRowNumber)) - 1;
                          widget.vm.reports.remove(widget.vm.reports.firstWhere((e) => e.rowNumber == dataRowNumber));
                          widget.vm.reports.insert(newInt, widget.reportModel);
                          var say = 1;
                          widget.vm.reports.forEach((e) {
                            e.rowNumber = say++;
                          });
                        },
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: ThemeColors.mainPurple.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(0.5),
                        child: Icon(
                          Icons.arrow_upward_rounded,
                          color: ThemeColors.white.withOpacity(0.7),
                        ),
                      ),
                Container(
                  decoration: BoxDecoration(
                    color: ThemeColors.mainPurple,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(MyBlock.horizontal(context, x: 2)),
                    child: Text(
                      widget.reportModel.rowNumber.toString(),
                      style: context.textTheme.displayLarge!.copyWith(
                        inherit: true,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                widget.vm.reports.last != widget.reportModel
                    ? GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(color: ThemeColors.mainPurple, shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(0.5),
                            child: Icon(
                              Icons.arrow_downward_rounded,
                              color: ThemeColors.white,
                            ),
                          ),
                        ),
                        onTap: () {
                          var dataRowNumber = widget.reportModel.rowNumber;
                          int newInt = widget.vm.reports.indexOf(widget.vm.reports.firstWhere((e) => e.rowNumber == dataRowNumber)) + 1;
                          widget.vm.reports.remove(widget.vm.reports.firstWhere((e) => e.rowNumber == dataRowNumber));
                          widget.vm.reports.insert(newInt, widget.reportModel);
                          var say = 1;
                          widget.vm.reports.forEach((e) {
                            e.rowNumber = say++;
                          });
                        },
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: ThemeColors.mainPurple.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(0.5),
                        child: Icon(
                          Icons.arrow_downward_rounded,
                          color: ThemeColors.white.withOpacity(0.7),
                        ),
                      ),
              ],
            ),
          ),
        )
      ],
    );
  }

  optItem(String item) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(1.5),
            decoration: BoxDecoration(
              color: ThemeColors.mainPurple,
              borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 2)),
            ),
            child: Row(
              children: [
                Text(
                  item,
                  style: context.textTheme.displaySmall,
                ),
                SizedBox(width: 3.0),
                GestureDetector(
                  child: Icon(
                    size: MyBlock.vertical(context, x: 2),
                    Icons.highlight_remove_outlined,
                    color: ThemeColors.darkWhite,
                  ),
                  onTap: () {
                    setState(() {
                      widget.reportModel.options?.remove(item);
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void optionsLoad() {
    widget.addedOpts.clear();
    widget.reportModel.options?.forEach((element) {
      widget.addedOpts.add(
        optItem(element),
      );
    });
  }
}
