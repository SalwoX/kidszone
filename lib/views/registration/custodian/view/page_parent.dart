import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view_search.dart';
import '../../../../register.dart';
import '../../../_init/components/widgets/widgets.dart';
import '../../../_init/router/app_router.dart';
import '../model/parent_model.dart';
import '../view_model/view_model_parent.dart';
import 'page_registration_parent.dart';

// ignore: must_be_immutable
class PageParent extends BaseViewSearch<ViewModelParent, ParentModel> {
  @override
  int bottomNavigationSelectIndex = 4;

  @override
  bool isBackAppBarButton = true;

  @override
  final vm = ViewModelParent();

  @override
  List<Widget>? get iconButton => [
        IconButton(
          icon: Icon(
            Icons.add,
          ),
          onPressed: () async {
            await resolve<AppRouter>().push(RouteRegistrationParent());

            vm.reload();
          },
        ),
      ];

  PageParent({Key? key}) : super(key: key);

  @override
  Widget items(BuildContext context, int index, List<ParentModel> _models) {
    var model = _models[index];
    return ListViewWidget().iconTextItem(
      context: context,
      text: model.nameSurname ?? "",
      onTap: () {
        onSelectRow(model, context);
      },
    );
  }

  void onSelectRow(ParentModel item, BuildContext context) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => PageRegistrationParent(model: item)));

    vm.reload();
  }
}
