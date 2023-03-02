import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../common/notifications/notifications.dart';
import '../../../../data/repositories/repository_common.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../register.dart';
import '../../../_init/components/appbar/custom_appbar.dart';
import '../../../_init/components/button/save_button_model.dart';
import '../../../_init/components/checbox/kz_checkbox.dart';
import '../../../_init/components/dropdown/dropdownlist/dropdown_search.dart';
import '../../../_init/components/info/info_widget.dart';
import '../../../_init/components/input/kz_edit_widgets.dart';
import '../../../_init/components/picker_grid/picker_grid.dart';
import '../../../_init/components/widgets/kzsnack_widget_minifity.dart';
import '../../../_init/logger/logger_mixin.dart';
import '../../../_init/models/filter_model.dart';
import '../../../_init/models/mobile_result.dart';
import '../../../_init/my_block.dart';
import '../../../_init/themes/colors.dart';
import '../../class_room/model/classroom_model.dart';
import '../../teacher/model/teacher_model.dart';
import '../model/lesson_model.dart';
import '../service/repository_lesson.dart';

@immutable
// ignore: must_be_immutable
class PageRegistrationLesson extends StatefulWidget {
  final String title = LocaleKeys.pageRegistrationLesson_lesson_registration.tr();
  final String subTitle = "";
  final _formKey = GlobalKey<FormState>();
  LessonModel? model;

  var repCommon = resolve<RepositoryCommon>();
  var repRegistration = resolve<RepositoryLesson>();
  PageRegistrationLesson({Key? key, this.model}) : super(key: key);

  @override
  _PageRegistrationLessonState createState() => _PageRegistrationLessonState();
}

class _PageRegistrationLessonState extends State<PageRegistrationLesson> with LoggerMixin {
  bool _saveEnable = true;
  int currentIndexPage = 4;
  bool? _active;
  var _classroomId = TextEditingController();
  var _teacherId = TextEditingController();
  var _name = TextEditingController();
  var _shortName = TextEditingController();
  var _description = TextEditingController();
  var _color = TextEditingController();
  var _credit = TextEditingController();

  @override
  void initState() {
    super.initState();
    currentIndexPage = 4;
    if (widget.model != null && widget.model!.id != 0) {
      setState(() {
        //! özel modelden okunması gereken datalar
        _active = widget.model?.active ?? true;
        _classroomId.text = widget.model?.classroomId.toString() ?? "";
        _teacherId.text = widget.model?.teacherId.toString() ?? "";
        _name.text = widget.model?.name ?? "";
        _shortName.text = widget.model?.shortName ?? "";
        _description.text = widget.model?.description ?? "";
        _color.text = widget.model?.color ?? "";
        _credit.text = widget.model?.credit.toString() ?? "";
      });
    } else {
      widget.model = LessonModel(id: 0);
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
                  text: LocaleKeys.pageRegistrationLesson_save.tr(),
                ),
              ],
              title: LocaleKeys.pageRegistrationLesson_lesson_regis_trans.tr(),
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
                  style: context.textTheme.displayLarge,
                ),
                Text(
                  widget.subTitle,
                  style: context.textTheme.displaySmall,
                )
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
                          labelText: LocaleKeys.pageRegistrationLesson_name.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.name = newValue;
                          },
                        ),
                        KzTextEdit(
                          controller: _shortName,
                          labelText: LocaleKeys.pageRegistrationLesson_short_name.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.shortName = newValue;
                          },
                        ),
                        DropdownSearch<ClassroomModel>.multiSelection(
                          dropdownSearchDecoration: InputDecoration(
                            hintText: LocaleKeys.pageRegistrationLesson_choose.tr(),
                            labelText: LocaleKeys.pageRegistrationLesson_classes_in.tr(),
                            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 1)),
                            labelStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: MyBlock.vertical(context, x: 1.7),
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          onSaved: (model) {
                            if (model != null) {
                              widget.model!.classroomId = model.map((e) => e.id).join(',');
                            }
                          },
                          maxHeight: 300,
                          mode: Mode.BOTTOM_SHEET,
                          showClearButton: true,
                          isFilteredOnline: true,
                          searchFieldProps: TextFieldProps(
                            controller: _classroomId,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear, color: ThemeColors.white, size: MyBlock.horizontal(context, x: 30)),
                                onPressed: () {
                                  _classroomId.clear();
                                },
                              ),
                            ),
                          ),
                          compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
                          filterFn: (item, filter) {
                            if (filter!.isEmpty) return true;
                            return item!.name!.toLowerCase().contains(filter.toLowerCase());
                          },
                          onFind: (filter) async {
                            var fields = <Field>[];
                            if (filter != null && filter.isNotEmpty) {
                              fields.add(Field(fieldName: "Adi", fieldOperator: "startswith", fieldValue: filter));
                            }
                            var list = widget.repCommon.getClassroomList(fields);
                            return list;
                          },
                          itemAsString: (val) => "${val!.name!} || ${val.description!}",
                          controller: _classroomId,
                          selectedItemFuture: (filter) async {
                            var fields = <Field>[];
                            if (filter != null && filter.isNotEmpty) {
                              fields.add(Field(fieldName: "Id", fieldOperator: "eq", fieldValue: filter));
                            }
                            var list = await widget.repCommon.getClassroomList(fields);
                            return list;
                          },
                        ),
                        DropdownSearch<TeacherModel>(
                          dropdownSearchDecoration: InputDecoration(
                            hintText: LocaleKeys.pageRegistrationLesson_choose.tr(),
                            labelText: LocaleKeys.pageRegistrationLesson_teacher.tr(),
                            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 1)),
                            labelStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: MyBlock.vertical(context, x: 1.7),
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          onSaved: (model) {
                            if (model != null) {
                              widget.model!.teacherId = model.id;
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
                                  _teacherId.clear();
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
                          controller: _teacherId,
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
                          labelText: LocaleKeys.pageRegistrationLesson_explanation.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.description = newValue;
                          },
                        ),
                        PickerGrid(
                          screenPickerColor: _color,
                          heading: LocaleKeys.pageRegistrationLesson_class_color.tr(),
                        ),
                        KzTextEdit(
                          controller: _color,
                          labelText: LocaleKeys.pageRegistrationLesson_color.tr(),
                          icon: Icons.title,
                          isRequired: false,
                          enabled: false,
                          onSaved: (newValue) {
                            widget.model!.color = newValue;
                          },
                        ),
                        KzCheckBox(
                          title: LocaleKeys.pageRegistrationLesson_active.tr(),
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
        var res = await widget.repRegistration.addOrUpdate(model: widget.model as LessonModel);
        if (res is LessonModel) {
          showTopSnackBar(
            context,
            KzSnackWidgetMinifit(
              message: LocaleKeys.pageRegistrationLesson_saved.tr(),
              messageType: MessageType.Success,
            ),
          );

          widget.model = res;
        } else if (res is MobileResult) {
          Notifications().sendMessage(null, res.message, widget.model);
          showTopSnackBar(
            context,
            KzSnackWidgetMinifit(
              message: LocaleKeys.pageRegistrationLesson_warning.tr() + (res.message ?? ''),
              messageType: MessageType.Error,
            ),
          );
        }
      } catch (e) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageRegistrationLesson_error_massage.tr(),
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
