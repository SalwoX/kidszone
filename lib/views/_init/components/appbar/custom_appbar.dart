import 'package:flutter/material.dart';

import '../../../../common/Infrastructure/work_context.dart';
import '../../../../register.dart';
import '../../router/app_router.dart';
import '../../themes/colors.dart';

class CustomAppBar extends StatefulWidget {
  final Size preferredSize;
  final bool innerBoxIsScrolled;
  //final String title;
  //final String? subTitle;
  final List<Widget>? iconButton;
  final double? appbarHeight;
  final bool isBackButton;
  final List<Widget> headerWidgets;
  final PreferredSizeWidget? bottom;

  const CustomAppBar(
    this.innerBoxIsScrolled, {
    //required this.title,
    this.iconButton,
    //this.subTitle,
    required this.headerWidgets,
    this.appbarHeight,
    Key? key,
    this.isBackButton = false,
    this.bottom,
  })  : preferredSize = const Size.fromHeight(100.0),
        super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  Widget? subTitleWidget;

  @override
  Widget build(BuildContext context) {
    /* if (widget.subTitle != "") {
      subTitleWidget = Text(widget.subTitle??"",
          style: primaryTextStyle(
              color: ThemeColors.beyaz, size: 14, fontFamily: fontRegular));
    }*/

    return SliverAppBar(
      expandedHeight: 40,
      toolbarHeight: 35,
      floating: false,
      pinned: true,
      titleSpacing: 0,
      actions: widget.iconButton,
      automaticallyImplyLeading: false,
      backgroundColor: widget.innerBoxIsScrolled ? ThemeColors.purple : ThemeColors.purple,
      shape: ShapeBorder.lerp(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        null,
        0,
      ), //CustomShapeBorder(),
      elevation: 0,
      bottom: widget.bottom,
      leading: widget.isBackButton
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: ThemeColors.white,
                size: 16,
              ),
              onPressed: () => resolve<AppRouter>().pop(),
            )
          : null,
      title: Column(
        children: widget.headerWidgets,
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Container(
              height: 10,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topLeft,
                  colors: <Color>[
                    ThemeColors.purple,
                    appPalColor,
                  ],
                ),
              ),
            ),
            Visibility(
              visible: WorkContext.isDemo,
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.only(top: 45, right: 50),
                  child: Banner(
                    message: "Demo",
                    location: BannerLocation.bottomStart,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      centerTitle: true,
    );
  }
}

class CustomShapeBorder extends ContinuousRectangleBorder {
  @override
  // ignore: avoid_renaming_method_parameters
  Path getOuterPath(Rect size, {TextDirection? textDirection}) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.quadraticBezierTo(size.width * 0.01, size.height * 0.83, size.width * 0.07, size.height * 0.83);
    path_0.quadraticBezierTo(size.width * 0.07, size.height * 0.83, size.width * 0.50, size.height * 0.83);
    path_0.quadraticBezierTo(size.width * 0.84, size.height * 0.83, size.width * 0.95, size.height * 0.83);
    path_0.quadraticBezierTo(size.width * 1, size.height * 0.83, size.width * 1, size.height * 0.64);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(0, 0);

    return path_0;
  }
}
