// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:kidszone_app/presentation/pages/message_process/page_messages.dart';
// import 'package:kidszone_app/presentation/pages/accounting_process/page_student_accounting.dart';
// import 'package:kidszone_app/presentation/pages/health_process/page_health_process.dart';
// import 'package:kidszone_app/views/authenticate/login/view/page_login.dart';
// import 'package:kidszone_app/views/authenticate/login_security/view/page_login_security.dart';
// import 'package:kidszone_app/views/authenticate/onboard/view/page_welcome.dart';
// import 'package:kidszone_app/views/education/daily_school_report/view/page_daily_report_classrooms.dart';
// import 'package:kidszone_app/views/education/daily_school_report/view/page_registration_daily_report.dart';
// import 'package:kidszone_app/views/home/announcement/view/notice_view.dart';
// import 'package:kidszone_app/views/home/announcement/view/page_notice_registration.dart';
// import 'package:kidszone_app/views/other_operations/settings/view/pages_settings.dart';
// import 'package:kidszone_app/views/profile/accounting_operations/view/page_profile_accounting.dart';
// import 'package:kidszone_app/views/profile/education_operations/view/page_profile_education_process.dart';
// import 'package:kidszone_app/views/profile/main_profile/view/page_profile.dart';
// import 'package:kidszone_app/views/profile/other_operations/view/page_profile_other_options.dart';
// import 'package:kidszone_app/views/profile/registration_operations/view/page_profile_registration_process.dart';
// import 'package:kidszone_app/views/profile/school_operations/view/page_profile_school_process.dart';
// import 'package:kidszone_app/views/registration/class_room/view/page_registration_classroom.dart';
// import 'package:kidszone_app/views/registration/class_room/view/page_classroom.dart';
// import 'package:kidszone_app/views/registration/custodian/view/page_registration_parent.dart';
// import 'package:kidszone_app/views/registration/custodian/view/page_parent.dart';
// import 'package:kidszone_app/views/registration/lesson/view/page_lesson.dart';
// import 'package:kidszone_app/views/registration/lesson/view/page_registration_lesson.dart';
// import 'package:kidszone_app/views/registration/executive/view/page_registration_executive.dart';
// import 'package:kidszone_app/views/registration/executive/view/page_executive.dart';
// import 'package:kidszone_app/views/registration/pre_registration/pre_registration_notes/view/page_registration_preregistration_notes.dart';
// import 'package:kidszone_app/views/registration/pre_registration/pre_registration_notes/view/page_preregistration_notes.dart';
// import 'package:kidszone_app/views/registration/pre_registration/view/page_registration_preregistration.dart';
// import 'package:kidszone_app/views/registration/pre_registration/view/page_preregistration.dart';
// import 'package:kidszone_app/views/registration/service_station/view/page_registration_school_bus.dart';
// import 'package:kidszone_app/views/registration/service_station/view/page_school_bus.dart';
// import 'package:kidszone_app/views/registration/student/view/page_registration_student.dart';
// import 'package:kidszone_app/views/registration/student/view/page_student.dart';
// import 'package:kidszone_app/views/registration/teacher/view/page_registration_teacher.dart';
// import 'package:kidszone_app/views/registration/teacher/view/page_teacher.dart';
// import 'package:kidszone_app/views/school_operations/admin/view/page_admin.dart';
// import 'package:kidszone_app/views/school_operations/admin/view/page_registration_admin.dart';
// import 'package:kidszone_app/views/school_operations/branch/view/page_branch.dart';
// import 'package:kidszone_app/views/school_operations/group_operations/view/page_group.dart';
// import 'package:kidszone_app/views/school_operations/group_operations/view/page_registration_group.dart';
// import 'package:kidszone_app/views/school_operations/school/view/page_registration_school.dart';
// import 'package:kidszone_app/views/school_operations/school/view/page_school.dart';

// Map<String, WidgetBuilder> routes() {
//   return <String, WidgetBuilder>{
//     PageLogin.tag: (_) => PageLogin(),
//     PageLoginSecurity.tag: (_) => PageLoginSecurity(),
//     PageNoticeRegistration.tag: (_) => PageNoticeRegistration(),
//     PageSchool.tags: (_) => PageSchool(),
//     PageSchoolRegistration.tag: (_) => PageSchoolRegistration(),
//     PageProfile.tag: (_) => PageProfile(),
//     PageProfileRegistrationProcess.tag: (_) => PageProfileRegistrationProcess(), //refactor error
//     PageProfileEducationProcess.tag: (_) => PageProfileEducationProcess(), //refactor error
//     PageProfileSchoolProcess.tag: (_) => PageProfileSchoolProcess(),
//     PageProfileOtherOptions.tag: (_) => PageProfileOtherOptions(), //refactor error
//     PageProfileAccountingProcess.tag: (_) => PageProfileAccountingProcess(),
//     PageBranch.tags: (_) => PageBranch(),
//     PageRegistrationPreregistration.tag: (_) => PageRegistrationPreregistration(),
//     PagePreregistration.tags: (_) => PagePreregistration(),
//     PageStudy.tags: (_) => PageStudy(),
//     PageRegistrationStudent.tag: (_) => PageRegistrationStudent(),
//     PageRegistrationPreregistrationNotes.tag: (_) => PageRegistrationPreregistrationNotes(),
//     PagePreregistrationNotes.tag: (_) => PagePreregistrationNotes(),
//     PageTeacher.tag: (_) => PageTeacher(),
//     PageRegistrationTeacher.tag: (_) => PageRegistrationTeacher(),
//     PageParent.tags: (_) => PageParent(),
//     PageRegistrationParent.tag: (_) => PageRegistrationParent(),
//     PageLesson.tags: (_) => PageLesson(),
//     PageRegistrationLesson.tag: (_) => PageRegistrationLesson(),
//     PageClassroom.tags: (_) => PageClassroom(),
//     PageRegistrationClassroom.tag: (_) => PageRegistrationClassroom(),
//     PageExecutive.tag: (_) => PageExecutive(),
//     PageRegistrationExecutive.tag: (_) => PageRegistrationExecutive(),
//     PageSchoolBus.tag: (_) => PageSchoolBus(),
//     PageRegistrationSchoolBus.tag: (_) => PageRegistrationSchoolBus(),
//     PagesSettings.tag: (_) => PagesSettings(),
//     PageMessages.tag: (_) => PageMessages(),
//     // PageRegistrationDailyReport.tag: (_) => PageRegistrationDailyReport(),
//     PageRegistrationGroup.tag: (_) => PageRegistrationGroup(),
//     PageGroup.tag: (_) => PageGroup(),
//     PageAdmin.tag: (_) => PageAdmin(),
//     PageRegistrationAdmin.tag: (_) => PageRegistrationAdmin(),
//     //PageGunlukKarneSablon.tag: (_) => PageGunlukKarneSablon(),
//     PageHealthProcess.tag: (_) => PageHealthProcess(),
//     PageStudentAccounting.tag: (_) => PageStudentAccounting(),
//     PageDailyReportClassrooms.tag: (_) => PageDailyReportClassrooms(),
//     PageNotiveView.tags: (_) => PageNotiveView(),
//   };
// }
