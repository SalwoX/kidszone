import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easy_permission/easy_permissions.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';

import 'common/injector/injector.dart';
import 'core/init/lang/language_manager.dart';
import 'generated/locale_keys.g.dart';
import 'presentation/themes/themes.dart';
import 'register.dart';
import 'views/_init/components/animations/custom_animation.dart';
import 'views/_init/router/app_router.dart';
import 'views/_init/router/auth_guard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await configInjector(resolve, env: Environment.dev);
  resolve.registerSingleton<AppRouter>(_appRouter);
  configLoading();
  EasyLocalization.logger.enableLevels = const <LevelMessages>[LevelMessages.debug, LevelMessages.info, LevelMessages.error, LevelMessages.warning];

  /// override printer to custom
  runApp(EasyLocalization(
    path: LanguageManager.LANG_PATH,
    supportedLocales: LanguageManager.SUPPORTED_LOCALE,
    fallbackLocale: LanguageManager.TR_LOCALE,
    startLocale: LanguageManager.TR_LOCALE,
    useOnlyLangCode: false,
    saveLocale: true,
    useFallbackTranslations: true,
    //  assetLoader: CodegenLoader(),
    child: MyApp(),
  ));
}

final _appRouter = AppRouter(authGuard: AuthGuard());

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const permissionGroup = [
    PermissionGroup.Bluetooth,
    //PermissionGroup.Calendar,
    //PermissionGroup.Camera,
    //  PermissionGroup.Contacts,
    PermissionGroup.DataNetwork,
    PermissionGroup.Health,
    //PermissionGroup.Location,
    PermissionGroup.MediaLibrary,
    //PermissionGroup.Microphone,
    PermissionGroup.Notification,
    //PermissionGroup.Photos,
    //PermissionGroup.Reminders,
    //PermissionGroup.Tracking,
  ];

  static const permissions = [
    //Permissions.CALL_PHONE,
    Permissions.WRITE_EXTERNAL_STORAGE,
    Permissions.READ_EXTERNAL_STORAGE,
    Permissions.READ_PHONE_STATE,
    //kamera
    //Permissions.CAMERA,
    //rehber
    //Permissions.GET_ACCOUNTS,
    //Permissions.WRITE_CONTACTS,
    //konum bilgisi
    //Permissions.ACCESS_COARSE_LOCATION,
    //takvim
    //Permissions.READ_CALENDAR,
    //Permissions.WRITE_CALENDAR,
  ];

  @override
  void dispose() {
    _easyPermission.dispose();
    super.dispose();
  }

  late FlutterEasyPermission _easyPermission;

  @override
  void initState() {
    //ekranı dikey olarak sabitle
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();

    _easyPermission = FlutterEasyPermission()
      ..addPermissionCallback(onGranted: (requestCode, perms, perm) {
        debugPrint("android获得授权xxxxxx:$perms");
        debugPrint("iOS获得授权xxxxx:$perm");
      }, onDenied: (requestCode, perms, perm, isPermanent) {
        if (isPermanent) {
          //FlutterEasyPermission.showAppSettingsDialog(title: "Camerax", positiveButtonText: 'İzin Ver', negativeButtonText: 'Reddet', rationale: 'Resim ve Video Paylaşmak için');
        } else {
          debugPrint("android授权失败x:$perms");
          debugPrint("iOS授权失败xxxx:$perm");
        }
      }, onSettingsReturned: () {
        FlutterEasyPermission.has(perms: permissions, permsGroup: []).then((value) => value ? debugPrint("已获得授权xx:$permissions") : debugPrint("未获得授权xxx:$permissions"));
      });
    FlutterEasyPermission.request(perms: permissions, permsGroup: permissionGroup, rationale: LocaleKeys.main_permisson_rationale);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: mor,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      title: LocaleKeys.main_title,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      debugShowCheckedModeBanner: kReleaseMode,
      builder: EasyLoading.init(),
    );

    // ignore: dead_code
    // return MaterialApp(
    //   debugShowCheckedModeBanner: kReleaseMode,
    //   title: LocaleKeys.main_title,
    //   localizationsDelegates: context.localizationDelegates,
    //   supportedLocales: context.supportedLocales,
    //   locale: context.locale,
    //   theme: mor,
    //   home: PageWelcome(),
    //   routes: routes(),
    //   initialRoute: PageWelcome.tag,
    //   builder: EasyLoading.init(),
    // );
  }
}
