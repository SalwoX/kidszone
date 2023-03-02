// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter({
    GlobalKey<NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final AuthGuard authGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    Default.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageWelcome(),
      );
    },
    RouteLogin.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageLogin(),
      );
    },
    RouteLoginSecurity.name: (routeData) {
      final args = routeData.argsAs<RouteLoginSecurityArgs>(
          orElse: () => const RouteLoginSecurityArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageLoginSecurity(userModel: args.userModel),
      );
    },
    RouteNoticeView.name: (routeData) {
      final args = routeData.argsAs<RouteNoticeViewArgs>(
          orElse: () => const RouteNoticeViewArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageNoticeView(key: args.key),
      );
    },
    MainProfile.name: (routeData) {
      final args = routeData.argsAs<MainProfileArgs>(
          orElse: () => const MainProfileArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageProfile(key: args.key),
      );
    },
    RouteProfileAccounting.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const PageProfileAccounting(),
      );
    },
    RouteProfileEducationProcess.name: (routeData) {
      final args = routeData.argsAs<RouteProfileEducationProcessArgs>(
          orElse: () => const RouteProfileEducationProcessArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageProfileEducationProcess(key: args.key),
      );
    },
    RouteProfileOtherOptions.name: (routeData) {
      final args = routeData.argsAs<RouteProfileOtherOptionsArgs>(
          orElse: () => const RouteProfileOtherOptionsArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageProfileOtherOptions(key: args.key),
      );
    },
    RouteFoodList.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageFoodList(),
      );
    },
    RouteProfileRegistrationProcess.name: (routeData) {
      final args = routeData.argsAs<RouteProfileRegistrationProcessArgs>(
          orElse: () => const RouteProfileRegistrationProcessArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageProfileRegistrationProcess(key: args.key),
      );
    },
    RouteProfileSchoolProcess.name: (routeData) {
      final args = routeData.argsAs<RouteProfileSchoolProcessArgs>(
          orElse: () => const RouteProfileSchoolProcessArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageProfileSchoolProcess(key: args.key),
      );
    },
    RouteMessages.name: (routeData) {
      final args = routeData.argsAs<RouteMessagesArgs>(
          orElse: () => const RouteMessagesArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageMessages(key: args.key),
      );
    },
    RouteAccountingSettings.name: (routeData) {
      final args = routeData.argsAs<RouteAccountingSettingsArgs>(
          orElse: () => const RouteAccountingSettingsArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageAccountingSettings(key: args.key),
      );
    },
    RouteShowPayments.name: (routeData) {
      final args = routeData.argsAs<RouteShowPaymentsArgs>(
          orElse: () => const RouteShowPaymentsArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageShowPayments(key: args.key),
      );
    },
    RouteAccountingStatistics.name: (routeData) {
      final args = routeData.argsAs<RouteAccountingStatisticsArgs>(
          orElse: () => const RouteAccountingStatisticsArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageAccountingStatistics(key: args.key),
      );
    },
    RouteStudentAccounting.name: (routeData) {
      final args = routeData.argsAs<RouteStudentAccountingArgs>(
          orElse: () => const RouteStudentAccountingArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageStudentAccounting(key: args.key),
      );
    },
    RouteRegistrationAccounting.name: (routeData) {
      final args = routeData.argsAs<RouteRegistrationAccountingArgs>(
          orElse: () => const RouteRegistrationAccountingArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageRegistrationAccounting(key: args.key),
      );
    },
    RouteMessageDetail.name: (routeData) {
      final args = routeData.argsAs<RouteMessageDetailArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageMessageDetail(
          key: args.key,
          id: args.id,
        ),
      );
    },
    RouteAttendanceList.name: (routeData) {
      final args = routeData.argsAs<RouteAttendanceListArgs>(
          orElse: () => const RouteAttendanceListArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageAttendanceList(key: args.key),
      );
    },
    RouteAttendanceListDetail.name: (routeData) {
      final args = routeData.argsAs<RouteAttendanceListDetailArgs>(
          orElse: () => const RouteAttendanceListDetailArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageAttendanceListDetail(
          key: args.key,
          item: args.item,
          details: args.details,
        ),
      );
    },
    RouteHealthProcess.name: (routeData) {
      final args = routeData.argsAs<RouteHealthProcessArgs>(
          orElse: () => const RouteHealthProcessArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageHealthProcess(key: args.key),
      );
    },
    RouteSelectionStudent.name: (routeData) {
      final args = routeData.argsAs<RouteSelectionStudentArgs>(
          orElse: () => const RouteSelectionStudentArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageSelectionStudent(key: args.key),
      );
    },
    RouteDailyReport.name: (routeData) {
      final args = routeData.argsAs<RouteDailyReportArgs>(
          orElse: () => const RouteDailyReportArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageDailyReport(
          key: args.key,
          reports: args.reports,
        ),
      );
    },
    RouteAddFoodList.name: (routeData) {
      final args = routeData.argsAs<RouteAddFoodListArgs>(
          orElse: () => const RouteAddFoodListArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageAddFoodList(key: args.key),
      );
    },
    RouteShare.name: (routeData) {
      final args = routeData.argsAs<RouteShareArgs>(
          orElse: () => const RouteShareArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageShare(key: args.key),
      );
    },
    RouteEditReport.name: (routeData) {
      final args = routeData.argsAs<RouteEditReportArgs>(
          orElse: () => const RouteEditReportArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageEditReport(key: args.key),
      );
    },
    RouteAttendanceProcess.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const PageAttendanceProcess(),
      );
    },
    RouteLessonHours.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const PageLessonHours(),
      );
    },
    RoutesSettings.name: (routeData) {
      final args = routeData.argsAs<RoutesSettingsArgs>(
          orElse: () => const RoutesSettingsArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PagesSettings(
          key: args.key,
          model: args.model,
        ),
      );
    },
    RouteClassroom.name: (routeData) {
      final args = routeData.argsAs<RouteClassroomArgs>(
          orElse: () => const RouteClassroomArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageClassroom(key: args.key),
      );
    },
    RouteRegistrationClassroom.name: (routeData) {
      final args = routeData.argsAs<RouteRegistrationClassroomArgs>(
          orElse: () => const RouteRegistrationClassroomArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageRegistrationClassroom(
          key: args.key,
          model: args.model,
        ),
      );
    },
    RouteParent.name: (routeData) {
      final args = routeData.argsAs<RouteParentArgs>(
          orElse: () => const RouteParentArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageParent(key: args.key),
      );
    },
    RouteRegistrationParent.name: (routeData) {
      final args = routeData.argsAs<RouteRegistrationParentArgs>(
          orElse: () => const RouteRegistrationParentArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageRegistrationParent(
          key: args.key,
          model: args.model,
        ),
      );
    },
    RouteExecutive.name: (routeData) {
      final args = routeData.argsAs<RouteExecutiveArgs>(
          orElse: () => const RouteExecutiveArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageExecutive(key: args.key),
      );
    },
    RouteRegistrationExecutive.name: (routeData) {
      final args = routeData.argsAs<RouteRegistrationExecutiveArgs>(
          orElse: () => const RouteRegistrationExecutiveArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageRegistrationExecutive(
          key: args.key,
          model: args.model,
        ),
      );
    },
    RoutePreregistration.name: (routeData) {
      final args = routeData.argsAs<RoutePreregistrationArgs>(
          orElse: () => const RoutePreregistrationArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PagePreregistration(key: args.key),
      );
    },
    RouteRegistrationPreregistration.name: (routeData) {
      final args = routeData.argsAs<RouteRegistrationPreregistrationArgs>(
          orElse: () => const RouteRegistrationPreregistrationArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageRegistrationPreregistration(
          key: args.key,
          model: args.model,
        ),
      );
    },
    RoutePreregistrationNotes.name: (routeData) {
      final args = routeData.argsAs<RoutePreregistrationNotesArgs>(
          orElse: () => const RoutePreregistrationNotesArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PagePreregistrationNotes(
          key: args.key,
          preregistrationId: args.preregistrationId,
          newRegistrationActive: args.newRegistrationActive,
        ),
      );
    },
    RouteRegistrationPreregistrationNotes.name: (routeData) {
      final args = routeData.argsAs<RouteRegistrationPreregistrationNotesArgs>(
          orElse: () => const RouteRegistrationPreregistrationNotesArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageRegistrationPreregistrationNotes(
          key: args.key,
          model: args.model,
        ),
      );
    },
    RouteLesson.name: (routeData) {
      final args = routeData.argsAs<RouteLessonArgs>(
          orElse: () => const RouteLessonArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageLesson(key: args.key),
      );
    },
    RouteRegistrationLesson.name: (routeData) {
      final args = routeData.argsAs<RouteRegistrationLessonArgs>(
          orElse: () => const RouteRegistrationLessonArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageRegistrationLesson(
          key: args.key,
          model: args.model,
        ),
      );
    },
    RouteSchoolBus.name: (routeData) {
      final args = routeData.argsAs<RouteSchoolBusArgs>(
          orElse: () => const RouteSchoolBusArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageSchoolBus(key: args.key),
      );
    },
    RouteRegistrationSchoolBus.name: (routeData) {
      final args = routeData.argsAs<RouteRegistrationSchoolBusArgs>(
          orElse: () => const RouteRegistrationSchoolBusArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageRegistrationSchoolBus(
          key: args.key,
          model: args.model,
        ),
      );
    },
    RouteStudent.name: (routeData) {
      final args = routeData.argsAs<RouteStudentArgs>(
          orElse: () => const RouteStudentArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageStudent(key: args.key),
      );
    },
    RouteRegistrationStudent.name: (routeData) {
      final args = routeData.argsAs<RouteRegistrationStudentArgs>(
          orElse: () => const RouteRegistrationStudentArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageRegistrationStudent(
          key: args.key,
          model: args.model,
        ),
      );
    },
    RouteTeacher.name: (routeData) {
      final args = routeData.argsAs<RouteTeacherArgs>(
          orElse: () => const RouteTeacherArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageTeacher(key: args.key),
      );
    },
    RouteRegistrationTeacher.name: (routeData) {
      final args = routeData.argsAs<RouteRegistrationTeacherArgs>(
          orElse: () => const RouteRegistrationTeacherArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageRegistrationTeacher(
          key: args.key,
          model: args.model,
        ),
      );
    },
    RouteAdmin.name: (routeData) {
      final args = routeData.argsAs<RouteAdminArgs>(
          orElse: () => const RouteAdminArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageAdmin(key: args.key),
      );
    },
    RouteRegistrationAdmin.name: (routeData) {
      final args = routeData.argsAs<RouteRegistrationAdminArgs>(
          orElse: () => const RouteRegistrationAdminArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageRegistrationAdmin(
          key: args.key,
          model: args.model,
        ),
      );
    },
    RouteBranch.name: (routeData) {
      final args = routeData.argsAs<RouteBranchArgs>(
          orElse: () => const RouteBranchArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageBranch(key: args.key),
      );
    },
    RouteRegistrationBranch.name: (routeData) {
      final args = routeData.argsAs<RouteRegistrationBranchArgs>(
          orElse: () => const RouteRegistrationBranchArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageRegistrationBranch(
          key: args.key,
          model: args.model,
        ),
      );
    },
    RouteGroup.name: (routeData) {
      final args = routeData.argsAs<RouteGroupArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageGroup(
          key: args.key,
          type: args.type,
          title: args.title,
        ),
      );
    },
    RouteRegistrationGroup.name: (routeData) {
      final args = routeData.argsAs<RouteRegistrationGroupArgs>(
          orElse: () => const RouteRegistrationGroupArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageRegistrationGroup(
          key: args.key,
          model: args.model,
          title: args.title,
        ),
      );
    },
    RouteSchool.name: (routeData) {
      final args = routeData.argsAs<RouteSchoolArgs>(
          orElse: () => const RouteSchoolArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageSchool(key: args.key),
      );
    },
    RouteSchoolRegistration.name: (routeData) {
      final args = routeData.argsAs<RouteSchoolRegistrationArgs>(
          orElse: () => const RouteSchoolRegistrationArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageSchoolRegistration(
          key: args.key,
          model: args.model,
        ),
      );
    },
    RouteSocialNetwork.name: (routeData) {
      final args = routeData.argsAs<RouteSocialNetworkArgs>(
          orElse: () => const RouteSocialNetworkArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageSocialNetwork(key: args.key),
      );
    },
    RouteSocialNetworkLayout.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const PageSocialNetworkLayout(),
      );
    },
    RouteVideoPlayerWidget.name: (routeData) {
      final args = routeData.argsAs<RouteVideoPlayerWidgetArgs>(
          orElse: () => const RouteVideoPlayerWidgetArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageVideoPlayerWidget(
          key: args.key,
          videoUrl: args.videoUrl,
        ),
      );
    },
    RouteNoticeRegistration.name: (routeData) {
      final args = routeData.argsAs<RouteNoticeRegistrationArgs>(
          orElse: () => const RouteNoticeRegistrationArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PageNoticeRegistration(key: args.key),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'default',
          fullMatch: true,
        ),
        RouteConfig(
          Default.name,
          path: 'default',
        ),
        RouteConfig(
          RouteLogin.name,
          path: 'login',
        ),
        RouteConfig(
          RouteLoginSecurity.name,
          path: 'login_security',
        ),
        RouteConfig(
          RouteNoticeView.name,
          path: 'homePage',
          guards: [authGuard],
        ),
        RouteConfig(
          MainProfile.name,
          path: 'MainProfile',
          guards: [authGuard],
        ),
        RouteConfig(
          RouteProfileAccounting.name,
          path: 'ProfileAccounting',
          guards: [authGuard],
        ),
        RouteConfig(
          RouteProfileEducationProcess.name,
          path: 'ProfileEducationProcess',
          guards: [authGuard],
        ),
        RouteConfig(
          RouteProfileOtherOptions.name,
          path: 'ProfileOtherOptions',
          guards: [authGuard],
        ),
        RouteConfig(
          RouteFoodList.name,
          path: 'FoodList',
          guards: [authGuard],
        ),
        RouteConfig(
          RouteProfileRegistrationProcess.name,
          path: 'ProfileRegistrationProcess',
          guards: [authGuard],
        ),
        RouteConfig(
          RouteProfileSchoolProcess.name,
          path: 'ProfileSchoolProcess',
          guards: [authGuard],
        ),
        RouteConfig(
          RouteMessages.name,
          path: 'Messages',
        ),
        RouteConfig(
          RouteAccountingSettings.name,
          path: 'AccountingSettings',
        ),
        RouteConfig(
          RouteShowPayments.name,
          path: 'ShowPayments',
        ),
        RouteConfig(
          RouteAccountingStatistics.name,
          path: 'AccountingStatistics',
        ),
        RouteConfig(
          RouteStudentAccounting.name,
          path: 'StudentAccounting',
        ),
        RouteConfig(
          RouteRegistrationAccounting.name,
          path: 'RegistrationAccounting',
        ),
        RouteConfig(
          RouteMessageDetail.name,
          path: 'MessageDetail',
        ),
        RouteConfig(
          RouteAttendanceList.name,
          path: 'AttendanceList',
        ),
        RouteConfig(
          RouteAttendanceListDetail.name,
          path: 'AttendanceListDetail',
        ),
        RouteConfig(
          RouteHealthProcess.name,
          path: 'HealthProcess',
        ),
        RouteConfig(
          RouteSelectionStudent.name,
          path: 'SelectionStudent',
        ),
        RouteConfig(
          RouteDailyReport.name,
          path: 'DailyReport',
        ),
        RouteConfig(
          RouteAddFoodList.name,
          path: 'AddFoodList',
        ),
        RouteConfig(
          RouteShare.name,
          path: 'Share',
          guards: [authGuard],
        ),
        RouteConfig(
          RouteEditReport.name,
          path: 'EditReport',
        ),
        RouteConfig(
          RouteHealthProcess.name,
          path: 'HealthProcess',
        ),
        RouteConfig(
          RouteAttendanceProcess.name,
          path: 'AttendanceProcess',
        ),
        RouteConfig(
          RouteLessonHours.name,
          path: 'LessonHours',
        ),
        RouteConfig(
          RoutesSettings.name,
          path: 'Settings',
        ),
        RouteConfig(
          RouteClassroom.name,
          path: 'ClassRoomList',
        ),
        RouteConfig(
          RouteRegistrationClassroom.name,
          path: 'RegistrationClassroom',
        ),
        RouteConfig(
          RouteParent.name,
          path: 'ParentList',
        ),
        RouteConfig(
          RouteRegistrationParent.name,
          path: 'RegistrationClassroom',
        ),
        RouteConfig(
          RouteExecutive.name,
          path: 'ExecutiveList',
        ),
        RouteConfig(
          RouteRegistrationExecutive.name,
          path: 'RegistrationExecutive',
        ),
        RouteConfig(
          RoutePreregistration.name,
          path: 'Preregistration',
        ),
        RouteConfig(
          RouteRegistrationPreregistration.name,
          path: 'RegistrationPreregistration',
        ),
        RouteConfig(
          RoutePreregistrationNotes.name,
          path: 'PreregistrationNotes',
        ),
        RouteConfig(
          RouteRegistrationPreregistrationNotes.name,
          path: 'RegistrationPreregistrationNotes',
        ),
        RouteConfig(
          RouteLesson.name,
          path: 'LessonList',
        ),
        RouteConfig(
          RouteRegistrationLesson.name,
          path: 'RegistrationLesson',
        ),
        RouteConfig(
          RouteSchoolBus.name,
          path: 'SchoolBus',
        ),
        RouteConfig(
          RouteRegistrationSchoolBus.name,
          path: 'RegistrationSchoolBus',
        ),
        RouteConfig(
          RouteStudent.name,
          path: 'StudentList',
        ),
        RouteConfig(
          RouteRegistrationStudent.name,
          path: 'RegistrationStudent',
        ),
        RouteConfig(
          RouteTeacher.name,
          path: 'TeacherList',
        ),
        RouteConfig(
          RouteRegistrationTeacher.name,
          path: 'RegistrationTeacher',
        ),
        RouteConfig(
          RouteAdmin.name,
          path: 'AdminList',
        ),
        RouteConfig(
          RouteRegistrationAdmin.name,
          path: 'RegistrationAdmin',
        ),
        RouteConfig(
          RouteBranch.name,
          path: 'BranchList',
        ),
        RouteConfig(
          RouteRegistrationBranch.name,
          path: 'RegistrationBranch',
        ),
        RouteConfig(
          RouteGroup.name,
          path: 'GroupList',
        ),
        RouteConfig(
          RouteRegistrationGroup.name,
          path: 'RegistrationGroup',
        ),
        RouteConfig(
          RouteSchool.name,
          path: 'SchoolList',
        ),
        RouteConfig(
          RouteSchoolRegistration.name,
          path: 'RegistrationSchool',
        ),
        RouteConfig(
          RouteSocialNetwork.name,
          path: 'SocialList',
        ),
        RouteConfig(
          RouteSocialNetworkLayout.name,
          path: 'PageSocialNetworkLayout',
        ),
        RouteConfig(
          RouteVideoPlayerWidget.name,
          path: 'PageVideoPlayerWidget',
        ),
        RouteConfig(
          RouteNoticeRegistration.name,
          path: 'NoticeRegistration',
        ),
      ];
}

