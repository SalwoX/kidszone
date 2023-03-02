import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../other_operations/food/view/page_add_food_list.dart';
import '../../profile/accounting_operations/items/view/page_profile_accounting.dart';

import '../../authenticate/login/view/page_login.dart';
import '../../authenticate/login_security/view/page_login_security.dart';
import '../../authenticate/onboard/view/page_welcome.dart';
import '../../education/daily_school_report/model/reports.dart';
import '../../education/daily_school_report/view/page_daily_report.dart';
import '../../education/daily_school_report/view/page_edit_report.dart';
import '../../education/daily_school_report/view/page_selection_student.dart';
import '../../education/roll_call/model/attendance_model.dart';
import '../../education/roll_call/view/page_attendance_list.dart';
import '../../education/roll_call/view/page_attendance_list_detail.dart';
import '../../health_operations/view/page_health_process.dart';
import '../../home/announcement/view/notice_view.dart';
import '../../home/announcement/view/page_notice_registration.dart';
import '../../message_process/view/page_message_detail.dart';
import '../../message_process/view/page_messages.dart';
import '../../other_operations/attendance/view/page_attendance_process.dart';
import '../../other_operations/food/view/page_food_list.dart';
import '../../other_operations/lesson/view/page_lesson_hours.dart';
import '../../other_operations/settings/model/settings_model.dart';
import '../../other_operations/settings/view/pages_settings.dart';
import '../../profile/accounting_operations/accounting_statistics/view/page_accounting_statistics.dart';
import '../../profile/accounting_operations/settings/view/page_accoungint_settings.dart';
import '../../profile/accounting_operations/show_payments/view/page_show_payments.dart';
import '../../profile/accounting_operations/registration_accounting/view/page_registration_accounting.dart';
import '../../profile/accounting_operations/student_accounting/view/page_student_accounting.dart';
import '../../profile/education_operations/view/page_profile_education_process.dart';
import '../../profile/main_profile/view/page_profile.dart';
import '../../profile/other_operations/view/page_profile_other_options.dart';
import '../../profile/registration_operations/view/page_profile_registration_process.dart';
import '../../profile/school_operations/view/page_profile_school_process.dart';
import '../../registration/class_room/model/classroom_model.dart';
import '../../registration/class_room/view/page_classroom.dart';
import '../../registration/class_room/view/page_registration_classroom.dart';
import '../../registration/custodian/model/parent_model.dart';
import '../../registration/custodian/view/page_parent.dart';
import '../../registration/custodian/view/page_registration_parent.dart';
import '../../registration/executive/model/executive_model.dart';
import '../../registration/executive/view/page_executive.dart';
import '../../registration/executive/view/page_registration_executive.dart';
import '../../registration/lesson/model/lesson_model.dart';
import '../../registration/lesson/view/page_lesson.dart';
import '../../registration/lesson/view/page_registration_lesson.dart';
import '../../registration/pre_registration/model/preregistration_model.dart';
import '../../registration/pre_registration/pre_registration_notes/model/preregistration_notes_model.dart';
import '../../registration/pre_registration/pre_registration_notes/view/page_preregistration_notes.dart';
import '../../registration/pre_registration/pre_registration_notes/view/page_registration_preregistration_notes.dart';
import '../../registration/pre_registration/view/page_preregistration.dart';
import '../../registration/pre_registration/view/page_registration_preregistration.dart';
import '../../registration/service_station/model/school_bus_model.dart';
import '../../registration/service_station/view/page_registration_school_bus.dart';
import '../../registration/service_station/view/page_school_bus.dart';
import '../../registration/student/model/student_model.dart';
import '../../registration/student/view/page_registration_student.dart';
import '../../registration/student/view/page_student.dart';
import '../../registration/teacher/model/teacher_model.dart';
import '../../registration/teacher/view/page_registration_teacher.dart';
import '../../registration/teacher/view/page_teacher.dart';
import '../../school_operations/admin/view/page_admin.dart';
import '../../school_operations/admin/view/page_registration_admin.dart';
import '../../school_operations/branch/model/branch_model.dart';
import '../../school_operations/branch/view/page_branch.dart';
import '../../school_operations/branch/view/page_registration_branch.dart';
import '../../school_operations/group_operations/model/group_model.dart';
import '../../school_operations/group_operations/view/page_group.dart';
import '../../school_operations/group_operations/view/page_registration_group.dart';
import '../../school_operations/school/model/school_model.dart';
import '../../school_operations/school/view/page_registration_school.dart';
import '../../school_operations/school/view/page_school.dart';
import '../../social_network/view/page_share.dart';
import '../../social_network/view/page_social_network.dart';
import '../../social_network/view/page_social_network_layout.dart';
import '../components/video/video_player_widget.dart';
import '../models/user_model.dart';
import 'auth_guard.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: PageWelcome,
      path: 'default',
      name: 'default',
      initial: true,
    ),
    AutoRoute(page: PageLogin, path: 'login'),
    AutoRoute(page: PageLoginSecurity, path: 'login_security'),
    AutoRoute(
      page: PageNoticeView,
      path: 'homePage',
      guards: [AuthGuard],
      children: [
        // AutoRoute(page: UserDetailView, path: ':id'),
      ],
    ),
    AutoRoute(
        initial: true,
        page: PageProfile,
        name: 'MainProfile',
        path: 'MainProfile',
        guards: [AuthGuard]),
    AutoRoute(
        page: PageProfileAccounting,
        path: 'ProfileAccounting',
        guards: [AuthGuard]),
    AutoRoute(
        page: PageProfileEducationProcess,
        path: 'ProfileEducationProcess',
        guards: [AuthGuard]),
    AutoRoute(
        page: PageProfileOtherOptions,
        path: 'ProfileOtherOptions',
        guards: [AuthGuard]),
    AutoRoute(page: PageFoodList, path: 'FoodList', guards: [AuthGuard]),
    AutoRoute(
        page: PageProfileRegistrationProcess,
        path: 'ProfileRegistrationProcess',
        guards: [AuthGuard]),
    AutoRoute(
        page: PageProfileSchoolProcess,
        path: 'ProfileSchoolProcess',
        guards: [AuthGuard]),

    AutoRoute(page: PageMessages, path: 'Messages'),

    AutoRoute(page: PageAccountingSettings, path: 'AccountingSettings'),
    AutoRoute(page: PageShowPayments, path: 'ShowPayments'),
    AutoRoute(page: PageAccountingStatistics, path: 'AccountingStatistics'),
    AutoRoute(page: PageStudentAccounting, path: 'StudentAccounting'),
    AutoRoute(page: PageRegistrationAccounting, path: 'RegistrationAccounting'),
    //  AutoRoute(page: PageRegistrationClassroom, name: 'DailyReportClassRooms', path: 'DailyReportClassRooms'),
    AutoRoute(page: PageMessageDetail, path: 'MessageDetail'),
    AutoRoute(page: PageAttendanceList, path: 'AttendanceList'),
    AutoRoute(page: PageAttendanceListDetail, path: 'AttendanceListDetail'),
    AutoRoute(page: PageHealthProcess, path: 'HealthProcess'),
    AutoRoute(page: PageSelectionStudent, path: 'SelectionStudent'),
    AutoRoute(page: PageDailyReport, path: 'DailyReport'),
    AutoRoute(page: PageAddFoodList, path: 'AddFoodList'),

    AutoRoute(page: PageShare, path: 'Share', guards: [AuthGuard]),

    AutoRoute(page: PageEditReport, path: 'EditReport'),

    AutoRoute(page: PageHealthProcess, path: 'HealthProcess'),

    AutoRoute(page: PageAttendanceProcess, path: 'AttendanceProcess'),

    AutoRoute(page: PageLessonHours, path: 'LessonHours'),

    AutoRoute(page: PagesSettings, path: 'Settings'),

    AutoRoute(page: PageClassroom, path: 'ClassRoomList'),
    AutoRoute(page: PageRegistrationClassroom, path: 'RegistrationClassroom'),

    AutoRoute(page: PageParent, path: 'ParentList'),
    AutoRoute(page: PageRegistrationParent, path: 'RegistrationClassroom'),

    AutoRoute(page: PageExecutive, path: 'ExecutiveList'),
    AutoRoute(page: PageRegistrationExecutive, path: 'RegistrationExecutive'),

    AutoRoute(page: PagePreregistration, path: 'Preregistration'),
    AutoRoute(
        page: PageRegistrationPreregistration,
        path: 'RegistrationPreregistration'),

    AutoRoute(page: PagePreregistrationNotes, path: 'PreregistrationNotes'),
    AutoRoute(
        page: PageRegistrationPreregistrationNotes,
        path: 'RegistrationPreregistrationNotes'),

    AutoRoute(page: PageLesson, path: 'LessonList'),
    AutoRoute(page: PageRegistrationLesson, path: 'RegistrationLesson'),

    AutoRoute(page: PageSchoolBus, path: 'SchoolBus'),
    AutoRoute(page: PageRegistrationSchoolBus, path: 'RegistrationSchoolBus'),

    AutoRoute(page: PageStudent, path: 'StudentList'),
    AutoRoute(page: PageRegistrationStudent, path: 'RegistrationStudent'),

    AutoRoute(page: PageTeacher, path: 'TeacherList'),
    AutoRoute(page: PageRegistrationTeacher, path: 'RegistrationTeacher'),

    AutoRoute(page: PageAdmin, path: 'AdminList'),
    AutoRoute(page: PageRegistrationAdmin, path: 'RegistrationAdmin'),
    AutoRoute(page: PageBranch, path: 'BranchList'),
    AutoRoute(page: PageRegistrationBranch, path: 'RegistrationBranch'),
    AutoRoute(page: PageGroup, path: 'GroupList'),
    AutoRoute(page: PageRegistrationGroup, path: 'RegistrationGroup'),
    AutoRoute(page: PageSchool, path: 'SchoolList'),
    AutoRoute(page: PageSchoolRegistration, path: 'RegistrationSchool'),
    AutoRoute(page: PageSocialNetwork, path: 'SocialList'),
    //responsive Örneği
    AutoRoute(page: PageSocialNetworkLayout, path: 'PageSocialNetworkLayout'),
    AutoRoute(page: PageVideoPlayerWidget, path: 'PageVideoPlayerWidget'),

    // AutoRoute(initial: true, page: UserView, path: 'userView'),
    AutoRoute(page: PageNoticeRegistration, path: 'NoticeRegistration'),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter({required super.authGuard});
}

