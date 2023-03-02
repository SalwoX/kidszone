import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../register.dart';
import '../../router/app_router.dart';

Widget bottomNavigationBar({required BuildContext context, List<Widget>? widgetList, ValueChanged<int>? onTap, required int index}) {
  // return CurvedNavigationBar(
  //   backgroundColor: Colors.white,
  //   height: appNavigationBarHeight,
  //   index: index,
  //   //buttonBackgroundColor: Colors.black,
  //   color: ThemeColors.purple,
  //   items: widgetList != null
  //       ? widgetList
  //       : [
  //           Icon(
  //             Icons.home,
  //             size: 20,
  //             color: Colors.white,
  //           ),
  //           Icon(
  //             Icons.add,
  //             size: 20,
  //             color: Colors.white,
  //           ),
  //           Icon(
  //             Icons.send,
  //             size: 20,
  //             color: Colors.white,
  //           ),
  //           Icon(
  //             Icons.list,
  //             size: 20,
  //             color: Colors.white,
  //           ),
  //           Icon(
  //             Icons.account_circle,
  //             size: 20,
  //             color: Colors.white,
  //           ),
  //         ],
  //   onTap: onTap != null
  //       ? onTap
  //       : (index) {
  //           //Handle button tap
  //           if (index == 0) {
  //             resolve<AppRouter>().push(RouteNoticeView());
  //           } else if (index == 2) {
  //             resolve<AppRouter>().push(RouteMessages());
  //             // Navigator.pushReplacement(
  //             //   context,
  //             //   FadeInRoute(
  //             //     routeName: PageMessages.tag,
  //             //     page: PageMessages(),
  //             //   ),
  //             // );
  //           } else if (index == 3) {
  //             resolve<AppRouter>().push(RouteSocialNetworkLayout());
  //             /*  Navigator.pushReplacement(
  //               context,
  //               FadeInRoute(
  //                 routeName: pages.PageGunlukKarne.tag,
  //                 page: pages.PageGunlukKarne(),
  //               ),
  //             );*/
  //           } else if (index == 4) {
  //             resolve<AppRouter>().push(MainProfile());
  //           }
  //         },
  // );
  return GNav(
    rippleColor: Colors.red,
    hoverColor: Colors.grey[100]!,
    gap: 8,
    activeColor: Colors.black,
    backgroundColor: context.theme.bottomAppBarColor,
    iconSize: 20,
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    duration: Duration(milliseconds: 400),
    tabBackgroundColor: Colors.white,
    color: Colors.black,
    tabs: [
      GButton(
        icon: LineIcons.home,
        text: 'Duyurular',
        textSize: context.theme.textTheme.bodyText1!.fontSize!,
      ),
      GButton(
        icon: LineIcons.heart,
        text: '???',
        textSize: context.theme.textTheme.bodyText1!.fontSize!,
      ),
      GButton(
        icon: Icons.message_outlined,
        text: 'Mesaj',
        textSize: context.theme.textTheme.bodyText1!.fontSize!,
      ),
      GButton(
        icon: Icons.social_distance_outlined,
        text: 'Sosyal Ağ',
        textSize: context.theme.textTheme.bodyText1!.fontSize!,
      ),
      GButton(
        icon: LineIcons.user,
        text: 'Profil',
        textSize: context.theme.textTheme.bodyText1!.fontSize!,
      ),
    ],
    selectedIndex: index,
    onTabChange: (index) {
      if (index == 0) {
        resolve<AppRouter>().push(RouteNoticeView());
      } else if (index == 2) {
        resolve<AppRouter>().push(RouteMessages());
        // Navigator.pushReplacement(
        //   context,
        //   FadeInRoute(
        //     routeName: PageMessages.tag,
        //     page: PageMessages(),
        //   ),
        // );
      } else if (index == 3) {
        resolve<AppRouter>().push(RouteSocialNetworkLayout());
        /*  Navigator.pushReplacement(
                context,
                FadeInRoute(
                  routeName: pages.PageGunlukKarne.tag,
                  page: pages.PageGunlukKarne(),
                ),
              );*/
      } else if (index == 4) {
        resolve<AppRouter>().push(MainProfile());
      }
    },
  );
}
