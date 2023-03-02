import 'package:flutter/material.dart';

import '../../../core/base/view/responsive_layout.dart';
import 'page_social_network.dart';

class PageSocialNetworkLayout extends StatelessWidget {
  const PageSocialNetworkLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: PageSocialNetwork(),
    );
  }
}
