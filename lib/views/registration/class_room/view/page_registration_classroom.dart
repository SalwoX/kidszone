// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kidszone_app/common/utils/app_static.dart';
import 'package:kidszone_app/data/repositories/repository_common.dart';
import 'package:kidszone_app/generated/locale_keys.g.dart';
import 'package:kidszone_app/register.dart';
import 'package:kidszone_app/views/_init/components/appbar/custom_appbar.dart';
import 'package:kidszone_app/views/_init/components/button/save_button_model.dart';
import 'package:kidszone_app/views/_init/components/checbox/kz_checkbox.dart';
import 'package:kidszone_app/views/_init/components/dropdown/dropdownlist/dropdown_search.dart';
import 'package:kidszone_app/views/_init/components/info/info_widget.dart';
import 'package:kidszone_app/views/_init/components/input/kz_edit_widgets.dart';
import 'package:kidszone_app/views/_init/components/widgets/image_upload.dart';
import 'package:kidszone_app/views/_init/components/widgets/kzsnack_widget_minifity.dart';
import 'package:kidszone_app/views/_init/logger/logger_mixin.dart';
import 'package:kidszone_app/views/_init/models/filter_model.dart';
import 'package:kidszone_app/views/_init/models/key_value_model.dart';
import 'package:kidszone_app/views/_init/models/mobile_result.dart';
import 'package:kidszone_app/views/_init/my_block.dart';
import 'package:kidszone_app/views/_init/themes/colors.dart';
import 'package:kidszone_app/views/registration/class_room/model/classroom_model.dart';
import 'package:kidszone_app/views/registration/class_room/service/repository_classroom.dart';
import 'package:kidszone_app/views/registration/teacher/model/teacher_model.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

/* import 'package:kidszone_app/imports/import_components.dart' as kz;
import 'package:kidszone_app/imports/import_repository.dart' as repositories;
import 'package:kidszone_app/imports/import_themes.dart' as themes;
import 'package:kidszone_app/imports/import_common.dart' as core;
import 'package:kidszone_app/imports/import_model.dart' as models;
import 'package:kidszone_app/imports/import_register.dart' as register; */

@immutable
class PageRegistrationClassroom extends StatefulWidget {
  final String title = LocaleKeys.pageRegistrationClassroom_class.tr();
  final String subTitle = "";
  final _formKey = GlobalKey<FormState>();
  ClassroomModel? model;

  var repCommon = resolve<RepositoryCommon>();
  var repRegistration = resolve<RepositoryClassroom>();
  PageRegistrationClassroom({Key? key, this.model}) : super(key: key);

  @override
  _PageRegistrationClassroomState createState() => _PageRegistrationClassroomState();
}

class _PageRegistrationClassroomState extends State<PageRegistrationClassroom> with LoggerMixin {
  bool _saveEnable = true;
  int currentIndexPage = 4;
  var _name = TextEditingController();
  var _classTour = TextEditingController();
  var _description = TextEditingController();
  var _imgUrl = TextEditingController();
  var _teacherId1 = TextEditingController();
  var _teacherId2 = TextEditingController();
  bool? _active;

  var _picker = ImagePicker();
  List<File> photoList = [];