/// generated route for
/// [PageWelcome]
class Default extends PageRouteInfo<void> {
  const Default()
      : super(
          Default.name,
          path: 'default',
        );

  static const String name = 'Default';
}

/// generated route for
/// [PageLogin]
class RouteLogin extends PageRouteInfo<void> {
  const RouteLogin()
      : super(
          RouteLogin.name,
          path: 'login',
        );

  static const String name = 'RouteLogin';
}

/// generated route for
/// [PageLoginSecurity]
class RouteLoginSecurity extends PageRouteInfo<RouteLoginSecurityArgs> {
  RouteLoginSecurity({UserModel? userModel})
      : super(
          RouteLoginSecurity.name,
          path: 'login_security',
          args: RouteLoginSecurityArgs(userModel: userModel),
        );

  static const String name = 'RouteLoginSecurity';
}

class RouteLoginSecurityArgs {
  const RouteLoginSecurityArgs({this.userModel});

  final UserModel? userModel;

  @override
  String toString() {
    return 'RouteLoginSecurityArgs{userModel: $userModel}';
  }
}

/// generated route for
/// [PageNoticeView]
class RouteNoticeView extends PageRouteInfo<RouteNoticeViewArgs> {
  RouteNoticeView({Key? key})
      : super(
          RouteNoticeView.name,
          path: 'homePage',
          args: RouteNoticeViewArgs(key: key),
        );

