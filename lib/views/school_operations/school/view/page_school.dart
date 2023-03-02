import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view_search.dart';
import '../../../../register.dart';
import '../../../_init/components/widgets/widgets.dart';
import '../../../_init/router/app_router.dart';
import '../model/school_model.dart';
import '../view_model/view_model_school.dart';
import 'page_registration_school.dart';

// ignore: must_be_immutable
class PageSchool extends BaseViewSearch<ViewModelSchool, SchoolModel> {
  @override
  int bottomNavigationSelectIndex = 4;

  @override
  bool isBackAppBarButton = true;

  @override
  final vm = ViewModelSchool();

  PageSchool({Key? key}) : super(key: key);

  @override
  List<Widget>? get iconButton => [
        IconButton(
          icon: Icon(
            Icons.add,
          ),
          onPressed: () async {
            await resolve<AppRouter>().push(RouteSchoolRegistration());

            vm.reload();
          },
        ),
      ];

  @override
  Widget items(BuildContext context, int index, List<SchoolModel> _models) {
    var model = (_models)[index];
    return ListViewWidget().iconTextItem(
      context: context,
      text: model.name ?? "",
      onTap: () {
        onSelectRow(model, context);
      },
    );
  }

  void onSelectRow(SchoolModel item, BuildContext context) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => PageSchoolRegistration(model: item)));
    vm.reload();
  }
}
