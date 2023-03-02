import 'dart:io';

import '../register.dart';
import '../views/_init/models/filter_model.dart';
import '../views/_init/models/mobile_result.dart';
import '../views/school_operations/school/model/school_model.dart';
import '../views/school_operations/school/service/repository_school.dart';
import 'provider_service.dart';

class ServiceSchool extends ProviderService {
  var rep = resolve<RepositorySchool>();

  addOrUpdate(SchoolModel model, List<File>? files) async {
    try {
      state = ProviderServiceState.LoadingState;
      var _model = await rep.addOrUpdate(model: model, files: files);
      state = ProviderServiceState.LoadedState;
      return _model;
    } catch (e) {
      state = ProviderServiceState.ErrorState;
    }
  }

  getList(FilterModel filter) async {
    try {
      state = ProviderServiceState.LoadingState;
      var res = await rep.getList(filterModel: filter);
      if (res is List<SchoolModel>) {
        //  emit(GetListState(models: res));
      } else if (res is MobileResult) {
        if (res.statusCode == "1") {
          //  emit(GetListState(models: []));
        } else {
          //  emit(ErrorState(exception: res.message));
        }
      }
      state = ProviderServiceState.LoadedState;
    } catch (e) {
      state = ProviderServiceState.ErrorState;
    }
  }
}