  static const String name = 'RouteNoticeView';
}

class RouteNoticeViewArgs {
  const RouteNoticeViewArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteNoticeViewArgs{key: $key}';
  }
}

/// generated route for
/// [PageProfile]
class MainProfile extends PageRouteInfo<MainProfileArgs> {
  MainProfile({Key? key})
      : super(
          MainProfile.name,
          path: 'MainProfile',
          args: MainProfileArgs(key: key),
        );

  static const String name = 'MainProfile';
}

class MainProfileArgs {
  const MainProfileArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'MainProfileArgs{key: $key}';
  }
}

/// generated route for
/// [PageProfileAccounting]
class RouteProfileAccounting extends PageRouteInfo<void> {
  const RouteProfileAccounting()
      : super(
          RouteProfileAccounting.name,
          path: 'ProfileAccounting',
        );

  static const String name = 'RouteProfileAccounting';
}

/// generated route for
/// [PageProfileEducationProcess]
class RouteProfileEducationProcess
    extends PageRouteInfo<RouteProfileEducationProcessArgs> {
  RouteProfileEducationProcess({Key? key})
      : super(
          RouteProfileEducationProcess.name,
          path: 'ProfileEducationProcess',
          args: RouteProfileEducationProcessArgs(key: key),
        );

  static const String name = 'RouteProfileEducationProcess';
}

