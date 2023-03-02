import '../../common/app_config.dart';

enum UrlEnum {
  login_phone('Users/Authenticate'),
  login_security_code('Users/AuthenticateSecurityCode'),
  classroom_getlist('Classroom/GetList'),
  classroom_getlist_teacher_dependent_classes('Classroom/GetAllTeacherDependentClasses'),
  notice_getlist('Notices/GetList'),
  notices_addorupdate('Notices/AddOrUpdate'),
  school_getlist('School/GetList'),
  school_addorupdate('School/AddOrUpdate'),
  school_package('Common/SchoolPackage'),
  branch_getlist('Branch/GetList'),
  branch_addorupdate('Branch/AddOrUpdate'),
  branch_delete('Branch/Delete'),
  preregistration_getlist('Preregistration/GetList'),
  preregistration_addorupdate('Preregistration/AddOrUpdate'),
  preregistration_delete('Preregistration/Delete'),
  syllabus_getlist('Syllabus/GetList'),
  syllabusdetails_getlist('SyllabusDetails/GetList'),
  lessonhours_getlist('LessonHours/GetList'),
  lessonhoursdetails_getlist('LessonHoursDetails/GetList'),
  notices_getlist('Notices/GetList'),
  share_getlist('Share/GetList'),
  studentaccounting_getlist('StudentAccounting/GetList'),
  homework_getlist('Homework/GetList'),
  student_getlist('Student/GetList'),
  attendance_getlist('Attendance/GetList'),
  Survey_getlist('Survey/GetList'),
  lesson_getlist('Lesson/GetList'),
  term_getlist('Term/GetList'),
  schoolbus_getlist('SchoolBus/GetList'),
  executive_getlist('Executive/GetList'),
  settings_get('Settings/get'),
  group_getlist('Group/GetList'),
  dailyreport_getlist('DailyReport/GetList'),
  dailyreport_get('DailyReport/Get'),
  medicament_getlist('Medicament/GetList'),
  message_getlist('Message/GetList'),
  homeworktracking_getlist('HomeworkTracking/GetList'),
  homeworkprocess_getlist('HomeworkProcess/GetList'),
  studentdelivery_getlist('StudentDelivery/GetList'),
  teacher_getlist('Teacher/GetList'),
  teacherprogram_getlist('TeacherProgram/GetList'),
  teacheragreement_getlist('TeacherAgreement/GetList'),
  preregistrationnotes_getlist('PreregistrationNotes/GetList'),
  guide_getlist('Guide/GetList'),
  template_getlist('Template/GetList'),
  template_get('Template/Get'),
  health_getlist('Health/GetList'),
  health_get('Health/Get'),
  healthdetail_getlist('HealthDetail/GetList'),
  healthmovement_getlist('HealthMovement/GetList'),
  classroomprogram_getlist('ClassroomProgram/GetList'),
  socialnetwork_getlist('SocialNetwork/GetList'),
  agreement_getlist('Agreement/GetList'),
  collection_getlist('Collection/GetList'),
  installmenttable_getlist('InstallmentTable/GetList'),
  parent_getlist('Parent/GetList'),
  food_getlist('Food/GetList'),
  permission_getlist('Permission/GetList'),
  syllabus_addorupdate('Syllabus/AddOrUpdate'),
  syllabusdetail_addorupdate('SyllabusDetail/AddOrUpdate'),
  lessonhours_addorupdate('LessonHours/AddOrUpdate'),
  lessonhoursdetail_addorupdate('LessonHoursDetail/AddOrUpdate'),
  share_addorupdate('Share/AddOrUpdate'),
  studentaccounting_addorupdate('StudentAccounting/AddOrUpdate'),
  homework_addorupdate('Homework/AddOrUpdate'),
  student_addorupdate('Student/AddOrUpdate'),
  attendance_addorupdate('Attendance/AddOrUpdate'),
  Survey_addorupdate('Survey/AddOrUpdate'),
  lesson_addorupdate('Lesson/AddOrUpdate'),
  term_addorupdate('Term/AddOrUpdate'),
  schoolbus_addorupdate('SchoolBus/AddOrUpdate'),
  classroom_addorupdate('Classroom/AddOrUpdate'),
  executive_addorupdate('Executive/AddOrUpdate'),
  settings_addorupdate('Settings/AddOrUpdate'),
  group_addorupdate('Group/AddOrUpdate'),
  dailyreport_addorupdate('DailyReport/AddOrUpdate'),
  medicament_addorupdate('Medicament/AddOrUpdate'),
  message_addorupdate('Message/AddOrUpdate'),
  homeworktracking_addorupdate('HomeworkTracking/AddOrUpdate'),
  homeworkprocess_addorupdate('HomeworkProcess/AddOrUpdate'),
  studentdelivery_addorupdate('StudentDelivery/AddOrUpdate'),
  teacher_addorupdate('Teacher/AddOrUpdate'),
  teacherprogram_addorupdate('Teacher/AddOrUpdate'),
  teacheragreement_addorupdate('TeacherAgreement/AddOrUpdate'),
  preregistrationnotes_addorupdate('PreregistrationNotes/AddOrUpdate'),
  guide_addorupdate('Guide/AddOrUpdate'),
  template_addorupdate('Template/AddOrUpdate'),
  health_addorupdate('Health/AddOrUpdate'),
  healthdetail_addorupdate('HealthDetail/AddOrUpdate'),
  healthmovement_addorupdate('HealthMovement/AddOrUpdate'),
  classroomprogram_addorupdate('ClassroomProgram/AddOrUpdate'),
  socialnetwork_addorupdate('SocialNetwork/AddOrUpdate'),
  agreement_addorupdate('Agreement/AddOrUpdate'),
  collection_addorupdate('Collection/AddOrUpdate'),
  installmenttable_addorupdate('InstallmentTable/AddOrUpdate'),
  parent_addorupdate('Parent/AddOrUpdate'),
  food_addorupdate('Food/AddOrUpdate'),
  permission_addorupdate('Permission/AddOrUpdate'),
  syllabus_delete('Syllabus/Delete'),
  syllabusdetail_delete('SyllabusDetail/Delete'),
  lessonhours_delete('LessonHours/Delete'),
  lessonhoursdetail_delete('LessonHoursDetail/Delete'),
  notices_delete('Notices/Delete'),
  share_delete('Share/Delete'),
  studentaccounting_delete('StudentAccounting/Delete'),
  homework_delete('Homework/Delete'),
  student_delete('Student/Delete'),
  attendance_delete('Attendance/Delete'),
  Survey_delete('Survey/Delete'),
  lesson_delete('Lesson/Delete'),
  term_delete('Term/Delete'),
  schoolbus_delete('SchoolBus/Delete'),
  classroom_delete('Classroom/Delete'),
  executive_delete('Executive/Delete'),
  settings_delete('Settings/Delete'),
  group_delete('Group/Delete'),
  dailyreport_delete('DailyReport/Delete'),
  medicament_delete('Medicament/Delete'),
  message_delete('Message/Delete'),
  homeworktracking_delete('HomeworkTracking/Delete'),
  homeworkprocess_delete('HomeworkProcess/Delete'),
  studentdelivery_delete('StudentDelivery/Delete'),
  teacher_delete('Teacher/Delete'),
  teacherprogram_delete('TeacherProgram/Delete'),
  teacheragreement_delete('TeacherAgreement/Delete'),
  school_delete('School/Delete'),
  preregistrationnotes_delete('PreregistrationNotes/Delete'),
  guide_delete('Guide/Delete'),
  template_delete('Template/Delete'),
  health_delete('Health/Delete'),
  healthdetail_delete('HealthDetail/Delete'),
  healthmovement_delete('HealthMovement/Delete'),
  classroomprogram_delete('ClassroomProgram/Delete'),
  socialnetwork_delete('SocialNetwork/Delete'),
  agreement_delete('Agreement/Delete'),
  collection_delete('Collection/Delete'),
  installmenttable_delete('InstallmentTable/Delete'),
  parent_delete('Parent/Delete'),
  food_delete('Food/Delete'),
  permission_delete('Permission/Delete'),
  daily_report_template_get('DailyReport/GetReportTemplate'),
  daily_report_template_addorupdate('DailyReport/AddOrUpdateTemplate');

