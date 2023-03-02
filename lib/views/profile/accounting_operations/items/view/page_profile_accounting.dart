import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../core/extension/context_extension.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../../register.dart';
import '../../../../_init/components/appbar/custom_appbar.dart';
import '../../../../_init/components/widgets/bottom_navigation_bar.dart';
import '../../../../_init/components/widgets/widgets.dart';
import '../../../../_init/router/app_router.dart';

class PageProfileAccounting extends StatefulWidget {
  const PageProfileAccounting({Key? key}) : super(key: key);

  @override
  _PageProfileAccountingState createState() => _PageProfileAccountingState();
}

class _PageProfileAccountingState extends State<PageProfileAccounting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            CustomAppBar(
              innerBoxIsScrolled,
              headerWidgets: [
                Text(
                  LocaleKeys.pageProfileAccountingProcess_accounting_transactions.tr(),
                  style: context.textTheme.displayLarge,
                ),
              ],
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
              title: LocaleKeys.pageProfileAccountingProcess_student_accounting.tr(),
              context: context,
              icons: Icons.person_add_alt_1,
              onTap: () => resolve<AppRouter>().push(RouteStudentAccounting()),
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileAccountingProcess_show_payment.tr(),
              context: context,
              icons: Icons.credit_card,
              onTap: () => resolve<AppRouter>().push(RouteShowPayments()),
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileAccountingProcess_accounting_statistics.tr(),
              context: context,
              icons: Icons.auto_graph,
              onTap: () => resolve<AppRouter>().push(RouteAccountingStatistics()),
            ),
            profileMenuItems(
              title: "Öğrenci Muhasebe Kaydı",
              context: context,
              icons: Icons.person_add_alt_1,
              onTap: () => resolve<AppRouter>().push(RouteRegistrationAccounting()),
            ),
          ],
          staggeredTiles: [StaggeredTile.extent(1, 150), StaggeredTile.extent(1, 150), StaggeredTile.extent(1, 150)],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(
        context: context,
        index: 4,
      ),
    );
  }
}

/*
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kidszone_app/generated/locale_keys.g.dart';
import 'package:kidszone_app/presentation/themes/colors.dart';
import 'package:kidszone_app/presentation/themes/constants.dart';
import 'package:kidszone_app/register.dart';
import 'package:kidszone_app/views/_init/components/appbar/custom_appbar.dart';
import 'package:kidszone_app/views/_init/components/widgets/bottom_navigation_bar.dart';
import 'package:kidszone_app/views/_init/logger/logger_mixin.dart';
import 'package:kidszone_app/views/_init/router/app_router.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:kidszone_app/views/_init/components/widgets/widgets.dart';
import '../../../_init/themes/icons.dart';
/* import 'package:kidszone_app/imports/import_pages.dart' as pages;
import 'package:kidszone_app/imports/import_themes.dart' as themes; */

class PageProfileAccountingProcess extends StatefulWidget {
  final String title = LocaleKeys.pageProfileAccountingProcess_accounting_transactions.tr();

  PageProfileAccountingProcess({Key? key}) : super(key: key);

  @override
  _PageProfileAccountingProcessState createState() => _PageProfileAccountingProcessState();
}

class _PageProfileAccountingProcessState extends State<PageProfileAccountingProcess> with LoggerMixin {
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
                  style: context.textTheme.bodyMedium,
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
              title: LocaleKeys.pageProfileAccountingProcess_student_accounting.tr(),
              icons: Icons.person_add_alt_1_rounded,
              svg: profilim_kayit_islemleri,
              onTap: () {
                resolve<AppRouter>().push(RoutesSettings());
              },
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileAccountingProcess_show_payment.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {},
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.pageProfileAccountingProcess_accounting_statistics.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {},
              context: context,
            ),
            profileMenuItems(
              title: LocaleKeys.condition_settings.tr(),
              icons: Icons.supervised_user_circle_sharp,
              onTap: () {},
              context: context,
            ),
          ],
          staggeredTiles: [
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
*/