class RouteProfileEducationProcessArgs {
  const RouteProfileEducationProcessArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteProfileEducationProcessArgs{key: $key}';
  }
}

/// generated route for
/// [PageProfileOtherOptions]
class RouteProfileOtherOptions
    extends PageRouteInfo<RouteProfileOtherOptionsArgs> {
  RouteProfileOtherOptions({Key? key})
      : super(
          RouteProfileOtherOptions.name,
          path: 'ProfileOtherOptions',
          args: RouteProfileOtherOptionsArgs(key: key),
        );

  static const String name = 'RouteProfileOtherOptions';
}

class RouteProfileOtherOptionsArgs {
  const RouteProfileOtherOptionsArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteProfileOtherOptionsArgs{key: $key}';
  }
}

/// generated route for
/// [PageFoodList]
class RouteFoodList extends PageRouteInfo<void> {
  const RouteFoodList()
      : super(
          RouteFoodList.name,
          path: 'FoodList',
        );

  static const String name = 'RouteFoodList';
}

/// generated route for
/// [PageProfileRegistrationProcess]
class RouteProfileRegistrationProcess
    extends PageRouteInfo<RouteProfileRegistrationProcessArgs> {
  RouteProfileRegistrationProcess({Key? key})
      : super(
          RouteProfileRegistrationProcess.name,
          path: 'ProfileRegistrationProcess',
          args: RouteProfileRegistrationProcessArgs(key: key),
        );

  static const String name = 'RouteProfileRegistrationProcess';
}

class RouteProfileRegistrationProcessArgs {
  const RouteProfileRegistrationProcessArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteProfileRegistrationProcessArgs{key: $key}';
  }
}

/// generated route for
/// [PageProfileSchoolProcess]
class RouteProfileSchoolProcess
    extends PageRouteInfo<RouteProfileSchoolProcessArgs> {
  RouteProfileSchoolProcess({Key? key})
      : super(
          RouteProfileSchoolProcess.name,
          path: 'ProfileSchoolProcess',
          args: RouteProfileSchoolProcessArgs(key: key),
        );

  static const String name = 'RouteProfileSchoolProcess';
}

class RouteProfileSchoolProcessArgs {
  const RouteProfileSchoolProcessArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteProfileSchoolProcessArgs{key: $key}';
  }
}

/// generated route for
/// [PageMessages]
class RouteMessages extends PageRouteInfo<RouteMessagesArgs> {
  RouteMessages({Key? key})
      : super(
          RouteMessages.name,
          path: 'Messages',
          args: RouteMessagesArgs(key: key),
        );

  static const String name = 'RouteMessages';
}

class RouteMessagesArgs {
  const RouteMessagesArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteMessagesArgs{key: $key}';
  }
}

/// generated route for
/// [PageAccountingSettings]
class RouteAccountingSettings
    extends PageRouteInfo<RouteAccountingSettingsArgs> {
  RouteAccountingSettings({Key? key})
      : super(
          RouteAccountingSettings.name,
          path: 'AccountingSettings',
          args: RouteAccountingSettingsArgs(key: key),
        );

  static const String name = 'RouteAccountingSettings';
}

class RouteAccountingSettingsArgs {
  const RouteAccountingSettingsArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteAccountingSettingsArgs{key: $key}';
  }
}

/// generated route for
/// [PageShowPayments]
class RouteShowPayments extends PageRouteInfo<RouteShowPaymentsArgs> {
  RouteShowPayments({Key? key})
      : super(
          RouteShowPayments.name,
          path: 'ShowPayments',
          args: RouteShowPaymentsArgs(key: key),
        );

