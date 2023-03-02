import 'package:auto_route/auto_route.dart';
import '../../../common/infrastructure/work_context.dart';
import '../../authenticate/login/view/page_login.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    bool isResult = false;
    isResult = WorkContext().token.isNotEmpty;
    if (isResult) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      router.pushWidget(PageLogin());

      print('as');
    }
  }
}
