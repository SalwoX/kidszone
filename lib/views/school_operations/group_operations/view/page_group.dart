import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view_search.dart';
import '../../../../register.dart';
import '../../../_init/components/widgets/widgets.dart';
import '../../../_init/models/filter_model.dart';
import '../../../_init/router/app_router.dart';
import '../model/group_model.dart';
import '../view_model/view_model_group.dart';

// ignore: must_be_immutable
class PageGroup extends BaseViewSearch<ViewModelGroup, GroupModel> {
  final String? type;
  final String? title;
  PageGroup({Key? key, required this.type, required this.title}) : super(key: key);

  @override
  bool isBackAppBarButton = true;

  @override
  int bottomNavigationSelectIndex = 4;

  @override
  final vm = ViewModelGroup();

  @override
  void init() {
    // socket bağlantısı
    var defsart = Field(fieldName: 'type', fieldOperator: "eq", fieldValue: type);
    vm.filter.fields.clear();
    vm.page_title = title!;
    vm.fields.add(defsart);
    super.init();
  }

  @override
  List<Widget>? get iconButton => [
        IconButton(
          icon: Icon(
            Icons.add,
          ),
          onPressed: () async {
            await resolve<AppRouter>().push(RouteRegistrationGroup());

            vm.reload();
          },
        ),
      ];

  @override
  Widget items(BuildContext context, int index, List<GroupModel> _models) {
    var item = _models[index];
    return ListViewWidget().iconTextItem(
      context: context,
      text: "${item.name} ${item.id}",
      onTap: () {
        onSelectRow(item, context);
      },
    );
  }

  void onSelectRow(GroupModel item, BuildContext context) async {
    await resolve<AppRouter>().push(RouteRegistrationGroup(model: item));
    //  await Navigator.push(context, MaterialPageRoute(builder: (context) => PageRegistrationGroup(model: item)));
    vm.reload();
  }
}
