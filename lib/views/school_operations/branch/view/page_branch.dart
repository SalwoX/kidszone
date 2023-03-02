import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view_search.dart';
import '../../../../register.dart';
import '../../../_init/components/widgets/widgets.dart';
import '../../../_init/router/app_router.dart';
import '../model/branch_model.dart';
import '../viewmodel/view_model_branch.dart';
import 'page_registration_branch.dart';

// ignore: must_be_immutable
class PageBranch extends BaseViewSearch<ViewModelBranch, BranchModel> {
  @override
  int bottomNavigationSelectIndex = 4;

  @override
  bool isBackAppBarButton = true;

  @override
  final vm = ViewModelBranch();

  PageBranch({Key? key}) : super(key: key);

  @override
  List<Widget>? get iconButton => [
        IconButton(
          icon: Icon(
            Icons.add,
          ),
          onPressed: () async {
            await resolve<AppRouter>().push(RouteRegistrationBranch());

            vm.reload();
          },
        ),
      ];

  @override
  Widget items(BuildContext context, int index, List<BranchModel> _models) {
    var model = (_models)[index];
    return ListViewWidget().iconTextItem(
      context: context,
      text: model.branchName ?? "",
      onTap: () {
        onSelectRow(model, context);
      },
    );
  }

  void onSelectRow(BranchModel item, BuildContext context) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => PageRegistrationBranch(model: item)));

    vm.reload();
  }
}
