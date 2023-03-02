import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../common/infrastructure/work_context.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../register.dart';
import '../../../_init/components/appbar/custom_appbar.dart';
import '../../../_init/components/widgets/bottom_navigation_bar.dart';
import '../../../_init/components/widgets/widgets.dart';
import '../../../_init/logger/logger_mixin.dart';
import '../../../_init/router/app_router.dart';
import 'package:nb_utils/nb_utils.dart';
/* import 'package:kidszone_app/imports/import_pages.dart' as pages;
import 'package:kidszone_app/imports/import_common.dart' as core; */

class PageProfile extends StatefulWidget {
  final String title = LocaleKeys.pageProfile_profile.tr();
  PageProfile({Key? key}) : super(key: key);

  @override
  _PageProfileState createState() => _PageProfileState();
}

class _PageProfileState extends State<PageProfile> with LoggerMixin {
  int currentIndexPage = 4;


  @override
  void initState() {
    super.initState();
    currentIndexPage = 4;
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
                ),
              ],
              //title: "Profil",
              //subTitle: "",
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
              title: LocaleKeys.pageProfile_registration_transactions.tr(),
              icons: Icons.add_to_drive_outlined,
              onTap: () {
                resolve<AppRouter>().push(RouteProfileRegistrationProcess());
              },
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfile_education_transactions.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {
                resolve<AppRouter>().push(RouteProfileEducationProcess());
              },
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfile_program_transactions.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {},
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfile_accountings_process.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {
                resolve<AppRouter>().push(RouteProfileAccounting());
              },
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfile_health_transactions.tr(),
              icons: Icons.local_hospital,
              onTap: () {
                resolve<AppRouter>().push(RouteHealthProcess());
              },
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfile_other_transactions.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {
                resolve<AppRouter>().push(RouteProfileOtherOptions());
              },
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfile_theme_transactions.tr(),
              icons: Icons.supervised_user_circle_sharp,
              context: context,
              onTap: () {},
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfile_sign_out.tr(),
              icons: Icons.exit_to_app,
              onTap: () {
                WorkContext().deleteUser();
                resolve<AppRouter>().replace(Default());
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
