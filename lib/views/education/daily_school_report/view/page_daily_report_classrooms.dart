import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../common/Infrastructure/work_context.dart';
import '../../../../common/utils/enums.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../_init/components/appbar/custom_appbar.dart';
import '../../../_init/components/widgets/bottom_navigation_bar.dart';
import '../../../_init/error/page_error.dart';
import '../../../_init/logger/logger_mixin.dart';
import '../../../_init/my_block.dart';
import '../../../_init/themes/colors.dart';
import '../../../_init/view_model/base_view_model.dart';
import '../../../registration/class_room/model/classroom_model.dart';
import '../viewmodel/view_model_daily_report_classrooms.dart';

// ignore: must_be_immutable
class PageDailyReportClassrooms extends StatefulWidget {
  final String title = LocaleKeys.condition_classes.tr();
  final String subTitle = "";
  var vm = ViewModelDailyReportClassrooms();



  PageDailyReportClassrooms({super.key});

  @override
  State<PageDailyReportClassrooms> createState() => _PageDailyReportClassroomsState();
}

class _PageDailyReportClassroomsState extends State<PageDailyReportClassrooms> with LoggerMixin {
  @override
  void initState() {
    super.initState();
    widget.vm.upload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            CustomAppBar(
              innerBoxIsScrolled,
              appbarHeight: MyBlock.vertical(context, x: 6),
              headerWidgets: [
                Text(
                  WorkContext.nameSurname,
                  style: context.textTheme.displayLarge,
                ),
                Text(
                  widget.vm.page_title,
                  style: context.textTheme.displaySmall,
                ),
              ],
            ),
          ];
        },
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
          color: appLayout_background,
          child: Container(
            padding: EdgeInsets.all(0),
            child: Observer(builder: (_) {
              switch (widget.vm.Status) {
                case PageState.LOADING:
                  return Center(child: CircularProgressIndicator());
                case PageState.SUCCESS:
                  return refreshIndicator(context);
                case PageState.ERROR:
                  return PageError(
                      exception: widget.vm.exception,
                      function: () {
                        widget.vm.reload();
                      });
                default:
                  return SizedBox();
              }
            }),
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(
        context: context,
        index: 0,
      ),
    );
  }

  RefreshIndicator refreshIndicator(BuildContext context) {
    return RefreshIndicator(
      child: listViewBuilder(context),
      onRefresh: () {
        widget.vm.reload();
        return Future.value(false);
      },
    );
  }

  ListView listViewBuilder(BuildContext context) {
    return ListView.builder(
      controller: widget.vm.scrollController,
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: MyBlock.vertical(context, x: 1), bottom: MyBlock.vertical(context, x: 12)),
      shrinkWrap: true,
      itemBuilder: itemBuilder,
      itemCount: widget.vm.model.length + 1,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    if (index == widget.vm.model.length && widget.vm.lastRegistration == false) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (index == widget.vm.model.length && widget.vm.lastRegistration) {
      return Container();
    }
    return _noticeItem(context, index, widget.vm.model);
  }

  Widget _noticeItem(BuildContext context, int index, List<ClassroomModel> _models) {
    var item = _models[index];
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3)),
            child: ExpansionTile(
              title: Text(
                item.name ?? "",
                style: context.textTheme.headlineSmall,
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(MyBlock.horizontal(context, x: 3.2)),
                  child: Container(
                    child: Text(
                      item.classTour == ClassTypeEnum.classroom.getId() ? ClassTypeEnum.classroom.getDescription() : ClassTypeEnum.study.getDescription(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: MyBlock.vertical(context, x: 0.5),
        )
      ],
    );
  }
}
