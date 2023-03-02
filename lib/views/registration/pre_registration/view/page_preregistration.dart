import 'package:flutter/material.dart';
import '../../../../core/base/view/base_view_search.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/datetime_extensions.dart';
import '../../../../register.dart';
import '../../../_init/my_block.dart';
import '../../../_init/router/app_router.dart';
import '../model/preregistration_model.dart';
import 'page_registration_preregistration.dart';
import '../view_model/view_model_preregistration.dart';

// ignore: must_be_immutable
class PagePreregistration extends BaseViewSearch<ViewModelPreregistration, PreregistrationModel> {
  @override
  int bottomNavigationSelectIndex = 0;


  @override
  bool isBackAppBarButton=true;

  @override
  final vm = ViewModelPreregistration();

  PagePreregistration({Key? key}) : super(key: key);

  @override
  List<Widget>? get iconButton => [
        IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            await resolve<AppRouter>().push(RouteRegistrationPreregistration());

            vm.reload();
          },
        ),
      ];

  @override
  Widget items(BuildContext context, int index, List<PreregistrationModel> _models) {
    var item = _models[index];
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3)),
            child: ListTile(
              title: Text(
                item.nameSurname ?? "",
                style: context.textTheme.headlineSmall,
              ),
              trailing: Text(
                DatetimeExtensions.timeFormat(item.registrationDate),
                style: context.textTheme.bodySmall,
              ),
              onTap: () {
                onSelectRow(item, context);
              },
            ),
          ),
        ),
        SizedBox(
          height: MyBlock.vertical(context, x: 0.5),
        ),
      ],
    );
  }

  void onSelectRow(PreregistrationModel item, BuildContext context) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => PageRegistrationPreregistration(model: item)));

    vm.reload();
  }
}
