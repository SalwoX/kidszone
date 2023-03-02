import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../common/utils/app_static.dart';
import '../../register.dart';
import '../../views/_init/models/filter_model.dart';
import '../../views/_init/models/key_value_model.dart';
import '../../views/_init/models/permission_model.dart';
import '../../views/registration/class_room/model/classroom_model.dart';
import '../../views/registration/custodian/model/parent_model.dart';
import '../../views/registration/lesson/model/lesson_model.dart';
import '../../views/registration/service_station/model/school_bus_model.dart';
import '../../views/registration/student/model/student_model.dart';
import '../../views/registration/teacher/model/teacher_model.dart';
import '../../views/school_operations/branch/model/branch_model.dart';
import '../../views/school_operations/group_operations/model/group_model.dart';
import '../../views/school_operations/school/model/school_model.dart';
import '../core/apiservices.dart';
import '../core/urlservices.dart';

@lazySingleton
class RepositoryCommon {
  ApiServices api = resolve<ApiServices>();

  /* Future<GrupModel> okulPaket() async {
    var res = await api.get(UrlEnum.okul_paket,
        fields: List.empty(), page: 0, pageSize: 0);
    if (res != null) {
      // return GrupModel.fromJson(res);
    }
    return GrupModel();
  }*/

  Future<List<GroupModel>> getGroupList(
    String? filter,
    List<Field> fields,
  ) async {
    List<GroupModel> model = [];
    if (filter != null && filter.isNotEmpty) {
      fields.add(Field(fieldName: "Ad", fieldOperator: "startswith", fieldValue: filter));
    }

    var res = await api.get(
      UrlEnum.group_getlist,
      fields: [],
      page: 0,
      pageSize: 0,
      sort: "",
    );

    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => GroupModel.fromJson(i as Map<String, dynamic>)).toList();
    } else if (res.statusCode == "1") {
      model = [];
    }

    return model.toList();
  }

  Future<List<StudentModel>> getStudentList(List<Field> fields) async {
    List<StudentModel> model = [];

    var res = await api.get(
      UrlEnum.student_getlist,
      fields: fields,
      page: 0,
      pageSize: 0,
      sort: "",
    );

    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => StudentModel.fromJson(i as Map<String, dynamic>)).toList();
    } else if (res.statusCode == "1") {
      model = [];
    }

    return model.toList();
  }

  Future<List<DropdownMenuItem<String>>> schoolPackageDropDown(TextStyle style) async {
    var res = await api.get(
      UrlEnum.school_package,
      fields: List.empty(),
      page: 0,
      pageSize: 0,
      sort: "",
    );
    var data = (res.data as List).map((i) => GroupModel.fromJson(i as Map<String, dynamic>)).toList();
    var list = data.map(
      (d) => new DropdownMenuItem<String>(
        value: d.id.toString(),
        child: Text(
          d.name ?? "",
          style: style,
        ),
      ),
    );
    return list.toList();
  }

  Future<List<DropdownMenuItem<String>>> schoolGetListDropDown(TextStyle style) async {
    List<SchoolModel> model = [];
    var res = await api.get(
      UrlEnum.school_getlist,
      fields: [],
      page: 0,
      pageSize: 0,
      sort: "",
    );

    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => SchoolModel.fromJson(i as Map<String, dynamic>)).toList();
    } else if (res.statusCode == "1") {
      model = [];
    }
    var list = model.map(
      (d) => new DropdownMenuItem<String>(
        value: d.id.toString(),
        child: Text(
          d.name ?? "",
          style: style,
        ),
      ),
    );
    return list.toList();
  }

  Future<List<SchoolModel>> schoolGetList(List<Field> fields) async {
    List<SchoolModel> model = [];
    var res = await api.get(
      UrlEnum.school_getlist,
      fields: fields,
      page: 0,
      pageSize: 0,
      sort: "",
    );

    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => SchoolModel.fromJson(i as Map<String, dynamic>)).toList();
    } else if (res.statusCode == "1") {
      model = [];
    }

    return model;
  }

  Future<List<SchoolBusModel>> getSchoolBusList(List<Field> fields) async {
    List<SchoolBusModel> model = [];

    var res = await api.get(
      UrlEnum.schoolbus_getlist,
      fields: fields,
      page: 0,
      pageSize: 0,
      sort: "",
    );

    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => SchoolBusModel.fromJson(i as Map<String, dynamic>)).toList();
    } else if (res.statusCode == "1") {
      model = [];
    }

    return model.toList();
  }

  Future<List<GroupModel>> getBloodGroupList(List<Field> fields) async {
    List<GroupModel> model = [];

    var res = await api.get(
      UrlEnum.group_getlist,
      fields: [],
      page: 0,
      pageSize: 0,
      sort: "",
    );

    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => GroupModel.fromJson(i as Map<String, dynamic>)).toList();
    } else if (res.statusCode == "1") {
      model = [];
    }

    return model.toList();
  }

  Future<List<ClassroomModel>> getLessonClassList(List<Field> fields) async {
    List<ClassroomModel> model = [];

    var res = await api.get(
      UrlEnum.classroom_getlist,
      fields: [],
      page: 0,
      pageSize: 0,
      sort: "",
    );

    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => ClassroomModel.fromJson(i as Map<String, dynamic>)).toList();
    } else if (res.statusCode == "1") {
      model = [];
    }

    return model.toList();
  }

  Future<List<TeacherModel>> getTeacherList(List<Field> fields) async {
    List<TeacherModel> model = [];

    var res = await api.get(
      UrlEnum.teacher_getlist,
      fields: fields,
      page: 0,
      pageSize: 0,
      sort: "",
    );

    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => TeacherModel.fromJson(i as Map<String, dynamic>)).toList();
    } else if (res.statusCode == "1") {
      model = [];
    }

    return model.toList();
  }

  Future<List<ParentModel>> getParentList(String? filter) async {
    List<ParentModel> model = [];
    var fields = <Field>[];
    if (filter != null && filter.isNotEmpty) {
      fields.add(Field(fieldName: "Adi", fieldOperator: "startswith", fieldValue: filter));
    }

    var res = await api.get(
      UrlEnum.teacher_getlist,
      fields: [],
      page: 0,
      pageSize: 0,
      sort: "",
    );

    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => ParentModel.fromJson(i as Map<String, dynamic>)).toList();
    } else if (res.statusCode == "1") {
      model = [];
    }

    return model.toList();
  }

  Future<List<SchoolModel>> getSchoolList(List<Field> fields) async {
    List<SchoolModel> model = [];

    var res = await api.get(
      UrlEnum.school_getlist,
      fields: fields,
      page: 0,
      pageSize: 0,
      sort: "",
    );
    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => SchoolModel.fromJson(i as Map<String, dynamic>)).toList();
    } else if (res.statusCode == "1") {
      model = [];
    }

    return model.toList();
  }

  Future<SchoolModel?> getSchoolId(String? filter) async {
    List<SchoolModel> model = [];
    var fields = <Field>[];
    if (filter != null && filter.isNotEmpty) {
      fields.add(Field(fieldName: "Id", fieldOperator: "eq", fieldValue: filter));
    }

    var res = await api.get(
      UrlEnum.school_getlist,
      fields: fields,
      page: 0,
      pageSize: 0,
      sort: "",
    );
    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => SchoolModel.fromJson(i as Map<String, dynamic>)).toList();
    } else if (res.statusCode == "1") {
      model = [];
    }

    return model.first;
  }

  Future<List<BranchModel>> getBranchList(
    String? filter,
    List<Field> fields,
  ) async {
    List<BranchModel> model = [];
    if (filter != null && filter.isNotEmpty) {
      fields.add(Field(fieldName: "SubeAdi", fieldOperator: "startswith", fieldValue: filter));
    }

    var res = await api.get(
      UrlEnum.branch_getlist,
      fields: fields,
      page: 0,
      pageSize: 0,
      sort: "",
    );
    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => BranchModel.fromJson(i as Map<String, dynamic>)).toList();
    } else if (res.statusCode == "1") {
      model = [];
    }

    return model.toList();
  }

  Future<List<LessonModel>> getLessonList(String? filter) async {
    List<LessonModel> model = [];
    var fields = <Field>[];
    if (filter != null && filter.isNotEmpty) {
      fields.add(Field(fieldName: "Ad", fieldOperator: "startswith", fieldValue: filter));
    }

    var res = await api.get(
      UrlEnum.lesson_getlist,
      fields: fields,
      page: 0,
      pageSize: 0,
      sort: "",
    );
    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => LessonModel.fromJson(i as Map<String, dynamic>)).toList();
    } else if (res.statusCode == "1") {
      model = [];
    }

    return model.toList();
  }

  Future<List<ClassroomModel>> getClassroomList(List<Field> fields) async {
    List<ClassroomModel> model = [];

    var res = await api.get(
      UrlEnum.lesson_getlist,
      fields: fields,
      page: 0,
      pageSize: 0,
      sort: "",
    );
    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => ClassroomModel.fromJson(i as Map<String, dynamic>)).toList();
    } else if (res.statusCode == "1") {
      model = [];
    }

    return model.toList();
  }

  Future<List<PermissionModel>> getPermissionList(List<Field> fields) async {
    List<PermissionModel> model = [];

    var res = await api.get(
      UrlEnum.lesson_getlist,
      fields: fields,
      page: 0,
      pageSize: 0,
      sort: "",
    );
    if (res.statusCode == "Success") {
      model = (res.data as List).map((i) => PermissionModel.fromJson(i as Map<String, dynamic>)).toList();
    } else if (res.statusCode == "1") {
      model = [];
    }

    return model.toList();
  }

  List<KeyValueModel> getTargetGroup() {
    var targetGroup = AppStatic.targetGroup;
    return targetGroup;
  }
}