  static const String name = 'RouteShowPayments';
}

class RouteShowPaymentsArgs {
  const RouteShowPaymentsArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteShowPaymentsArgs{key: $key}';
  }
}

/// generated route for
/// [PageAccountingStatistics]
class RouteAccountingStatistics
    extends PageRouteInfo<RouteAccountingStatisticsArgs> {
  RouteAccountingStatistics({Key? key})
      : super(
          RouteAccountingStatistics.name,
          path: 'AccountingStatistics',
          args: RouteAccountingStatisticsArgs(key: key),
        );

  static const String name = 'RouteAccountingStatistics';
}

class RouteAccountingStatisticsArgs {
  const RouteAccountingStatisticsArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteAccountingStatisticsArgs{key: $key}';
  }
}

/// generated route for
/// [PageStudentAccounting]
class RouteStudentAccounting extends PageRouteInfo<RouteStudentAccountingArgs> {
  RouteStudentAccounting({Key? key})
      : super(
          RouteStudentAccounting.name,
          path: 'StudentAccounting',
          args: RouteStudentAccountingArgs(key: key),
        );

  static const String name = 'RouteStudentAccounting';
}

class RouteStudentAccountingArgs {
  const RouteStudentAccountingArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteStudentAccountingArgs{key: $key}';
  }
}

/// generated route for
/// [PageRegistrationAccounting]
class RouteRegistrationAccounting
    extends PageRouteInfo<RouteRegistrationAccountingArgs> {
  RouteRegistrationAccounting({Key? key})
      : super(
          RouteRegistrationAccounting.name,
          path: 'RegistrationAccounting',
          args: RouteRegistrationAccountingArgs(key: key),
        );

  static const String name = 'RouteRegistrationAccounting';
}

class RouteRegistrationAccountingArgs {
  const RouteRegistrationAccountingArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteRegistrationAccountingArgs{key: $key}';
  }
}

/// generated route for
/// [PageMessageDetail]
class RouteMessageDetail extends PageRouteInfo<RouteMessageDetailArgs> {
  RouteMessageDetail({
    Key? key,
    required int? id,
  }) : super(
          RouteMessageDetail.name,
          path: 'MessageDetail',
          args: RouteMessageDetailArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'RouteMessageDetail';
}

class RouteMessageDetailArgs {
  const RouteMessageDetailArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int? id;

  @override
  String toString() {
    return 'RouteMessageDetailArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [PageAttendanceList]
class RouteAttendanceList extends PageRouteInfo<RouteAttendanceListArgs> {
  RouteAttendanceList({Key? key})
      : super(
          RouteAttendanceList.name,
          path: 'AttendanceList',
          args: RouteAttendanceListArgs(key: key),
        );

  static const String name = 'RouteAttendanceList';
}

class RouteAttendanceListArgs {
  const RouteAttendanceListArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteAttendanceListArgs{key: $key}';
  }
}

/// generated route for
/// [PageAttendanceListDetail]
class RouteAttendanceListDetail
    extends PageRouteInfo<RouteAttendanceListDetailArgs> {
  RouteAttendanceListDetail({
    Key? key,
    AttendanceModel? item,
    List<AttendanceDetail>? details,
  }) : super(
          RouteAttendanceListDetail.name,
          path: 'AttendanceListDetail',
          args: RouteAttendanceListDetailArgs(
            key: key,
            item: item,
            details: details,
          ),
        );

  static const String name = 'RouteAttendanceListDetail';
}

class RouteAttendanceListDetailArgs {
  const RouteAttendanceListDetailArgs({
    this.key,
    this.item,
    this.details,
  });

  final Key? key;

  final AttendanceModel? item;

  final List<AttendanceDetail>? details;

  @override
  String toString() {
    return 'RouteAttendanceListDetailArgs{key: $key, item: $item, details: $details}';
  }
}

/// generated route for
/// [PageHealthProcess]
class RouteHealthProcess extends PageRouteInfo<RouteHealthProcessArgs> {
  RouteHealthProcess({Key? key})
      : super(
          RouteHealthProcess.name,
          path: 'HealthProcess',
          args: RouteHealthProcessArgs(key: key),
        );

  static const String name = 'RouteHealthProcess';
}

class RouteHealthProcessArgs {
  const RouteHealthProcessArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteHealthProcessArgs{key: $key}';
  }
}

/// generated route for
/// [PageSelectionStudent]
class RouteSelectionStudent extends PageRouteInfo<RouteSelectionStudentArgs> {
  RouteSelectionStudent({Key? key})
      : super(
          RouteSelectionStudent.name,
          path: 'SelectionStudent',
          args: RouteSelectionStudentArgs(key: key),
        );

  static const String name = 'RouteSelectionStudent';
}

class RouteSelectionStudentArgs {
  const RouteSelectionStudentArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteSelectionStudentArgs{key: $key}';
  }
}

/// generated route for
/// [PageDailyReport]
class RouteDailyReport extends PageRouteInfo<RouteDailyReportArgs> {
  RouteDailyReport({
    Key? key,
    List<Reports>? reports,
  }) : super(
          RouteDailyReport.name,
          path: 'DailyReport',
          args: RouteDailyReportArgs(
            key: key,
            reports: reports,
          ),
        );

  static const String name = 'RouteDailyReport';
}

class RouteDailyReportArgs {
  const RouteDailyReportArgs({
    this.key,
    this.reports,
  });

  final Key? key;

  final List<Reports>? reports;

  @override
  String toString() {
    return 'RouteDailyReportArgs{key: $key, reports: $reports}';
  }
}

/// generated route for
/// [PageAddFoodList]
class RouteAddFoodList extends PageRouteInfo<RouteAddFoodListArgs> {
  RouteAddFoodList({Key? key})
      : super(
          RouteAddFoodList.name,
          path: 'AddFoodList',
          args: RouteAddFoodListArgs(key: key),
        );

  static const String name = 'RouteAddFoodList';
}

class RouteAddFoodListArgs {
  const RouteAddFoodListArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteAddFoodListArgs{key: $key}';
  }
}

/// generated route for
/// [PageShare]
class RouteShare extends PageRouteInfo<RouteShareArgs> {
  RouteShare({Key? key})
      : super(
          RouteShare.name,
          path: 'Share',
          args: RouteShareArgs(key: key),
        );

  static const String name = 'RouteShare';
}

class RouteShareArgs {
  const RouteShareArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteShareArgs{key: $key}';
  }
}

