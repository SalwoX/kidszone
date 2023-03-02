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

class PageProfileOtherOptions extends StatefulWidget {
  final String title = LocaleKeys.pageProfileOtherOptions_other_transactions;

  PageProfileOtherOptions({Key? key}) : super(key: key);

  @override
  _PageProfileOtherOptionsState createState() => _PageProfileOtherOptionsState();
}

class _PageProfileOtherOptionsState extends State<PageProfileOtherOptions> with LoggerMixin {
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
                  widget.title.tr(),
                  style: context.textTheme.displayLarge,
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
              title: LocaleKeys.condition_settings.tr(),
              icons: Icons.person_add_alt_1_rounded,
              svg: profile_registration_process_icon,
              onTap: () {
                resolve<AppRouter>().push(RoutesSettings());
              },
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileOtherOptions_birthday.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {},
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileOtherOptions_usage_information.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {},
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileOtherOptions_logged_users.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {},
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileOtherOptions_tech_support.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {},
              context: context,
            ),
            profileMenuItems(
                title: "Yemek Listesi", //lokalizasyon yapılacak
                context: context,
                icons: Icons.food_bank_outlined,
                onTap: () {
                  resolve<AppRouter>().push(RouteFoodList());
                }),
            profileMenuItems(
              title: LocaleKeys.pageProfileOtherOptions_group_defination.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {},
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileOtherOptions_class_list.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {
                resolve<AppRouter>().push(RouteClassroom());
              },
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileOtherOptions_service_list.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {
                resolve<AppRouter>().push(RouteSchoolBus());
              },
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileOtherOptions_school_transactions.tr(),
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
