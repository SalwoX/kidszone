import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../../register.dart';
import '../../../_init/components/appbar/custom_appbar.dart';
import '../../../_init/components/widgets/bottom_navigation_bar.dart';
import '../../../_init/components/widgets/widgets.dart';
import '../../../_init/logger/logger_mixin.dart';
import '../../../_init/router/app_router.dart';
import '../../../_init/themes/icons.dart';

class PageProfileEducationProcess extends StatefulWidget {
  final String title =
      LocaleKeys.pageProfileEducationProcess_education_transactions.tr();

  PageProfileEducationProcess({Key? key}) : super(key: key);

  @override
  _PageProfileEducationProcessState createState() =>
      _PageProfileEducationProcessState();
}

class _PageProfileEducationProcessState
    extends State<PageProfileEducationProcess> with LoggerMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            CustomAppBar(
              innerBoxIsScrolled,
              headerWidgets: [
                Text(
                  widget.title,
                  style: context.textTheme.headlineMedium,
                ),
              ],
              //title: "Kayıt İşlemleri",
              //subTitle: "",
              isBackButton: true,
            ),
          ];
        },
        body: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          children: [
            profileMenuItems(
              title: LocaleKeys.pageProfileEducationProcess_daily_school_report
                  .tr(),
              icons: Icons.person_add_alt_1_rounded,
              svg: profilim_kayit_islemleri,
              onTap: () {
                resolve<AppRouter>().push(RouteDailyReport()); // daily report
              },
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys
                  .pageProfileEducationProcess_daily_school_report_template
                  .tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {}, //PageGunlukKarneSablon.tag,
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileEducationProcess_teacher_list.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {
                resolve<AppRouter>().push(RouteTeacher());
              },
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileEducationProcess_parent_list.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {
                resolve<AppRouter>().push(RouteParent());
              },
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileEducationProcess_lesson_list.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {
                resolve<AppRouter>().push(RouteLesson());
              },
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileEducationProcess_admin_list.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {
                resolve<AppRouter>().push(RouteExecutive());
              },
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileEducationProcess_class_list.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {
                resolve<AppRouter>().push(RouteClassroom());
              },
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileEducationProcess_service_list.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {
                resolve<AppRouter>().push(RouteSchoolBus());
              },
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileEducationProcess_school_transactions
                  .tr(),
              icons: Icons.admin_panel_settings,
              onTap: () {
                resolve<AppRouter>().push(RouteProfileSchoolProcess());
              },
              context: context,
            ),
          ],
          staggeredTiles: [
            StaggeredTile.extent(1, 150),
            StaggeredTile.extent(1, 150),
            StaggeredTile.extent(1, 150),
            StaggeredTile.extent(1, 150),
            StaggeredTile.extent(1, 150),
            StaggeredTile.extent(1, 150),
            StaggeredTile.extent(1, 150),
            StaggeredTile.extent(1, 150),
            StaggeredTile.extent(2, 150),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(
        context: context,
        index: 4,
      ),
    );
  }
}
