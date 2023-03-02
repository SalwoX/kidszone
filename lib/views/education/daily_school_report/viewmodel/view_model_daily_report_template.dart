// import 'package:flutter/foundation.dart';
// import 'package:flutter/widgets.dart';
// import 'package:kidszone_app/views/education/daily_school_report/model/daily_report_model.dart';

// import 'package:kidszone_app/views/education/daily_school_report/service/repository_dailyreport.dart';

// import '../../../../register.dart';
// import '../../../_init/models/filter_model.dart';


// enum JobState { IDLE, BUSY, ERROR }

// class ViewModelDailyReportTemplate with ChangeNotifier {
//   JobState? _state;
//   DailyReportModel? model;
//   int? classroomId;

//   ViewModelDailyReportTemplate({this.classroomId}) {
//     model = DailyReportModel();
//     _state = JobState.IDLE;
//     getData();
//   }

//   JobState get state => _state ?? JobState.BUSY;
//   set state(JobState state) {
//     _state = state;
//     notifyListeners();
//   }

//   Future getData() async {
//     try {
//       var repRegistration = resolve<RepositoryDailyReport>();
//       var fields = <Field>[];
//       fields.add(Field(fieldName: "SinifId", fieldOperator: "eq", fieldValue: classroomId.toString()));

//       state = JobState.BUSY;
//       model = await repRegistration.getList(filterModel: FilterModel(fields: fields, page: 1, pageSize: 0));
//       state = JobState.IDLE;
//     } catch (e) {
//       state = JobState.ERROR;
//       return DailyReportModel();
//     }
//   }
// }