  final String path;
  const UrlEnum(this.path);
  String withBaseUrl() {
    return '$SuffixUrl/' + this.path;
  }
}

// const Map<UrlEnum, String> UrlGetPath = {
//   UrlEnum.okul_paket: "$UrlSonEk/Common/OkulPaket",
//   UrlEnum.login_phone: "$UrlSonEk/Users/Authenticate",
//   UrlEnum.login_security_code: "$UrlSonEk/Users/AuthenticateSecurityCode",
//   UrlEnum.duyuru_getlist: "$UrlSonEk/Duyurular/GetList",
//   UrlEnum.duyurular_addorupdate: "$UrlSonEk/Duyurular/AddOrUpdate",
//   UrlEnum.sinif_getlist: "$UrlSonEk/Sinif/GetList",
//   UrlEnum.okul_getlist: "$UrlSonEk/Okul/GetList",
//   UrlEnum.okul_addorupdate: "$UrlSonEk/Okul/AddOrUpdate",
//   UrlEnum.sube_getlist: "$UrlSonEk/Sube/GetList",
//   UrlEnum.sube_addorupdate: "$UrlSonEk/Sube/AddOrUpdate",
//   UrlEnum.sube_delete: "$UrlSonEk/Sube/Delete",
//   UrlEnum.onkayit_getlist: "$UrlSonEk/OnKayit/GetList",
//   UrlEnum.onkayit_addorupdate: "$UrlSonEk/OnKayit/AddOrUpdate",
//   UrlEnum.onkayit_delete: "$UrlSonEk/OnKayit/Delete",
//   UrlEnum.dersprogramidetay_getlist: "$UrlSonEk/DersProgramiDetay/GetList",
//   UrlEnum.derssaatleri_getlist: "$UrlSonEk/DersSaatleri/GetList",
//   UrlEnum.derssaatleridetay_getlist: "$UrlSonEk/DersSaatleriDetay/GetList",
//   UrlEnum.duyurular_getlist: "$UrlSonEk/Duyurular/GetList",
//   UrlEnum.paylasimyap_getlist: "$UrlSonEk/PaylasimYap/GetList",
//   UrlEnum.ogrencimuhasebesi_getlist: "$UrlSonEk/OgrenciMuhasebesi/GetList",
//   UrlEnum.odev_getlist: "$UrlSonEk/Odev/GetList",
//   UrlEnum.ogrenci_getlist: "$UrlSonEk/Ogrenci/GetList",
//   UrlEnum.yoklama_getlist: "$UrlSonEk/Yoklama/GetList",
//   UrlEnum.anket_getlist: "$UrlSonEk/Anket/GetList",
//   UrlEnum.ders_getlist: "$UrlSonEk/Ders/GetList",
//   UrlEnum.donem_getlist: "$UrlSonEk/Donem/GetList",
//   UrlEnum.servis_getlist: "$UrlSonEk/Servis/GetList",
//   UrlEnum.yonetici_getlist: "$UrlSonEk/Yonetici/GetList",
//   UrlEnum.ayarlar_get: "$UrlSonEk/Ayarlar/get",
//   UrlEnum.grup_getlist: "$UrlSonEk/Grup/GetList",
//   UrlEnum.gunlukkarne_getlist: "$UrlSonEk/GunlukKarne/GetList",
//   UrlEnum.gunlukkarne_get: "$UrlSonEk/GunlukKarne/Get",
//   UrlEnum.ilac_getlist: "$UrlSonEk/Ilac/GetList",
//   UrlEnum.mesaj_getlist: "$UrlSonEk/Mesaj/GetList",
//   UrlEnum.odevtakip_getlist: "$UrlSonEk/OdevTakip/GetList",
//   UrlEnum.odevislemleri_getlist: "$UrlSonEk/OdevIslemleri/GetList",
//   UrlEnum.ogrenciteslim_getlist: "$UrlSonEk/OgrenciTeslim/GetList",
//   UrlEnum.ogretmen_getlist: "$UrlSonEk/Ogretmen/GetList",
//   UrlEnum.ogretmenprogram_getlist: "$UrlSonEk/OgretmenProgram/GetList",
//   UrlEnum.ogretmensozlesme_getlist: "$UrlSonEk/OgretmenSozlesme/GetList",
//   UrlEnum.onkayitnotlar_getlist: "$UrlSonEk/OnKayitNotlar/GetList",
//   UrlEnum.rehber_getlist: "$UrlSonEk/Rehber/GetList",
//   UrlEnum.sablon_getlist: "$UrlSonEk/Sablon/GetList",
//   UrlEnum.saglik_getlist: "$UrlSonEk/Saglik/GetList",
//   UrlEnum.saglik_get: "$UrlSonEk/Saglik/Get",
//   UrlEnum.saglikdetay_getlist: "$UrlSonEk/SaglikDetay/GetList",
//   UrlEnum.saglikhareket_getlist: "$UrlSonEk/SaglikHareket/GetList",
//   UrlEnum.sinifprogram_getlist: "$UrlSonEk/SinifProgram/GetList",
//   UrlEnum.sosyalag_getlist: "$UrlSonEk/SosyalAg/GetList",
//   UrlEnum.sozlesme_getlist: "$UrlSonEk/Sozlesme/GetList",
//   UrlEnum.tahsilat_getlist: "$UrlSonEk/Tahsilat/GetList",
//   UrlEnum.taksittablosu_getlist: "$UrlSonEk/TaksitTablosu/GetList",
//   UrlEnum.veli_getlist: "$UrlSonEk/Veli/GetList",
//   UrlEnum.yemek_getlist: "$UrlSonEk/Yemek/GetList",
//   UrlEnum.yetki_getlist: "$UrlSonEk/Yetki/GetList",
//   UrlEnum.dersprogrami_addorupdate: "$UrlSonEk/DersProgrami/AddOrUpdate",
//   UrlEnum.dersprogramidetay_addorupdate: "$UrlSonEk/DersProgramiDetay/AddOrUpdate",
//   UrlEnum.derssaatleri_addorupdate: "$UrlSonEk/DersSaatleri/AddOrUpdate",
//   UrlEnum.derssaatleridetay_addorupdate: "$UrlSonEk/DersSaatleridetay/AddOrUpdate",
//   UrlEnum.paylasimyap_addorupdate: "$UrlSonEk/PaylasimYap/AddOrUpdate",
//   UrlEnum.ogrencimuhasebesi_addorupdate: "$UrlSonEk/OgrenciMuhasebesi/AddOrUpdate",
//   UrlEnum.odev_addorupdate: "$UrlSonEk/Odev/AddOrUpdate",
//   UrlEnum.ogrenci_addorupdate: "$UrlSonEk/Ogrenci/AddOrUpdate",
//   UrlEnum.yoklama_addorupdate: "$UrlSonEk/Yoklama/AddOrUpdate",
//   UrlEnum.anket_addorupdate: "$UrlSonEk/Anket/AddOrUpdate",
//   UrlEnum.ders_addorupdate: "$UrlSonEk/Ders/AddOrUpdate",
//   UrlEnum.donem_addorupdate: "$UrlSonEk/Donem/AddOrUpdate",
//   UrlEnum.servis_addorupdate: "$UrlSonEk/Servis/AddOrUpdate",
//   UrlEnum.sinif_addorupdate: "$UrlSonEk/Sinif/AddOrUpdate",
//   UrlEnum.yonetici_addorupdate: "$UrlSonEk/Yonetici/AddOrUpdate",
//   UrlEnum.ayarlar_addorupdate: "$UrlSonEk/Ayarlar/AddOrUpdate",
//   UrlEnum.grup_addorupdate: "$UrlSonEk/Grup/AddOrUpdate",
//   UrlEnum.gunlukkarne_addorupdate: "$UrlSonEk/GunlukKarne/AddOrUpdate",
//   UrlEnum.ilac_addorupdate: "$UrlSonEk/Ilac/AddOrUpdate",
//   UrlEnum.mesaj_addorupdate: "$UrlSonEk/Mesaj/AddOrUpdate",
//   UrlEnum.odevtakip_addorupdate: "$UrlSonEk/OdevTakip/AddOrUpdate",
//   UrlEnum.odevislemleri_addorupdate: "$UrlSonEk/OdevIslemleri/AddOrUpdate",
//   UrlEnum.ogrenciteslim_addorupdate: "$UrlSonEk/OgrenciTeslim/AddOrUpdate",
//   UrlEnum.ogretmen_addorupdate: "$UrlSonEk/Ogretmen/AddOrUpdate",
//   UrlEnum.ogretmenprogram_addorupdate: "$UrlSonEk/OgretmenProgram/AddOrUpdate",
//   UrlEnum.ogretmensozlesme_addorupdate: "$UrlSonEk/OgretmenSozlesme/AddOrUpdate",
//   UrlEnum.onkayitnotlar_addorupdate: "$UrlSonEk/OnKayitNotlar/AddOrUpdate",
//   UrlEnum.rehber_addorupdate: "$UrlSonEk/Rehber/AddOrUpdate",
//   UrlEnum.sablon_addorupdate: "$UrlSonEk/Sablon/AddOrUpdate",
//   UrlEnum.saglik_addorupdate: "$UrlSonEk/Saglik/AddOrUpdate",
//   UrlEnum.saglikdetay_addorupdate: "$UrlSonEk/SaglikDetay/AddOrUpdate",
//   UrlEnum.saglikhareket_addorupdate: "$UrlSonEk/SaglikHareket/AddOrUpdate",
//   UrlEnum.sinifprogram_addorupdate: "$UrlSonEk/SinifProgram/AddOrUpdate",
//   UrlEnum.sosyalag_addorupdate: "$UrlSonEk/SosyalAg/AddOrUpdate",
//   UrlEnum.sozlesme_addorupdate: "$UrlSonEk/Sozlesme/AddOrUpdate",
//   UrlEnum.tahsilat_addorupdate: "$UrlSonEk/Tahsilat/AddOrUpdate",
//   UrlEnum.taksittablosu_addorupdate: "$UrlSonEk/TaksitTablosu/AddOrUpdate",
//   UrlEnum.veli_addorupdate: "$UrlSonEk/Veli/AddOrUpdate",
//   UrlEnum.yemek_addorupdate: "$UrlSonEk/Yemek/AddOrUpdate",
//   UrlEnum.yetki_addorupdate: "$UrlSonEk/Yetki/AddOrUpdate",
//   UrlEnum.dersprogrami_delete: "$UrlSonEk/Dersprogrami/Delete",
//   UrlEnum.dersprogramidetay_delete: "$UrlSonEk/Dersprogramidetay/Delete",
//   UrlEnum.derssaatleri_delete: "$UrlSonEk/DersSaatleri/Delete",
//   UrlEnum.derssaatleridetay_delete: "$UrlSonEk/DersSaatleridetay/Delete",
//   UrlEnum.duyurular_delete: "$UrlSonEk/Duyurular/Delete",
//   UrlEnum.paylasimyap_delete: "$UrlSonEk/PaylasimYap/Delete",
//   UrlEnum.ogrencimuhasebesi_delete: "$UrlSonEk/OgrenciMuhasebesi/Delete",
//   UrlEnum.odev_delete: "$UrlSonEk/Odev/Delete",
//   UrlEnum.ogrenci_delete: "$UrlSonEk/Ogrenci/Delete",
//   UrlEnum.yoklama_delete: "$UrlSonEk/Yoklama/Delete",
//   UrlEnum.anket_delete: "$UrlSonEk/Anket/Delete",
//   UrlEnum.ders_delete: "$UrlSonEk/Ders/Delete",
//   UrlEnum.donem_delete: "$UrlSonEk/Donem/Delete",
//   UrlEnum.servis_delete: "$UrlSonEk/Servis/Delete",
//   UrlEnum.sinif_delete: "$UrlSonEk/Sinif/Delete",
//   UrlEnum.yonetici_delete: "$UrlSonEk/Yonetici/Delete",
//   UrlEnum.ayarlar_delete: "$UrlSonEk/Ayarlar/Delete",
//   UrlEnum.grup_delete: "$UrlSonEk/Grup/Delete",
//   UrlEnum.gunlukkarne_delete: "$UrlSonEk/GunlukKarne/Delete",
//   UrlEnum.ilac_delete: "$UrlSonEk/Ilac/Delete",
//   UrlEnum.mesaj_delete: "$UrlSonEk/Mesaj/Delete",
//   UrlEnum.odevtakip_delete: "$UrlSonEk/OdevTakip/Delete",
//   UrlEnum.odevislemleri_delete: "$UrlSonEk/OdevIslemleri/Delete",
//   UrlEnum.ogrenciteslim_delete: "$UrlSonEk/OgrenciTeslim/Delete",
//   UrlEnum.ogretmen_delete: "$UrlSonEk/Ogretmen/Delete",
//   UrlEnum.ogretmenprogram_delete: "$UrlSonEk/OgretmenProgram/Delete",
//   UrlEnum.ogretmensozlesme_delete: "$UrlSonEk/OgretmenSozlesme/Delete",
//   UrlEnum.okul_delete: "$UrlSonEk/okul/Delete",
//   UrlEnum.onkayitnotlar_delete: "$UrlSonEk/OnKayitNotlar/Delete",
//   UrlEnum.rehber_delete: "$UrlSonEk/Rehber/Delete",
//   UrlEnum.sablon_delete: "$UrlSonEk/Sablon/Delete",
//   UrlEnum.saglik_delete: "$UrlSonEk/Saglik/Delete",
//   UrlEnum.saglikdetay_delete: "$UrlSonEk/SaglikDetay/Delete",
//   UrlEnum.saglikhareket_delete: "$UrlSonEk/SaglikHareket/Delete",
//   UrlEnum.sinifprogram_delete: "$UrlSonEk/SinifProgram/Delete",
//   UrlEnum.sosyalag_delete: "$UrlSonEk/SosyalAg/Delete",
//   UrlEnum.sozlesme_delete: "$UrlSonEk/Sozlesme/Delete",
//   UrlEnum.tahsilat_delete: "$UrlSonEk/Tahsilat/Delete",
//   UrlEnum.taksittablosu_delete: "$UrlSonEk/TaksitTablosu/Delete",
//   UrlEnum.veli_delete: "$UrlSonEk/Veli/Delete",
//   UrlEnum.yemek_delete: "$UrlSonEk/Yemek/Delete",
//   UrlEnum.yetki_delete: "$UrlSonEk/Yetki/Delete",
// };