import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../common/enums.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../register.dart';
import '../../../_init/components/appbar/custom_appbar.dart';
import '../../../_init/components/widgets/bottom_navigation_bar.dart';
import '../../../_init/components/widgets/widgets.dart';
import '../../../_init/logger/logger_mixin.dart';
import '../../../_init/router/app_router.dart';

/* import '../../import_pages.dart' as page;
import 'package:kidszone_app/imports/import_common.dart' as core;
 */
class PageProfileSchoolProcess extends StatefulWidget {
  final String title = LocaleKeys.pageProfileSchoolProcess_school_transactions.tr();

  PageProfileSchoolProcess({Key? key}) : super(key: key);

  @override
  _PageProfileSchoolProcessState createState() => _PageProfileSchoolProcessState();
}

class _PageProfileSchoolProcessState extends State<PageProfileSchoolProcess> with LoggerMixin {
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
              //title: "Okul İşlemleri",
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
              title: LocaleKeys.pageProfileSchoolProcess_school_list.tr(),
              icons: Icons.add_to_drive_outlined,
              onTap: () {
                resolve<AppRouter>().push(
                  RouteSchool(),
                );
              },
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileSchoolProcess_branch_list.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {
                resolve<AppRouter>().push(
                  RouteBranch(),
                );
              },
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileSchoolProcess_school_packet.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {
                resolve<AppRouter>().push(
                  RouteGroup(type: "1", title: "Okul Paket"),
                );
              },
              arguments: (Enums.getGroupTypes[GroupTypes.school_package]),
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileSchoolProcess_senior_manager.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {
                resolve<AppRouter>().push(
                  RouteAdmin(),
                );
              },
              context: context,
            ),
            profileMenuItems(
              title: "Cinsiyet", //! TODO: Çeviri
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {
                resolve<AppRouter>().push(
                  RouteGroup(type: "2", title: "Cinsiyet"),
                );
              },
              context: context,
            ),
            profileMenuItems(
              title: "Yetki Rolü", //! TODO: Çeviri
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {
                resolve<AppRouter>().push(
                  RouteGroup(type: "4", title: "Yetki Rolü"),
                );
              },
              context: context,
            ),
          ],
          staggeredTiles: [
            StaggeredTile.extent(1, 150),
            StaggeredTile.extent(1, 150),
            StaggeredTile.extent(2, 150),
            StaggeredTile.extent(1, 150),
            StaggeredTile.extent(1, 150),
            StaggeredTile.extent(1, 150),
            StaggeredTile.extent(1, 150),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(
        context: context,
        index: currentIndexPage,
      ),
    );
  }
}
