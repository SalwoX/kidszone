import 'package:flutter/material.dart';
import '../../../../core/base/view/base_view_search.dart';
import '../../../../register.dart';
import '../../../_init/components/widgets/widgets.dart';
import '../../../_init/router/app_router.dart';
import '../model/lesson_model.dart';
import 'page_registration_lesson.dart';
import '../viewmodel/view_model_lesson.dart';

/* import 'package:kidszone_app/imports/import_components.dart' as kz;
import 'package:kidszone_app/imports/import_pages.dart' as pages;
import 'package:kidszone_app/imports/import_themes.dart' as themes;
import 'package:kidszone_app/imports/import_common.dart' as core;
import 'package:kidszone_app/imports/import_model.dart' as models; */

// ignore: must_be_immutable
class PageLesson extends BaseViewSearch<ViewModelLesson, LessonModel> {
  PageLesson({Key? key}) : super(key: key);

  @override
  int bottomNavigationSelectIndex = 4;

  @override
  bool isBackAppBarButton=true;

  @override
  final vm = ViewModelLesson();

  @override
  List<Widget>? get iconButton => [
        IconButton(
          icon: Icon(
            Icons.add,
          ),
          onPressed: () async {
            await resolve<AppRouter>().push(RouteRegistrationLesson());

            vm.reload();
          },
        ),
      ];

  @override
  Widget items(BuildContext context, int index, List<LessonModel> _models) {
    var model = _models[index];
    return ListViewWidget().iconTextItem(
      context: context,
      text: model.name ?? "",
      onTap: () {
        onSelectRow(model, context);
      },
    );
  }

  void onSelectRow(LessonModel item, BuildContext context) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PageRegistrationLesson(model: item)));

    vm.reload();
  }
}