/// generated route for
/// [PageEditReport]
class RouteEditReport extends PageRouteInfo<RouteEditReportArgs> {
  RouteEditReport({Key? key})
      : super(
          RouteEditReport.name,
          path: 'EditReport',
          args: RouteEditReportArgs(key: key),
        );

  static const String name = 'RouteEditReport';
}

class RouteEditReportArgs {
  const RouteEditReportArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteEditReportArgs{key: $key}';
  }
}

/// generated route for
/// [PageAttendanceProcess]
class RouteAttendanceProcess extends PageRouteInfo<void> {
  const RouteAttendanceProcess()
      : super(
          RouteAttendanceProcess.name,
          path: 'AttendanceProcess',
        );

  static const String name = 'RouteAttendanceProcess';
}

/// generated route for
/// [PageLessonHours]
class RouteLessonHours extends PageRouteInfo<void> {
  const RouteLessonHours()
      : super(
          RouteLessonHours.name,
          path: 'LessonHours',
        );

  static const String name = 'RouteLessonHours';
}

/// generated route for
/// [PagesSettings]
class RoutesSettings extends PageRouteInfo<RoutesSettingsArgs> {
  RoutesSettings({
    Key? key,
    SettingsModel? model,
  }) : super(
          RoutesSettings.name,
          path: 'Settings',
          args: RoutesSettingsArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'RoutesSettings';
}

class RoutesSettingsArgs {
  const RoutesSettingsArgs({
    this.key,
    this.model,
  });

  final Key? key;

  final SettingsModel? model;

