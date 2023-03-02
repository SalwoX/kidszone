import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../../presentation/themes/icons.dart';
import '../../../../register.dart';
import '../../../_init/components/appbar/custom_appbar.dart';
import '../../../_init/components/widgets/bottom_navigation_bar.dart';
import '../../../_init/components/widgets/widgets.dart';
import '../../../_init/logger/logger_mixin.dart';
import '../../../_init/router/app_router.dart';

/* import 'package:kidszone_app/imports/import_pages.dart' as pages;
import 'package:kidszone_app/imports/import_themes.dart' as themes; */

class PageProfileRegistrationProcess extends StatefulWidget {
  final String title = LocaleKeys.pageProfileRegistrationProcess_registration_transactions.tr();

  PageProfileRegistrationProcess({Key? key}) : super(key: key);

  @override
  _PageProfileRegistrationProcessState createState() => _PageProfileRegistrationProcessState();
}

class _PageProfileRegistrationProcessState extends State<PageProfileRegistrationProcess> with LoggerMixin {
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
                  style: context.textTheme.displayLarge,
                )
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
              title: LocaleKeys.pageProfileRegistrationProcess_pre_registration.tr(),
              icons: Icons.person_add_alt_1_rounded,
              svg: profile_registration_process_icon,
              onTap: () {
                resolve<AppRouter>().push(
                  RoutePreregistration(),
                );
              },
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileRegistrationProcess_student_list.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {
                resolve<AppRouter>().push(
                  RouteStudent(),
                );
              },
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileRegistrationProcess_teacher_list.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {
                resolve<AppRouter>().push(RouteTeacher());
              },
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileRegistrationProcess_parent_list.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {
                resolve<AppRouter>().push(RouteParent());
              },
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileRegistrationProcess_lesson_list.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {
                resolve<AppRouter>().push(RouteLesson());
              },
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileRegistrationProcess_admin_list.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {
                resolve<AppRouter>().push(RouteExecutive());
              },
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileRegistrationProcess_class_list.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {
                resolve<AppRouter>().push(RouteClassroom());
              },
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileRegistrationProcess_service_list.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {
                resolve<AppRouter>().push(RouteSchoolBus());
              },
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileRegistrationProcess_school_transactions.tr(),
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
