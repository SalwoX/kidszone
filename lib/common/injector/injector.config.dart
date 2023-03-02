// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/core/apiservices.dart' as _i4;
import '../../data/repositories/repository_common.dart' as _i8;
import '../../data/repositories/repository_post.dart' as _i18;
import '../../data/repositories/repository_student_accounting.dart' as _i27;
import '../../data/repositories/repository_survey.dart' as _i28;
import '../../data/repositories/repository_term.dart' as _i30;
import '../../views/authenticate/login/service/repository_login.dart' as _i15;
import '../../views/education/daily_school_report/service/repository_dailyreport.dart'
    as _i9;
import '../../views/health_operations/service/repository_health.dart' as _i13;
import '../../views/home/announcement/service/repository_notice.dart' as _i16;
import '../../views/other_operations/food/service/repository_food.dart' as _i11;
import '../../views/other_operations/settings/service/repository_settings.dart'
    as _i24;
import '../../views/registration/class_room/service/repository_classroom.dart'
    as _i7;
import '../../views/registration/custodian/service/repository_parent.dart'
    as _i17;
import '../../views/registration/executive/service/repository_executive.dart'
    as _i10;
import '../../views/registration/lesson/service/repository_lesson.dart' as _i14;
import '../../views/registration/pre_registration/pre_registration_notes/service/repository_preregistrationnotes.dart'
    as _i20;
import '../../views/registration/pre_registration/service/repository_preregistration.dart'
    as _i19;
import '../../views/registration/pre_registration/service/repository_preregistrationnotes.dart'
    as _i21;
import '../../views/registration/service_station/service/repository_schoolbus.dart'
    as _i23;
import '../../views/registration/student/service/repository_student.dart'
    as _i26;
import '../../views/registration/teacher/service/repository_teacher.dart'
    as _i29;
import '../../views/school_operations/branch/service/repository_branch.dart'
    as _i6;
import '../../views/school_operations/group_operations/service/repository_group.dart'
    as _i12;
import '../../views/school_operations/school/service/repository_school.dart'
    as _i22;
import '../../views/social_network/service/repository_share.dart' as _i25;
import '../module/register_module.dart' as _i5;
import '../services/abstract_service.dart' as _i3;

const String _platformMobile = 'platformMobile';
const String _platformWeb = 'platformWeb';
const String _dev = 'dev';
const String _test = 'test';

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AbstractService>(
      () => _i3.MobileService.fromService(
          get<Set<String>>(instanceName: '__environments__')),
      registerFor: {_platformMobile},
    );
    gh.lazySingleton<_i3.AbstractService>(
      () => _i3.WebService(get<Set<String>>(instanceName: '__environments__')),
      instanceName: 'WebService',
      registerFor: {_platformWeb},
    );
    await gh.factoryAsync<_i3.AbstractService>(
      () => _i3.AsyncService.create(
          get<Set<String>>(instanceName: '__environments__')),
      registerFor: {_dev},
      preResolve: true,
    );
    gh.lazySingleton<_i4.ApiServices>(() => _i4.ApiServices());
    gh.singleton<_i5.DisposableSingleton>(
      _i5.DisposableSingleton(),
      dispose: (i) => i.dispose(),
    );
    gh.factoryParam<_i3.IService, String?, dynamic>(
      (
        param,
        _,
      ) =>
          _i3.ServiceImpl(param),
      registerFor: {_dev},
    );
    gh.factoryParamAsync<_i3.IService, String?, dynamic>(
      (
        param,
        _,
      ) =>
          _i3.LazyServiceImpl.create(param),
      registerFor: {_test},
    );
    gh.lazySingleton<_i6.RepositoryBranch>(() => _i6.RepositoryBranch());
    gh.lazySingleton<_i7.RepositoryClassroom>(() => _i7.RepositoryClassroom());
    gh.lazySingleton<_i8.RepositoryCommon>(() => _i8.RepositoryCommon());
    gh.lazySingleton<_i9.RepositoryDailyReport>(
        () => _i9.RepositoryDailyReport());
    gh.lazySingleton<_i10.RepositoryExecutive>(
        () => _i10.RepositoryExecutive());
    gh.lazySingleton<_i11.RepositoryFood>(() => _i11.RepositoryFood());
    gh.lazySingleton<_i12.RepositoryGroup>(() => _i12.RepositoryGroup());
    gh.lazySingleton<_i13.RepositoryHealth>(() => _i13.RepositoryHealth());
    gh.lazySingleton<_i14.RepositoryLesson>(() => _i14.RepositoryLesson());
    gh.lazySingleton<_i15.RepositoryLogin>(() => _i15.RepositoryLogin());
    gh.lazySingleton<_i16.RepositoryNotice>(() => _i16.RepositoryNotice());
    gh.lazySingleton<_i17.RepositoryParent>(() => _i17.RepositoryParent());
    gh.lazySingleton<_i18.RepositoryPost>(() => _i18.RepositoryPost());
    gh.lazySingleton<_i19.RepositoryPreregistration>(
        () => _i19.RepositoryPreregistration());
    gh.lazySingleton<_i20.RepositoryPreregistrationNotes>(
        () => _i20.RepositoryPreregistrationNotes());
    gh.lazySingleton<_i21.RepositoryPreregistrationNotes>(
        () => _i21.RepositoryPreregistrationNotes());
    gh.lazySingleton<_i22.RepositorySchool>(() => _i22.RepositorySchool());
    gh.lazySingleton<_i23.RepositorySchoolBus>(
        () => _i23.RepositorySchoolBus());
    gh.lazySingleton<_i24.RepositorySettings>(() => _i24.RepositorySettings());
    gh.lazySingleton<_i25.RepositoryShare>(() => _i25.RepositoryShare());
    gh.lazySingleton<_i26.RepositoryStudent>(() => _i26.RepositoryStudent());
    gh.lazySingleton<_i27.RepositorySudentAccounting>(
        () => _i27.RepositorySudentAccounting());
    gh.lazySingleton<_i28.RepositorySurvey>(() => _i28.RepositorySurvey());
    gh.lazySingleton<_i29.RepositoryTeacher>(() => _i29.RepositoryTeacher());
    gh.lazySingleton<_i30.RepositoryTerm>(() => _i30.RepositoryTerm());
    return this;
  }
}
