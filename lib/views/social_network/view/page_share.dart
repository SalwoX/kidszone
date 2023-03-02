import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../generated/locale_keys.g.dart';
import '../../_init/components/appbar/custom_appbar.dart';
import '../../_init/components/dropdown/dropdownlist/dropdown_search.dart';
import '../../_init/components/input/kz_edit_widgets.dart';
import '../../_init/components/toggle_button/kz_toggle_button.dart';
import '../../_init/components/widgets/image_upload.dart';
import '../../_init/models/filter_model.dart';
import '../../_init/models/key_value_model.dart';
import '../../_init/my_block.dart';
import '../../registration/class_room/model/classroom_model.dart';
import '../../registration/student/model/student_model.dart';
import '../../registration/teacher/model/teacher_model.dart';
import '../viewmodel/view_model_share.dart';

class PageShare extends StatefulWidget {
  PageShare({Key? key}) : super(key: key);

  @override
  State<PageShare> createState() => _PageShareState();
}

class _PageShareState extends State<PageShare> {
  ViewModelShare vm = ViewModelShare();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            CustomAppBar(
              innerBoxIsScrolled,
              headerWidgets: [
                Text(
                  "Paylaşım Yap",
                  style: context.textTheme.displayLarge, //16
                ),
                Text(
                  "Paylaşım yapabilirsin",
                  style: context.textTheme.displaySmall, //14
                ),
              ],
              isBackButton: true,
              appbarHeight: 90,
            ),
          ];
        },
        body: Form(
          key: vm.formKey, //! olması zorunlu
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MyBlock.horizontal(context, x: 1),
                      ),
                      child: Observer(
                        builder: (_) {
                          return Column(
                            children: [
                              DropdownSearch<KeyValueModel>(
                                dropdownSearchDecoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(1),
                                  icon: Icon(Icons.more_horiz),
                                  hintText: LocaleKeys.condition_select.tr(),
                                  //     border: InputBorder.none,
                                  //     focusedBorder: InputBorder.none,
                                ),
                                onSaved: (model) {},
                                maxHeight: 300,
                                mode: Mode.BOTTOM_SHEET,
                                showClearButton: false,
                                isFilteredOnline: false,
                                showSearchBox: false,
                                compareFn: (item, selectedItem) => item?.key == selectedItem?.key,
                                items: vm.repCommon.getTargetGroup(),
                                itemAsString: (val) => "${val!.value!}",
                                controller: vm.targetGroup,
                                selectedItemFuture: (filter) async {
                                  var list = vm.repCommon.getTargetGroup();
                                  return list;
                                },
                                onChanged: (model) {
                                  _selectTargetGroup(model!.key);
                                  vm.model.postType = model.key.toInt();
                                },
                              ),
                              Visibility(
                                visible: vm.visibleClassroom,
                                child: DropdownSearch<ClassroomModel>.multiSelection(
                                  dropdownSearchDecoration: InputDecoration(
                                    hintText: LocaleKeys.condition_select.tr(),
                                    labelText: LocaleKeys.announcementRegistrationPage_drop_class_model_labelText.tr(),
                                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 1)),
                                    /*labelStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: MyBlock.vertical(context, x: 1.7),
                                  ),*/
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                  onSaved: (model) {
                                    if (model != null) {
                                      vm.model.postId = model.map((e) => e.id).toList().join(",");
                                    }
                                  },
                                  maxHeight: 300,
                                  mode: Mode.BOTTOM_SHEET,
                                  showClearButton: false,
                                  isFilteredOnline: false,
                                  showSearchBox: false,
                                  compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
                                  itemAsString: (val) => "${val!.name!}",
                                  controller: vm.targetGroup,
                                  selectedItemFuture: (filter) async {
                                    var fields = <Field>[];

                                    var list = vm.repCommon.getClassroomList(fields);
                                    return list;
                                  },
                                ),
                              ),
                              Visibility(
                                visible: vm.visibleStudent,
                                child: DropdownSearch<StudentModel>.multiSelection(
                                  dropdownSearchDecoration: InputDecoration(
                                    hintText: LocaleKeys.condition_select.tr(),
                                    labelText: "Öğrenci Seçiniz",
                                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 1)),
                                    /*labelStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: MyBlock.vertical(context, x: 1.7),
                                  ),*/
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                  onSaved: (model) {
                                    if (model != null) {
                                      vm.model.postId = model.map((e) => e.id).toList().join(",");
                                    }
                                  },
                                  maxHeight: 300,
                                  mode: Mode.BOTTOM_SHEET,
                                  showClearButton: false,
                                  isFilteredOnline: false,
                                  showSearchBox: false,
                                  compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
                                  itemAsString: (val) => "${val!.nameSurname!}",
                                  controller: vm.targetGroup,
                                  selectedItemFuture: (filter) async {
                                    var fields = <Field>[];

                                    var list = vm.repCommon.getStudentList(fields);
                                    return list;
                                  },
                                ),
                              ),
                              Visibility(
                                visible: vm.visibleTeacher,
                                child: DropdownSearch<TeacherModel>.multiSelection(
                                    dropdownSearchDecoration: InputDecoration(
                                      hintText: "",
                                      labelText: "Öğretmen Seçiniz",
                                      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 1)),
                                      /*labelStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: MyBlock.vertical(context, x: 1),
                                  ),*/
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    onSaved: (model) {
                                      if (model != null) {
                                        vm.model.postId = model.map((e) => e.id).toList().join(",");
                                      }
                                    },
                                    maxHeight: 300,
                                    mode: Mode.BOTTOM_SHEET,
                                    showClearButton: false,
                                    isFilteredOnline: false,
                                    showSearchBox: false,
                                    compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
                                    itemAsString: (val) => "${val!.nameSurname!}",
                                    controller: vm.targetGroup,
                                    selectedItemFuture: (filter) async {
                                      var fields = <Field>[];
                                      var list = vm.repCommon.getTeacherList(fields);
                                      return list;
                                    }),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              KzTextEditMultiLine(
                                icon: Icons.comment,
                                controller: vm.comment,
                                labelText: "İçerik",
                                onSaved: (value) {
                                  vm.model.content = value;
                                },
                                isRequired: true,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              KzToggleButton(
                                isSelected: vm.isSelected,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Fotoğraf"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Youtube Link"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Video"),
                                  ),
                                ],
                                onPressed: (int index) {
                                  setState(() {
                                    for (int i = 0; i < vm.isSelected.length; i++) {
                                      vm.isSelected[i] = i == index;
                                    }
                                  });
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Visibility(
                                visible: vm.isSelected[0],
                                child: Center(
                                  child: ImageUpload(
                                    imgUrl: vm.imgUrl.text,
                                    photoList: vm.photoList,
                                    picker: vm.picker,
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: vm.isSelected[1],
                                child: KzTextEditMultiLine(
                                  controller: vm.linkController,
                                  labelText: "Link",
                                  isRequired: true,
                                  icon: Icons.play_arrow_outlined,
                                  onSaved: (value) {
                                    vm.model.url = value;
                                  },
                                ),
                              ),
                              Visibility(
                                visible: vm.isSelected[2],
                                child: KzTextEditMultiLine(
                                  controller: vm.linkController,
                                  labelText: "Video",
                                  isRequired: true,
                                  icon: Icons.play_arrow_outlined,
                                  onSaved: (value) {
                                    vm.model.videoUrl = value;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await vm.register();
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Kaydet"),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _selectTargetGroup(String? value) {
    vm.targetGroup.text = value ?? "";
    if (value == "2") {
      vm.visibleClassroom = true;
      vm.visibleTeacher = false;
      vm.visibleStudent = false;
    } else if (value == "3") {
      vm.visibleTeacher = false;
      vm.visibleClassroom = false;
      vm.visibleStudent = true;
    } else if (value == "4") {
      vm.visibleClassroom = false;
      vm.visibleTeacher = true;
      vm.visibleStudent = false;
    } else {
      vm.visibleTeacher = false;
      vm.visibleClassroom = false;
      vm.visibleStudent = false;
    }
  }
}
