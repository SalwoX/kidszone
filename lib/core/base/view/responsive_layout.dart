import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget? tabletScaffold;
  final Widget? desktopScaffold;

  ResponsiveLayout({
    required this.mobileScaffold,
    this.tabletScaffold,
    this.desktopScaffold,
  });
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        if (constrains.maxWidth < 450) {
          return mobileScaffold;
        } else if (constrains.maxWidth < 1024) {
          return tabletScaffold ?? mobileScaffold;
        } else {
          return desktopScaffold ?? mobileScaffold;
        }
      },
    );
  }
}
