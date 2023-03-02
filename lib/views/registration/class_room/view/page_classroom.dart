// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:kidszone_app/core/base/view/base_view_search.dart';
import 'package:kidszone_app/register.dart';
import 'package:kidszone_app/views/_init/components/widgets/widgets.dart';
import 'package:kidszone_app/views/_init/router/app_router.dart';
import 'package:kidszone_app/views/registration/class_room/model/classroom_model.dart';
import 'package:kidszone_app/views/registration/class_room/view/page_registration_classroom.dart';
import 'package:kidszone_app/views/registration/class_room/viewmodel/view_model_classroom.dart';

/* import 'package:kidszone_app/imports/import_components.dart' as kz;
import 'package:kidszone_app/imports/import_pages.dart' as pages;
import 'package:kidszone_app/imports/import_themes.dart' as themes;
import 'package:kidszone_app/imports/import_common.dart' as core;
import 'package:kidszone_app/imports/import_model.dart' as models; */

class PageClassroom extends BaseViewSearch<ViewModelClassroom, ClassroomModel> {
  @override
  int bottomNavigationSelectIndex = 4;


  @override
  bool isBackAppBarButton=true;

  @override
  final vm = ViewModelClassroom();

  PageClassroom({Key? key}) : super(key: key);

  @override
  List<Widget> get iconButton => [
        IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            await resolve<AppRouter>().push(RouteRegistrationClassroom());

            vm.reload();
          },
        ),
      ];

  @override
  Widget items(BuildContext context, int index, List<ClassroomModel> _models) {
    var model = _models[index];
    return ListViewWidget().iconTextItem(
      context: context,
      text: model.name ?? "",
      onTap: () {
        onSelectRow(model, context);
      },
    );
  }

  void onSelectRow(ClassroomModel item, BuildContext context) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => PageRegistrationClassroom(model: item)));
    vm.reload();
  }
}
