import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../register.dart';
import '../../../_init/components/appbar/custom_appbar.dart';
import '../../../_init/components/box_item/box_item.dart';
import '../../../_init/models/filter_model.dart';
import '../../../_init/my_block.dart';
import '../../../_init/router/app_router.dart';
import '../../../_init/themes/colors.dart';
import '../../../registration/student/model/student_model.dart';
import '../viewmodel/view_model_selection_student.dart';

// ignore: must_be_immutable
class PageSelectionStudent extends StatefulWidget {
  PageSelectionStudent({Key? key}) : super(key: key);

  ViewModelSelectionStudent vm = ViewModelSelectionStudent();

  @override
  State<PageSelectionStudent> createState() => _PageSelectionStudentState();
}

class _PageSelectionStudentState extends State<PageSelectionStudent> {
  @override
  void initState() {
    super.initState();
    widget.vm.getStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            CustomAppBar(
              innerBoxIsScrolled,
              headerWidgets: [
                Text(
                  widget.vm.page_title,
                  style: context.textTheme.displayLarge,
                ),
                Text(
                  widget.vm.page_subTitle,
                  style: context.textTheme.displaySmall,
                ),
              ],
              isBackButton: true,
              appbarHeight: 90,
            ),
          ];
        },
        body: Column(
          children: [
            Container(
              height: MyBlock.horizontal(context, x: 12),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: ThemeColors.white)),
                  padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.5)),
                  child: Text("${DateTime.now().day.toString() + "/" + DateTime.now().month.toString() + "/" + DateTime.now().year.toString()}"),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MyBlock.vertical(context, x: 0),
                    ),
                    Container(
                      child: Observer(
                        builder: (_) {
                          return Column(
                            children: [
                              Text(
                                "Öğrenciyi seç",
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height: MyBlock.vertical(context, x: 2),
                              ),
                              GridView(
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.only(
                                    left: MyBlock.horizontal(context, x: 3), right: MyBlock.horizontal(context, x: 3), top: MyBlock.vertical(context, x: 1), bottom: MyBlock.vertical(context, x: 3)),
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: MyBlock.horizontal(context, x: 4), mainAxisSpacing: MyBlock.vertical(context, x: 4), crossAxisCount: 4),
                                children: widget.vm.studentList.map((e) => boxItem(e, context)).toList(),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget boxItem(StudentModel item, BuildContext context) {
    String kidsName = item.nameSurname ?? '';
    if (!kidsName.contains("\n")) {
      String kidsLastName = kidsName.split(" ").last;
      item.nameSurname = kidsName.replaceFirst(kidsLastName, "\n" + kidsLastName);
    }
    return BoxItem(
      text: kidsName,
      active: item.gender == 1,
      onTap: () async {
        widget.vm.selectedStudent = item;
        widget.vm.fields = [];
        widget.vm.fields.add(
          Field(
            fieldName: "du.OgrenciId",
            fieldOperator: "eq",
            fieldValue: item.id.toString(),
          ),
        );
        await widget.vm.get();
        resolve<AppRouter>().push(RouteDailyReport());
      },
    );
  }
}