class EmptyPageRouter extends AutoRouter {
  const EmptyPageRouter({super.key});
}

/*
Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    PageLogin.tag: (_) => PageLogin(),
    PageLoginSecurity.tag: (_) => PageLoginSecurity(),
    PageNoticeRegistration.tag: (_) => PageNoticeRegistration(),
    PageSchool.tags: (_) => PageSchool(),
    PageSchoolRegistration.tag: (_) => PageSchoolRegistration(),
    PageProfile.tag: (_) => PageProfile(),
    PageProfileRegistrationProcess.tag: (_) => PageProfileRegistrationProcess(), //refactor error
    PageProfileEducationProcess.tag: (_) => PageProfileEducationProcess(), //refactor error
    PageProfileSchoolProcess.tag: (_) => PageProfileSchoolProcess(),
    PageProfileOtherOptions.tag: (_) => PageProfileOtherOptions(), //refactor error
    PageProfileAccountingProcess.tag: (_) => PageProfileAccountingProcess(),
    PageBranch.tags: (_) => PageBranch(),
    PageRegistrationPreregistration.tag: (_) => PageRegistrationPreregistration(),
    PagePreregistration.tags: (_) => PagePreregistration(),
    PageStudy.tags: (_) => PageStudy(),
    PageRegistrationStudent.tag: (_) => PageRegistrationStudent(),
    PageRegistrationPreregistrationNotes.tag: (_) => PageRegistrationPreregistrationNotes(),
    PagePreregistrationNotes.tag: (_) => PagePreregistrationNotes(),
    PageTeacher.tag: (_) => PageTeacher(),
    PageRegistrationTeacher.tag: (_) => PageRegistrationTeacher(),
    PageParent.tags: (_) => PageParent(),
    PageRegistrationParent.tag: (_) => PageRegistrationParent(),
    PageLesson.tags: (_) => PageLesson(),
    PageRegistrationLesson.tag: (_) => PageRegistrationLesson(),
    PageClassroom.tags: (_) => PageClassroom(),
    PageRegistrationClassroom.tag: (_) => PageRegistrationClassroom(),
    PageExecutive.tag: (_) => PageExecutive(),
    PageRegistrationExecutive.tag: (_) => PageRegistrationExecutive(),
    PageSchoolBus.tag: (_) => PageSchoolBus(),
    PageRegistrationSchoolBus.tag: (_) => PageRegistrationSchoolBus(),
    PagesSettings.tag: (_) => PagesSettings(),
    PageMessages.tag: (_) => PageMessages(),
   // PageRegistrationDailyReport.tag: (_) => PageRegistrationDailyReport(),
    PageRegistrationGroup.tag: (_) => PageRegistrationGroup(),
    PageGroup.tag: (_) => PageGroup(),
    PageAdmin.tag: (_) => PageAdmin(),
    PageRegistrationAdmin.tag: (_) => PageRegistrationAdmin(),
    //PageGunlukKarneSablon.tag: (_) => PageGunlukKarneSablon(),
    PageHealthProcess.tag: (_) => PageHealthProcess(),
    PageStudentAccounting.tag: (_) => PageStudentAccounting(),
    PageDailyReportClassrooms.tag: (_) => PageDailyReportClassrooms(),
    PageNotiveView.tags: (_) => PageNotiveView(),
  };
}

*/
