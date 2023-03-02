import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../data/repositories/repository_common.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../register.dart';
import '../../../_init/components/appbar/custom_appbar.dart';
import '../../../_init/components/button/save_button_model.dart';
import '../../../_init/components/checbox/kz_checkbox.dart';
import '../../../_init/components/datetime/kz_datetime.dart';
import '../../../_init/components/dropdown/dropdownlist/dropdown_search.dart';
import '../../../_init/components/info/info_widget.dart';
import '../../../_init/components/input/kz_edit_widgets.dart';
import '../../../_init/components/switch/gender.dart';
import '../../../_init/components/widgets/image_upload.dart';
import '../../../_init/components/widgets/kzsnack_widget_minifity.dart';
import '../../../_init/logger/logger_mixin.dart';
import '../../../_init/models/filter_model.dart';
import '../../../_init/models/mobile_result.dart';
import '../../../_init/my_block.dart';
import '../../../_init/themes/colors.dart';
import '../../../school_operations/group_operations/model/group_model.dart';
import '../../class_room/model/classroom_model.dart';
import '../../service_station/model/school_bus_model.dart';
import '../model/student_model.dart';
import '../service/repository_student.dart';

// ignore: must_be_immutable
class PageRegistrationStudent extends StatefulWidget {
  final String title = LocaleKeys.pageRegisStudent_student_regis.tr();
  final String subTitle = LocaleKeys.pageRegisStudent_student_regis_edit.tr();
  final _formKey = GlobalKey<FormState>();
  StudentModel? model;

  var repCommon = resolve<RepositoryCommon>();
  var repRegistration = resolve<RepositoryStudent>();
  PageRegistrationStudent({Key? key, this.model}) : super(key: key);

  @override
  _PageRegistrationStudentState createState() => _PageRegistrationStudentState();
}

class _PageRegistrationStudentState extends State<PageRegistrationStudent> with LoggerMixin {
  bool _saveEnable = true;
  int currentIndexPage = 4;
  bool? _active;
  var _nameSurname = TextEditingController();
  bool? _isCitizenTC;
  var _idNo = TextEditingController();
  var _lessonClass = TextEditingController();
  var _studyClass = TextEditingController();
  var _studentNumber = TextEditingController();
  var _dateOfBirth = TextEditingController();
  var _disease = TextEditingController();
  var _startTime = TextEditingController();
  var _address = TextEditingController();
  var _description = TextEditingController();
  var _schoolBus = TextEditingController();
  var _imgUrl = TextEditingController();
  var _files = TextEditingController();
  var _bloodGroup = TextEditingController();
  var _picker = ImagePicker();
  List<File> photoList = [];

