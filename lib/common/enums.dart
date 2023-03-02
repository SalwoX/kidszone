import '../views/_init/models/key_value_model.dart';

enum GroupTypes {
  school_package,
  blood_group,
}

enum LessonTypes {
  lesson_class,
  study_class,
}

enum AdminExecutive {
  school,
  branch,
}

class Enums {
  static Map<GroupTypes, KeyValueModel> getGroupTypes = {
    GroupTypes.school_package: KeyValueModel(key: "1", value: "Okul Paket"),
    GroupTypes.blood_group: KeyValueModel(key: "2", value: "Kan Grubu"),
  };

  static Map<LessonTypes, KeyValueModel> getLessonTypes = {
    LessonTypes.lesson_class: KeyValueModel(key: "1", value: "Ders Sınıfı"),
    LessonTypes.study_class: KeyValueModel(key: "2", value: "Etüt Sınıfı"),
  };

  static Map<AdminExecutive, KeyValueModel> getAdminExecutiveTypes = {
    AdminExecutive.school: KeyValueModel(key: "1", value: "Okul Yöneticisi"),
    AdminExecutive.branch: KeyValueModel(key: "2", value: "Şube Yöneticisi"),
  };
}