  @override
  void initState() {
    super.initState();
    currentIndexPage = 4;
    if (widget.model != null && widget.model!.id != 0) {
      setState(() {
        //! özel modelden okunması gereken datalar
        _name.text = widget.model?.name ?? "";
        _classTour.text = widget.model?.classTour.toString() ?? "";
        _description.text = widget.model?.description ?? "";
        _imgUrl.text = widget.model?.imgUrl ?? "";
        _active = widget.model?.active ?? true;
        _teacherId1.text = widget.model?.teacherId1.toString() ?? "";
        _teacherId2.text = widget.model?.teacherId2.toString() ?? "";
      });
    } else {
      widget.model = ClassroomModel(id: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _saveEnable
          ? SaveButtonModal(
              buttons: [
                SaveModalButton(
                  onTab: () => {
                    setState(() {
                      _saveEnable = false;
                    }),
                    _save(),
                  },
                  enable:
                      /*//!widget.model!.kayitDurum != 2 &&*/
                      _saveEnable,
                  icon: Icons.save,
                  text: LocaleKeys.pageRegistrationClassroom_save.tr(),
                ),
              ],
              title: " ${widget.title} İşlemler",
            )
          : null,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            CustomAppBar(
              innerBoxIsScrolled,
              headerWidgets: [
                Text(
                  widget.title,
                  style: context.textTheme.bodyMedium,
                ),
                Text(
                  widget.subTitle,
                  style: context.textTheme.bodySmall,
                ),
              ],
              isBackButton: true,
              appbarHeight: 90,
            ),
          ];
        },
        body: Form(
            key: widget._formKey,
            child: Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MyBlock.horizontal(context, x: 1),
                    ),
                    child: Column(
                      children: [
                        KzTextEdit(
                          controller: _name,
                          labelText: LocaleKeys.pageRegistrationClassroom_class_name.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.name = newValue;
                          },
                        ),

                        //siniftTur
                        DropdownSearch<KeyValueModel>(
                          dropdownSearchDecoration: InputDecoration(
                            hintText: LocaleKeys.condition_select.tr(),
                            labelText: LocaleKeys.pageRegistrationClassroom_class_type.tr(),
                            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 1)),
                            labelStyle: context.textTheme.labelMedium,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          onSaved: (model) {
                            if (model != null) widget.model!.classTour = model.key.toInt();
                          },
                          showSearchBox: false,
                          maxHeight: 300,
                          mode: Mode.BOTTOM_SHEET,
                          showClearButton: false,
                          showSelectedItems: true,
                          compareFn: (item, selectedItem) => item?.key.toInt() == selectedItem?.key.toInt(),
                          onFind: (filter) async {
                            var list = AppStatic.classType;
                            return list;
                          },
                          itemAsString: (val) => "${val!.value!}",
                          selectedItem: AppStatic.classType.firstWhere((element) => element.key == _classTour.text),
                        ),
                        DropdownSearch<TeacherModel>(
                          dropdownSearchDecoration: InputDecoration(
                            hintText: LocaleKeys.pageRegistrationClassroom_choose.tr(),
                            labelText: LocaleKeys.pageRegistrationClassroom_teacher_one.tr(),
                            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 1)),
                            labelStyle: context.textTheme.labelMedium,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          onSaved: (model) {
                            if (model != null) {
                              widget.model!.teacherId1 = model.id;
                            }
                          },
                          maxHeight: 300,
                          mode: Mode.BOTTOM_SHEET,
                          showClearButton: true,
                          isFilteredOnline: true,
                          searchFieldProps: TextFieldProps(
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear, color: ThemeColors.white, size: MyBlock.horizontal(context, x: 30)),
                                onPressed: () {
                                  _teacherId1.clear();
                                },
                              ),
                            ),
                          ),
                          compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
                          filterFn: (item, filter) {
                            if (filter!.isEmpty) return true;
                            return item!.nameSurname!.toLowerCase().contains(filter.toLowerCase());
                          },
                          onFind: (filter) async {
                            var fields = <Field>[];
                            if (filter != null && filter.isNotEmpty) {
                              fields.add(Field(fieldName: "Adi", fieldOperator: "startswith", fieldValue: filter));
                            }
                            var list = await widget.repCommon.getTeacherList(fields);
                            return list;
                          },
                          itemAsString: (val) => "${val!.nameSurname!}",
                          controller: _teacherId1,
                          selectedItemFuture: (filter) async {
                            var fields = <Field>[];
                            if (filter != null && filter.isNotEmpty) {
                              fields.add(Field(fieldName: "Id", fieldOperator: "eq", fieldValue: filter));
                            }
                            var list = await widget.repCommon.getTeacherList(fields);
                            return list;
                          },
                        ),

                        DropdownSearch<TeacherModel>(
                          dropdownSearchDecoration: InputDecoration(
                            hintText: LocaleKeys.pageRegistrationClassroom_choose.tr(),
                            labelText: LocaleKeys.pageRegistrationClassroom_teacher_two.tr(),
                            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 1)),
                            labelStyle: context.textTheme.labelMedium,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          onSaved: (model) {
                            if (model != null) {
                              widget.model!.teacherId2 = model.id;
                            }
                          },
                          maxHeight: 300,
                          mode: Mode.BOTTOM_SHEET,
                          showClearButton: true,
                          isFilteredOnline: true,
                          searchFieldProps: TextFieldProps(
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear, color: ThemeColors.white, size: MyBlock.horizontal(context, x: 30)),
                                onPressed: () {
                                  _teacherId2.clear();
                                },
                              ),
                            ),
                          ),
                          compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
                          filterFn: (item, filter) {
                            if (filter!.isEmpty) return true;
                            return item!.nameSurname!.toLowerCase().contains(filter.toLowerCase());
                          },
                          onFind: (filter) async {
                            var fields = <Field>[];
                            if (filter != null && filter.isNotEmpty) {
                              fields.add(Field(fieldName: "Adi", fieldOperator: "startswith", fieldValue: filter));
                            }
                            var list = widget.repCommon.getTeacherList(fields);
                            return list;
                          },
                          itemAsString: (val) => "${val!.nameSurname!}",
                          controller: _teacherId2,
                          selectedItemFuture: (filter) async {
                            var fields = <Field>[];
                            if (filter != null && filter.isNotEmpty) {
                              fields.add(Field(fieldName: "Id", fieldOperator: "eq", fieldValue: filter));
                            }
                            var list = await widget.repCommon.getTeacherList(fields);
                            return list;
                          },
                        ),

                        KzTextEdit(
                          controller: _description,
                          labelText: LocaleKeys.pageRegistrationClassroom_explanation.tr(),
                          icon: Icons.title,
                          onSaved: (newValue) {
                            widget.model!.description = newValue;
                          },
                        ),

                        ImageUpload(
                          photoList: photoList,
                          picker: _picker,
                          imgUrl: _imgUrl.text,
                        ),
                        //aktif
                        KzCheckBox(
                          title: LocaleKeys.pageRegistrationClassroom_active.tr(),
                          checkedValue: _active ?? true,
                          onChanged: (newValue) {
                            setState(() {
                              _active = newValue;
                              widget.model!.active = newValue;
                            });
                          },
                        ),
                        widget.model!.id != 0
                            ? InfoWidget(
                                id: widget.model?.id,
                                registrant: widget.model?.registrant,
                                registrationDate: widget.model?.registrationDate,
                                modifier: widget.model?.modifier,
                                modifiedDate: widget.model?.modifiedDate,
                              )
                            : Container(),
                      ],
                    ),
                  ),
                )),
              ],
            )),
      ),
    );
  }

  _save() async {
    if (widget._formKey.currentState!.validate()) {
      try {
        widget._formKey.currentState!.save();
        //! özel modele eklenmesi gereken datalar
        var res = await widget.repRegistration.addOrUpdate(model: widget.model as ClassroomModel, files: photoList);
        if (res is ClassroomModel) {
          showTopSnackBar(
            context,
            KzSnackWidgetMinifit(
              message: LocaleKeys.pageRegistrationClassroom_saved.tr(),
              messageType: MessageType.Success,
            ),
          );

          widget.model = res;
        } else if (res is MobileResult) {
          showTopSnackBar(
            context,
            KzSnackWidgetMinifit(
              message: LocaleKeys.pageRegistrationClassroom_warning.tr() + (res.message ?? ''),
              messageType: MessageType.Error,
            ),
          );
        }
      } catch (e) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageRegistrationClassroom_warning_messages.tr(),
            messageType: MessageType.Error,
          ),
        );
      }
    }
    setState(() {
      _saveEnable = true;
    });
  }
}