  @override
  void initState() {
    super.initState();
    currentIndexPage = 4;
    if (widget.model != null && widget.model!.id != 0) {
      setState(() {
        _active = widget.model?.active ?? true;
        _nameSurname.text = widget.model?.nameSurname ?? "";
        _isCitizenTC = widget.model?.isCitizenTC ?? false;
        _idNo.text = widget.model?.idNo ?? "";
        _lessonClass.text = widget.model?.lessonClass.toString() ?? "";
        _studyClass.text = widget.model?.studyClass ?? "";
        _studentNumber.text = widget.model?.studentNumber ?? "";
        _bloodGroup.text = widget.model?.bloodGroup.toString() ?? "";
        _dateOfBirth.text = widget.model!.birthDate != null ? DateFormat("dd.MM.yyyy").format(widget.model!.birthDate!) : "";
        _disease.text = widget.model?.disease ?? "";
        _startTime.text = widget.model!.startDate != null ? DateFormat("dd.MM.yyyy").format(widget.model!.startDate!) : "";
        _address.text = widget.model?.address ?? "";
        _description.text = widget.model?.description ?? "";
        _schoolBus.text = widget.model?.schoolBusId.toString() ?? "";
        _imgUrl.text = widget.model?.imgUrl ?? "";
        _files.text = widget.model?.files ?? "";
      });
    } else {
      widget.model = StudentModel(id: 0);
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
                  enable: _saveEnable,
                  icon: Icons.save,
                  text: LocaleKeys.pageRegisStudent_save.tr(),
                ),
              ],
              title: LocaleKeys.pageRegisStudent_regis_trans.tr(),
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
                          controller: _nameSurname,
                          labelText: LocaleKeys.pageRegisStudent_name_surname.tr(),
                          //   icon: Icons.verified_user,
                          svgPath: $AssetsIconsGen().aramaYapmaIconu,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.nameSurname = newValue!;
                          },
                        ),
                        KzCheckBox(
                          title: LocaleKeys.pageRegisStudent_tc_citizen.tr(),
                          checkedValue: _isCitizenTC ?? false,
                          onChanged: (newValue) {
                            setState(() {
                              _isCitizenTC = newValue!;
                              widget.model!.isCitizenTC = newValue;
                            });
                          },
                        ),
                        KzTextEdit(
                          controller: _idNo,
                          labelText: LocaleKeys.pageRegisStudent_tc.tr(),
                          icon: Icons.credit_score_rounded,
                          isRequired: false,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.idNo = newValue!;
                          },
                        ), //cinsiyet
                        Gender(
                          gender: widget.model?.gender,
                          onPress: (index) {
                            setState(() {
                              widget.model!.gender = index == 0 ? 2 : 1;
                            });
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        DropdownSearch<GroupModel>(
                          dropdownSearchDecoration: InputDecoration(
                            contentPadding: EdgeInsets.all(1),
                            icon: Icon(Icons.more_horiz),
                            hintText: LocaleKeys.pageRegisStudent_choose.tr(),
                            labelText: LocaleKeys.pageRegisStudent_blood_group.tr(),
                            labelStyle: context.textTheme.labelMedium,
                          ),
                          onSaved: (model) {
                            widget.model!.bloodGroup = model!.id;
                          },
                          maxHeight: 500,
                          mode: Mode.BOTTOM_SHEET,
                          showClearButton: true,
                          isFilteredOnline: true,
                          searchFieldProps: TextFieldProps(
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear, color: ThemeColors.white, size: MyBlock.horizontal(context, x: 30)),
                                onPressed: () {
                                  _lessonClass.clear();
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
                              fields.add(Field(fieldName: "Name", fieldOperator: "startswith", fieldValue: filter));
                              fields.add(Field(fieldName: "Type", fieldOperator: "eq", fieldValue: "4"));
                            }

                            var list = widget.repCommon.getBloodGroupList(fields);
                            return list;
                          },
                          itemAsString: (val) => "${val!.name!}",
                          controller: _bloodGroup,
                          selectedItemFuture: (filter) async {
                            var fields = <Field>[];
                            if (filter != null && filter.isNotEmpty) {
                              fields.add(Field(fieldName: "Id", fieldOperator: "eq", fieldValue: filter));
                            }
                            var list = await widget.repCommon.getBloodGroupList(fields);
                            return list;
                          },
                        ).paddingTop(10),

                        DropdownSearch<ClassroomModel>(
                          dropdownSearchDecoration: InputDecoration(
                              contentPadding: EdgeInsets.all(1),
                              icon: Icon(Icons.more_horiz),
                              hintText: LocaleKeys.pageRegisStudent_choose.tr(),
                              labelText: LocaleKeys.pageRegisStudent_lesson_class.tr(),
                              labelStyle: context.textTheme.labelMedium //16
                              ),
                          onSaved: (model) {
                            widget.model!.lessonClass = model!.id;
                          },
                          maxHeight: 500,
                          mode: Mode.BOTTOM_SHEET,
                          showClearButton: true,
                          isFilteredOnline: true,
                          searchFieldProps: TextFieldProps(
                            controller: _lessonClass,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear, color: ThemeColors.white, size: 30.0),
                                onPressed: () {
                                  _lessonClass.clear();
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
                            var list = widget.repCommon.getLessonClassList(fields);
                            return list;
                          },
                          itemAsString: (val) => "${val!.name!}",
                          controller: _lessonClass,
                          selectedItemFuture: (filter) async {
                            var fields = <Field>[];
                            if (filter != null && filter.isNotEmpty) {
                              fields.add(Field(fieldName: "Id", fieldOperator: "eq", fieldValue: filter));
                            }
                            var list = await widget.repCommon.getLessonClassList(fields);
                            return list;
                          },
                        ).paddingTop(10.0),
                        DropdownSearch<ClassroomModel>.multiSelection(
                          dropdownSearchDecoration: InputDecoration(
                            hintText: LocaleKeys.pageRegisStudent_choose.tr(),
                            labelText: LocaleKeys.pageRegisStudent_study_class.tr(),
                            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 1)),
                            labelStyle: context.textTheme.labelMedium, //16
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          onSaved: (models) {
                            var etutsiniflari = models!.map((e) => e.id).toList().join(',');
                            widget.model!.studyClass = etutsiniflari;
                          },
                          maxHeight: 500,
                          mode: Mode.BOTTOM_SHEET,
                          showClearButton: true,
                          isFilteredOnline: true,
                          searchFieldProps: TextFieldProps(
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear, color: ThemeColors.white, size: MyBlock.horizontal(context, x: 30)),
                                onPressed: () {
                                  _studyClass.clear();
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
                            var list = widget.repCommon.getLessonClassList(fields);
                            return list;
                          },
                          itemAsString: (val) => "${val!.name!}",
                          controller: _lessonClass,
                          selectedItemFuture: (filter) async {
                            var fields = <Field>[];
                            if (filter != null && filter.isNotEmpty) {
                              fields.add(Field(fieldName: "Id", fieldOperator: "eq", fieldValue: filter));
                            }
                            var list = await widget.repCommon.getLessonClassList(fields);
                            return list;
                          },
                        ),
                        DropdownSearch<SchoolBusModel>(
                          dropdownSearchDecoration: InputDecoration(
                            hintText: LocaleKeys.pageRegisStudent_choose.tr(),
                            labelText: LocaleKeys.pageRegisStudent_service.tr(),
                            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 1)),
                            labelStyle: context.textTheme.labelMedium, //16
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          onSaved: (model) {
                            widget.model!.schoolBusId = model!.id;
                          },
                          maxHeight: 500,
                          mode: Mode.BOTTOM_SHEET,
                          showClearButton: true,
                          isFilteredOnline: true,
                          searchFieldProps: TextFieldProps(
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear, color: ThemeColors.white, size: MyBlock.horizontal(context, x: 30)),
                                onPressed: () {
                                  _studentNumber.clear();
                                },
                              ),
                            ),
                          ),
                          compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
                          filterFn: (item, filter) {
                            if (filter!.isEmpty) return true;
                            return item!.profileName!.toLowerCase().contains(filter.toLowerCase());
                          },
                          onFind: (filter) async {
                            var fields = <Field>[];
                            if (filter != null && filter.isNotEmpty) {
                              fields.add(Field(fieldName: "Adi", fieldOperator: "startswith", fieldValue: filter));
                            }

                            var list = widget.repCommon.getSchoolBusList(fields);
                            return list;
                          },
                          itemAsString: (val) => "${val!.profileName!}",
                          controller: _schoolBus,
                          selectedItemFuture: (filter) async {
                            var fields = <Field>[];
                            if (filter != null && filter.isNotEmpty) {
                              fields.add(Field(fieldName: "Id", fieldOperator: "eq", fieldValue: filter));
                            }
                            var list = await widget.repCommon.getSchoolBusList(fields);
                            return list;
                          },
                        ),

                        KzDateTime(
                          controller: _dateOfBirth,
                          labelText: LocaleKeys.pageRegisStudent_birthday.tr(),
                          isRequired: true,
                          onSaved: (newValue) {
                            if (newValue != null) widget.model!.birthDate = DateFormat("dd.MM.yyyy").parse(newValue);
                          },
                        ).paddingTop(5),
                        KzTextEdit(
                          controller: _studentNumber,
                          labelText: LocaleKeys.pageRegisStudent_student_no.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.studentNumber = newValue!;
                          },
                        ),
                        KzTextEdit(
                          controller: _disease,
                          labelText: LocaleKeys.pageRegisStudent_known_disease.tr(),
                          icon: Icons.title,
                          isRequired: false,
                          onSaved: (newValue) {
                            widget.model!.disease = newValue!;
                          },
                        ),

                        KzDateTime(
                          controller: _startTime,
                          labelText: LocaleKeys.pageRegisStudent_start_date.tr(),
                          isRequired: true,
                          onSaved: (newValue) {
                            if (newValue != null) widget.model!.startDate = DateFormat("dd.MM.yyyy").parse(newValue);
                          },
                        ),
                        KzTextEditMultiLine(
                          controller: _address,
                          labelText: LocaleKeys.pageRegisStudent_address.tr(),
                          icon: Icons.title,
                          isRequired: false,
                          onSaved: (newValue) {
                            widget.model!.address = newValue!;
                          },
                          maxLines: 3,
                        ),
                        KzTextEditMultiLine(
                          controller: _description,
                          labelText: LocaleKeys.pageRegisStudent_explanation.tr(),
                          icon: Icons.title,
                          isRequired: false,
                          onSaved: (newValue) {
                            widget.model!.description = newValue!;
                          },
                          maxLines: 3,
                        ),
                        KzCheckBox(
                          title: LocaleKeys.pageRegisStudent_active.tr(),
                          checkedValue: _active ?? true,
                          onChanged: (newValue) {
                            setState(() {
                              _active = newValue!;
                              widget.model!.active = newValue;
                            });
                          },
                        ),
                        ImageUpload(
                          photoList: photoList,
                          picker: _picker,
                          imgUrl: _imgUrl.text,
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
        var res = await widget.repRegistration.addOrUpdate(
          model: widget.model as StudentModel,
          files: photoList,
        );
        if (res is StudentModel) {
          showTopSnackBar(
            context,
            KzSnackWidgetMinifit(
              message: LocaleKeys.pageRegisStudent_saved.tr(),
              messageType: MessageType.Success,
            ),
          );

          widget.model = res;
        } else if (res is MobileResult) {
          showTopSnackBar(
            context,
            KzSnackWidgetMinifit(
              message: LocaleKeys.pageRegisStudent_warning.tr() + (res.message ?? ''),
              messageType: MessageType.Error,
            ),
          );
        }
      } catch (e) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageRegisStudent_warning_messages.tr(),
            messageType: MessageType.Error,
          ),
        );
      }
      //! özel modele eklenmesi gereken datalar

    } else {
      showTopSnackBar(
        context,
        KzSnackWidgetMinifit(
          message: LocaleKeys.pageRegisStudent_fill_space.tr(),
          messageType: MessageType.Error,
        ),
      );
    }
    setState(() {
      _saveEnable = true;
    });
  }
}