  @override
  String toString() {
    return 'RoutesSettingsArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [PageClassroom]
class RouteClassroom extends PageRouteInfo<RouteClassroomArgs> {
  RouteClassroom({Key? key})
      : super(
          RouteClassroom.name,
          path: 'ClassRoomList',
          args: RouteClassroomArgs(key: key),
        );

  static const String name = 'RouteClassroom';
}

class RouteClassroomArgs {
  const RouteClassroomArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteClassroomArgs{key: $key}';
  }
}

/// generated route for
/// [PageRegistrationClassroom]
class RouteRegistrationClassroom
    extends PageRouteInfo<RouteRegistrationClassroomArgs> {
  RouteRegistrationClassroom({
    Key? key,
    ClassroomModel? model,
  }) : super(
          RouteRegistrationClassroom.name,
          path: 'RegistrationClassroom',
          args: RouteRegistrationClassroomArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'RouteRegistrationClassroom';
}

class RouteRegistrationClassroomArgs {
  const RouteRegistrationClassroomArgs({
    this.key,
    this.model,
  });

  final Key? key;

  final ClassroomModel? model;

  @override
  String toString() {
    return 'RouteRegistrationClassroomArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [PageParent]
class RouteParent extends PageRouteInfo<RouteParentArgs> {
  RouteParent({Key? key})
      : super(
          RouteParent.name,
          path: 'ParentList',
          args: RouteParentArgs(key: key),
        );

  static const String name = 'RouteParent';
}

class RouteParentArgs {
  const RouteParentArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteParentArgs{key: $key}';
  }
}

/// generated route for
/// [PageRegistrationParent]
class RouteRegistrationParent
    extends PageRouteInfo<RouteRegistrationParentArgs> {
  RouteRegistrationParent({
    Key? key,
    ParentModel? model,
  }) : super(
          RouteRegistrationParent.name,
          path: 'RegistrationClassroom',
          args: RouteRegistrationParentArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'RouteRegistrationParent';
}

class RouteRegistrationParentArgs {
  const RouteRegistrationParentArgs({
    this.key,
    this.model,
  });

  final Key? key;

  final ParentModel? model;

  @override
  String toString() {
    return 'RouteRegistrationParentArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [PageExecutive]
class RouteExecutive extends PageRouteInfo<RouteExecutiveArgs> {
  RouteExecutive({Key? key})
      : super(
          RouteExecutive.name,
          path: 'ExecutiveList',
          args: RouteExecutiveArgs(key: key),
        );

  static const String name = 'RouteExecutive';
}

class RouteExecutiveArgs {
  const RouteExecutiveArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteExecutiveArgs{key: $key}';
  }
}

/// generated route for
/// [PageRegistrationExecutive]
class RouteRegistrationExecutive
    extends PageRouteInfo<RouteRegistrationExecutiveArgs> {
  RouteRegistrationExecutive({
    Key? key,
    ExecutiveModel? model,
  }) : super(
          RouteRegistrationExecutive.name,
          path: 'RegistrationExecutive',
          args: RouteRegistrationExecutiveArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'RouteRegistrationExecutive';
}

class RouteRegistrationExecutiveArgs {
  const RouteRegistrationExecutiveArgs({
    this.key,
    this.model,
  });

  final Key? key;

  final ExecutiveModel? model;

  @override
  String toString() {
    return 'RouteRegistrationExecutiveArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [PagePreregistration]
class RoutePreregistration extends PageRouteInfo<RoutePreregistrationArgs> {
  RoutePreregistration({Key? key})
      : super(
          RoutePreregistration.name,
          path: 'Preregistration',
          args: RoutePreregistrationArgs(key: key),
        );

  static const String name = 'RoutePreregistration';
}

class RoutePreregistrationArgs {
  const RoutePreregistrationArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RoutePreregistrationArgs{key: $key}';
  }
}

/// generated route for
/// [PageRegistrationPreregistration]
class RouteRegistrationPreregistration
    extends PageRouteInfo<RouteRegistrationPreregistrationArgs> {
  RouteRegistrationPreregistration({
    Key? key,
    PreregistrationModel? model,
  }) : super(
          RouteRegistrationPreregistration.name,
          path: 'RegistrationPreregistration',
          args: RouteRegistrationPreregistrationArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'RouteRegistrationPreregistration';
}

class RouteRegistrationPreregistrationArgs {
  const RouteRegistrationPreregistrationArgs({
    this.key,
    this.model,
  });

  final Key? key;

  final PreregistrationModel? model;

  @override
  String toString() {
    return 'RouteRegistrationPreregistrationArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [PagePreregistrationNotes]
class RoutePreregistrationNotes
    extends PageRouteInfo<RoutePreregistrationNotesArgs> {
  RoutePreregistrationNotes({
    Key? key,
    int? preregistrationId,
    bool newRegistrationActive = false,
  }) : super(
          RoutePreregistrationNotes.name,
          path: 'PreregistrationNotes',
          args: RoutePreregistrationNotesArgs(
            key: key,
            preregistrationId: preregistrationId,
            newRegistrationActive: newRegistrationActive,
          ),
        );

  static const String name = 'RoutePreregistrationNotes';
}

class RoutePreregistrationNotesArgs {
  const RoutePreregistrationNotesArgs({
    this.key,
    this.preregistrationId,
    this.newRegistrationActive = false,
  });

  final Key? key;

  final int? preregistrationId;

  final bool newRegistrationActive;

  @override
  String toString() {
    return 'RoutePreregistrationNotesArgs{key: $key, preregistrationId: $preregistrationId, newRegistrationActive: $newRegistrationActive}';
  }
}

/// generated route for
/// [PageRegistrationPreregistrationNotes]
class RouteRegistrationPreregistrationNotes
    extends PageRouteInfo<RouteRegistrationPreregistrationNotesArgs> {
  RouteRegistrationPreregistrationNotes({
    Key? key,
    PreregistrationNotesModel? model,
  }) : super(
          RouteRegistrationPreregistrationNotes.name,
          path: 'RegistrationPreregistrationNotes',
          args: RouteRegistrationPreregistrationNotesArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'RouteRegistrationPreregistrationNotes';
}

class RouteRegistrationPreregistrationNotesArgs {
  const RouteRegistrationPreregistrationNotesArgs({
    this.key,
    this.model,
  });

  final Key? key;

  final PreregistrationNotesModel? model;

  @override
  String toString() {
    return 'RouteRegistrationPreregistrationNotesArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [PageLesson]
class RouteLesson extends PageRouteInfo<RouteLessonArgs> {
  RouteLesson({Key? key})
      : super(
          RouteLesson.name,
          path: 'LessonList',
          args: RouteLessonArgs(key: key),
        );

  static const String name = 'RouteLesson';
}

class RouteLessonArgs {
  const RouteLessonArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteLessonArgs{key: $key}';
  }
}

/// generated route for
/// [PageRegistrationLesson]
class RouteRegistrationLesson
    extends PageRouteInfo<RouteRegistrationLessonArgs> {
  RouteRegistrationLesson({
    Key? key,
    LessonModel? model,
  }) : super(
          RouteRegistrationLesson.name,
          path: 'RegistrationLesson',
          args: RouteRegistrationLessonArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'RouteRegistrationLesson';
}

class RouteRegistrationLessonArgs {
  const RouteRegistrationLessonArgs({
    this.key,
    this.model,
  });

  final Key? key;

  final LessonModel? model;

  @override
  String toString() {
    return 'RouteRegistrationLessonArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [PageSchoolBus]
class RouteSchoolBus extends PageRouteInfo<RouteSchoolBusArgs> {
  RouteSchoolBus({Key? key})
      : super(
          RouteSchoolBus.name,
          path: 'SchoolBus',
          args: RouteSchoolBusArgs(key: key),
        );

  static const String name = 'RouteSchoolBus';
}

class RouteSchoolBusArgs {
  const RouteSchoolBusArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteSchoolBusArgs{key: $key}';
  }
}

/// generated route for
/// [PageRegistrationSchoolBus]
class RouteRegistrationSchoolBus
    extends PageRouteInfo<RouteRegistrationSchoolBusArgs> {
  RouteRegistrationSchoolBus({
    Key? key,
    SchoolBusModel? model,
  }) : super(
          RouteRegistrationSchoolBus.name,
          path: 'RegistrationSchoolBus',
          args: RouteRegistrationSchoolBusArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'RouteRegistrationSchoolBus';
}

class RouteRegistrationSchoolBusArgs {
  const RouteRegistrationSchoolBusArgs({
    this.key,
    this.model,
  });

  final Key? key;

  final SchoolBusModel? model;

  @override
  String toString() {
    return 'RouteRegistrationSchoolBusArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [PageStudent]
class RouteStudent extends PageRouteInfo<RouteStudentArgs> {
  RouteStudent({Key? key})
      : super(
          RouteStudent.name,
          path: 'StudentList',
          args: RouteStudentArgs(key: key),
        );

  static const String name = 'RouteStudent';
}

class RouteStudentArgs {
  const RouteStudentArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteStudentArgs{key: $key}';
  }
}

/// generated route for
/// [PageRegistrationStudent]
class RouteRegistrationStudent
    extends PageRouteInfo<RouteRegistrationStudentArgs> {
  RouteRegistrationStudent({
    Key? key,
    StudentModel? model,
  }) : super(
          RouteRegistrationStudent.name,
          path: 'RegistrationStudent',
          args: RouteRegistrationStudentArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'RouteRegistrationStudent';
}

class RouteRegistrationStudentArgs {
  const RouteRegistrationStudentArgs({
    this.key,
    this.model,
  });

  final Key? key;

  final StudentModel? model;

  @override
  String toString() {
    return 'RouteRegistrationStudentArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [PageTeacher]
class RouteTeacher extends PageRouteInfo<RouteTeacherArgs> {
  RouteTeacher({Key? key})
      : super(
          RouteTeacher.name,
          path: 'TeacherList',
          args: RouteTeacherArgs(key: key),
        );

  static const String name = 'RouteTeacher';
}

class RouteTeacherArgs {
  const RouteTeacherArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteTeacherArgs{key: $key}';
  }
}

/// generated route for
/// [PageRegistrationTeacher]
class RouteRegistrationTeacher
    extends PageRouteInfo<RouteRegistrationTeacherArgs> {
  RouteRegistrationTeacher({
    Key? key,
    TeacherModel? model,
  }) : super(
          RouteRegistrationTeacher.name,
          path: 'RegistrationTeacher',
          args: RouteRegistrationTeacherArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'RouteRegistrationTeacher';
}

class RouteRegistrationTeacherArgs {
  const RouteRegistrationTeacherArgs({
    this.key,
    this.model,
  });

  final Key? key;

  final TeacherModel? model;

  @override
  String toString() {
    return 'RouteRegistrationTeacherArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [PageAdmin]
class RouteAdmin extends PageRouteInfo<RouteAdminArgs> {
  RouteAdmin({Key? key})
      : super(
          RouteAdmin.name,
          path: 'AdminList',
          args: RouteAdminArgs(key: key),
        );

  static const String name = 'RouteAdmin';
}

class RouteAdminArgs {
  const RouteAdminArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteAdminArgs{key: $key}';
  }
}

/// generated route for
/// [PageRegistrationAdmin]
class RouteRegistrationAdmin extends PageRouteInfo<RouteRegistrationAdminArgs> {
  RouteRegistrationAdmin({
    Key? key,
    ExecutiveModel? model,
  }) : super(
          RouteRegistrationAdmin.name,
          path: 'RegistrationAdmin',
          args: RouteRegistrationAdminArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'RouteRegistrationAdmin';
}

class RouteRegistrationAdminArgs {
  const RouteRegistrationAdminArgs({
    this.key,
    this.model,
  });

  final Key? key;

  final ExecutiveModel? model;

  @override
  String toString() {
    return 'RouteRegistrationAdminArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [PageBranch]
class RouteBranch extends PageRouteInfo<RouteBranchArgs> {
  RouteBranch({Key? key})
      : super(
          RouteBranch.name,
          path: 'BranchList',
          args: RouteBranchArgs(key: key),
        );

  static const String name = 'RouteBranch';
}

class RouteBranchArgs {
  const RouteBranchArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteBranchArgs{key: $key}';
  }
}

/// generated route for
/// [PageRegistrationBranch]
class RouteRegistrationBranch
    extends PageRouteInfo<RouteRegistrationBranchArgs> {
  RouteRegistrationBranch({
    Key? key,
    BranchModel? model,
  }) : super(
          RouteRegistrationBranch.name,
          path: 'RegistrationBranch',
          args: RouteRegistrationBranchArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'RouteRegistrationBranch';
}

class RouteRegistrationBranchArgs {
  const RouteRegistrationBranchArgs({
    this.key,
    this.model,
  });

  final Key? key;

  final BranchModel? model;

  @override
  String toString() {
    return 'RouteRegistrationBranchArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [PageGroup]
class RouteGroup extends PageRouteInfo<RouteGroupArgs> {
  RouteGroup({
    Key? key,
    required String? type,
    required String? title,
  }) : super(
          RouteGroup.name,
          path: 'GroupList',
          args: RouteGroupArgs(
            key: key,
            type: type,
            title: title,
          ),
        );

  static const String name = 'RouteGroup';
}

class RouteGroupArgs {
  const RouteGroupArgs({
    this.key,
    required this.type,
    required this.title,
  });

  final Key? key;

  final String? type;

  final String? title;

  @override
  String toString() {
    return 'RouteGroupArgs{key: $key, type: $type, title: $title}';
  }
}

/// generated route for
/// [PageRegistrationGroup]
class RouteRegistrationGroup extends PageRouteInfo<RouteRegistrationGroupArgs> {
  RouteRegistrationGroup({
    Key? key,
    GroupModel? model,
    String? title,
  }) : super(
          RouteRegistrationGroup.name,
          path: 'RegistrationGroup',
          args: RouteRegistrationGroupArgs(
            key: key,
            model: model,
            title: title,
          ),
        );

  static const String name = 'RouteRegistrationGroup';
}

class RouteRegistrationGroupArgs {
  const RouteRegistrationGroupArgs({
    this.key,
    this.model,
    this.title,
  });

  final Key? key;

  final GroupModel? model;

  final String? title;

  @override
  String toString() {
    return 'RouteRegistrationGroupArgs{key: $key, model: $model, title: $title}';
  }
}

/// generated route for
/// [PageSchool]
class RouteSchool extends PageRouteInfo<RouteSchoolArgs> {
  RouteSchool({Key? key})
      : super(
          RouteSchool.name,
          path: 'SchoolList',
          args: RouteSchoolArgs(key: key),
        );

  static const String name = 'RouteSchool';
}

class RouteSchoolArgs {
  const RouteSchoolArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteSchoolArgs{key: $key}';
  }
}

/// generated route for
/// [PageSchoolRegistration]
class RouteSchoolRegistration
    extends PageRouteInfo<RouteSchoolRegistrationArgs> {
  RouteSchoolRegistration({
    Key? key,
    SchoolModel? model,
  }) : super(
          RouteSchoolRegistration.name,
          path: 'RegistrationSchool',
          args: RouteSchoolRegistrationArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'RouteSchoolRegistration';
}

class RouteSchoolRegistrationArgs {
  const RouteSchoolRegistrationArgs({
    this.key,
    this.model,
  });

  final Key? key;

  final SchoolModel? model;

  @override
  String toString() {
    return 'RouteSchoolRegistrationArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [PageSocialNetwork]
class RouteSocialNetwork extends PageRouteInfo<RouteSocialNetworkArgs> {
  RouteSocialNetwork({Key? key})
      : super(
          RouteSocialNetwork.name,
          path: 'SocialList',
          args: RouteSocialNetworkArgs(key: key),
        );

  static const String name = 'RouteSocialNetwork';
}

class RouteSocialNetworkArgs {
  const RouteSocialNetworkArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteSocialNetworkArgs{key: $key}';
  }
}

/// generated route for
/// [PageSocialNetworkLayout]
class RouteSocialNetworkLayout extends PageRouteInfo<void> {
  const RouteSocialNetworkLayout()
      : super(
          RouteSocialNetworkLayout.name,
          path: 'PageSocialNetworkLayout',
        );

  static const String name = 'RouteSocialNetworkLayout';
}

/// generated route for
/// [PageVideoPlayerWidget]
class RouteVideoPlayerWidget extends PageRouteInfo<RouteVideoPlayerWidgetArgs> {
  RouteVideoPlayerWidget({
    Key? key,
    String? videoUrl,
  }) : super(
          RouteVideoPlayerWidget.name,
          path: 'PageVideoPlayerWidget',
          args: RouteVideoPlayerWidgetArgs(
            key: key,
            videoUrl: videoUrl,
          ),
        );

  static const String name = 'RouteVideoPlayerWidget';
}

class RouteVideoPlayerWidgetArgs {
  const RouteVideoPlayerWidgetArgs({
    this.key,
    this.videoUrl,
  });

  final Key? key;

  final String? videoUrl;

  @override
  String toString() {
    return 'RouteVideoPlayerWidgetArgs{key: $key, videoUrl: $videoUrl}';
  }
}

/// generated route for
/// [PageNoticeRegistration]
class RouteNoticeRegistration
    extends PageRouteInfo<RouteNoticeRegistrationArgs> {
  RouteNoticeRegistration({Key? key})
      : super(
          RouteNoticeRegistration.name,
          path: 'NoticeRegistration',
          args: RouteNoticeRegistrationArgs(key: key),
        );

  static const String name = 'RouteNoticeRegistration';
}

class RouteNoticeRegistrationArgs {
  const RouteNoticeRegistrationArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteNoticeRegistrationArgs{key: $key}';
  }
}
