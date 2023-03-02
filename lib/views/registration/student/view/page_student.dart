import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view_search.dart';
import '../../../../register.dart';
import '../../../_init/components/widgets/widgets.dart';
import '../../../_init/router/app_router.dart';
import '../model/student_model.dart';
import '../view_model/view_model_student.dart';
import 'page_registration_student.dart';

// ignore: must_be_immutable
class PageStudent extends BaseViewSearch<ViewModelStudent, StudentModel> {
  @override
  int bottomNavigationSelectIndex = 4;

  @override
  bool isBackAppBarButton = true;

  @override
  final vm = ViewModelStudent();

  @override
  List<Widget>? get iconButton => [
        IconButton(
          icon: Icon(
            Icons.add,
          ),
          onPressed: () async {
            await resolve<AppRouter>().push(RouteRegistrationStudent());

            vm.reload();
          },
        ),
      ];

  PageStudent({Key? key}) : super(key: key);

  @override
  Widget items(BuildContext context, int index, List<StudentModel> _models) {
    var model = _models[index];
    return ListViewWidget().iconTextItem(
      context: context,
      text: model.nameSurname ?? "",
      onTap: () {
        onSelectRow(model, context);
      },
    );
  }

  void onSelectRow(StudentModel item, BuildContext context) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => PageRegistrationStudent(model: item)));

    vm.reload();
  }
}
