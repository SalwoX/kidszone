import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kidszone_app/views/_init/components/appbar/custom_appbar.dart';
import 'package:kidszone_app/views/_init/components/dropdown/dropdownlist/dropdown_search.dart';
import 'package:kidszone_app/views/_init/components/input/kz_edit_widgets.dart';
import 'package:kidszone_app/views/_init/components/widgets/image_upload.dart';
import 'package:kidszone_app/views/_init/models/filter_model.dart';
import 'package:kidszone_app/views/_init/models/key_value_model.dart';
import 'package:kidszone_app/views/_init/my_block.dart';
import 'package:kidszone_app/views/home/announcement/model/notice_model.dart';
import 'package:kidszone_app/views/home/announcement/viewmodel/notice_view_model.dart';
import 'package:kidszone_app/views/registration/class_room/model/classroom_model.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../generated/locale_keys.g.dart';

/* import 'package:kidszone_app/imports/import_components.dart' as kz;
import 'package:kidszone_app/imports/import_themes.dart' as themes;
import 'package:kidszone_app/imports/import_common.dart' as core;
import 'package:kidszone_app/imports/import_model.dart' as models; */

class PageNoticeRegistration extends StatelessWidget {
  final vm = PageNoticeViewModel();
  PageNoticeRegistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('PageNoticeRegistration');
    var model = vm.model;
    if (model.id != null) {
      vm.targetGroup.text = model.targetGroup.toString();
      vm.targetClassroom.text = model.targetGroup.toString();
      vm.targetTeacher.text = model.targetGroup.toString();
      vm.title.text = model.title ?? "";
      vm.content.text = model.content ?? "";
      vm.link.text = model.linkUrl ?? "";
      vm.pinned = model.constant ?? false;
      vm.imgUrl.text = model.imgUrl ?? "";
    } else {
      vm.model = NoticeModel();
      model.id = 0;
    }
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            CustomAppBar(
              innerBoxIsScrolled,
              headerWidgets: [
                Text(
                  LocaleKeys.announcementRegistrationPage_title.tr(),
                  style: context.textTheme.displayLarge, //16
                ),
                Text(
                  LocaleKeys.announcementRegistrationPage_sub_title.tr(),
                  style: context.textTheme.displaySmall, //14
                ),
              ],
              isBackButton: true,
              appbarHeight: 90,
            ),
          ];
        },
        body: Form(
          key: vm.formKey,
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
                            onSaved: (model) {
                              if (model != null) {
                                vm.model.targetGroup = model.value.toInt();
                              }
                            },
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
                            },
                          ),
                          Visibility(
                            visible: vm.visibleClassroom,
                            child: DropdownSearch<ClassroomModel>(
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
                                  vm.model.targetGroup = model.id;
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
                              onChanged: (model) {
                                //  _hedefKitleSecim(model!.key);
                              },
                            ),
                          ),
                          Visibility(
                            visible: vm.visibleTeacher,
                            child: DropdownSearch<KeyValueModel>(
                              dropdownSearchDecoration: InputDecoration(
                                hintText: LocaleKeys.condition_select.tr(),
                                labelText: LocaleKeys.announcementRegistrationPage_drop_key_model_labelText2.tr(),
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
                                  vm.model.targetGroup = model.value.toInt();
                                }
                              },
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
                              },
                            ),
                          ),
                          KzTextEdit(
                            controller: vm.title,
                            labelText: LocaleKeys.announcementRegistrationPage_text_edit_label.tr(),
                            icon: Icons.title,
                            isRequired: true,
                            inputType: TextInputType.name,
                            onSaved: (newValue) {
                              model.title = newValue;
                            },
                          ),
                          KzTextEditMultiLine(
                            controller: vm.content,
                            labelText: LocaleKeys.announcementRegistrationPage_multi_text_edit_label.tr(),
                            icon: Icons.description,
                            isRequired: true,
                            inputType: TextInputType.name,
                            onSaved: (newValue) {
                              model.content = newValue;
                            },
                          ),
                          /*KzTextEditz(
                              controller: link,
                              extra: {
                                kzTextEditEnums.labelText: 'link',
                                kzTextEditEnums.icon: Icons.link,
                                kzTextEditEnums.isRequired: true,
                                kzTextEditEnums.inputType: TextInputType.url,
                                kzTextEditEnums.onSaved: (newValue) {
                                  widget.model!.linkUrl = newValue;
                                }
                              },
                            ),*/
                          KzTextEdit(
                            controller: vm.link,
                            labelText: LocaleKeys.announcementRegistrationPage_text_edit_link_label.tr(),
                            icon: Icons.link,
                            onSaved: (newValue) {
                              model.linkUrl = newValue;
                            },
                          ),
                          SizedBox(
                            height: MyBlock.vertical(context, x: 1),
                          ),
                          ImageUpload(
                            photoList: vm.photoList,
                            picker: vm.picker,
                            imgUrl: vm.imgUrl.text,
                          ),
                          GestureDetector(
                            onTap: () {
                              vm.pinned = !vm.pinned;
                            },
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: MyBlock.horizontal(context, x: 8),
                                    ),
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: MyBlock.horizontal(context, x: 5),
                                          vertical: MyBlock.horizontal(context, x: 4),
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5),
                                          ],
                                          borderRadius: BorderRadius.horizontal(
                                            right: Radius.circular(MyBlock.horizontal(context, x: 10)),
                                            left: Radius.circular(
                                              MyBlock.horizontal(context, x: 10),
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                         !vm.pinned ? LocaleKeys.announcementRegistrationPage_vm_subtitle1.tr() : LocaleKeys.announcementRegistrationPage_vm_subtitle2.tr(),
                                          style: context.textTheme.labelMedium // düzeltilecek 16
                                        ))
                                  ],
                                ),
                                Container(
                                    padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1)),
                                    transform: vm.pinned ? Matrix4.skew(38, 12) : null, //burdan konumu ayarlanacak
                                    decoration: BoxDecoration(shape: BoxShape.circle, color: !vm.pinned ? Color(0xff6551A0) : Color(0xffD43B38)),
                                    child: Icon(Icons.push_pin, color: Colors.white, size: MyBlock.horizontal(context, x: 9)))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MyBlock.vertical(context, x: 2),
                          ),
                          TextButton(
                            onPressed: vm.saveEnable ? () => {vm.addOrUpdate(model, context)} : null,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2)),
                              child: Text(
                                LocaleKeys.announcementRegistrationPage_save_txt.tr(),
                                style: context.textTheme.displayMedium,
                              ),
                            ),
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(Size((MediaQuery.of(context).size.width * 0.7), 50)),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
                              backgroundColor: MaterialStateProperty.all(
                                vm.saveEnable ? Color(0xFF562FE2) : Color(0xFF84818F),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              )),
            ],
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
    } else if (value == "4") {
      vm.visibleClassroom = false;
      vm.visibleTeacher = true;
    } else {
      vm.visibleTeacher = false;
      vm.visibleClassroom = false;
    }
  }
}
