import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../data/repositories/repository_common.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../register.dart';
import '../../../_init/components/appbar/custom_appbar.dart';
import '../../../_init/components/button/save_button_model.dart';
import '../../../_init/components/checbox/kz_checkbox.dart';
import '../../../_init/components/datetime/kz_datetime.dart';
import '../../../_init/components/dropdown/dropdownlist/dropdown_search.dart';
import '../../../_init/components/info/info_widget.dart';
import '../../../_init/components/input/kz_edit_widgets.dart';
import '../../../_init/components/picker_grid/picker_grid.dart';
import '../../../_init/components/widgets/image_upload.dart';
import '../../../_init/components/widgets/kzsnack_widget_minifity.dart';
import '../../../_init/logger/logger_mixin.dart';
import '../../../_init/models/filter_model.dart';
import '../../../_init/models/mobile_result.dart';
import '../../../_init/my_block.dart';
import '../../../_init/themes/colors.dart';
import '../../class_room/model/classroom_model.dart';
import '../model/teacher_model.dart';
import '../service/repository_teacher.dart';

@immutable
// ignore: must_be_immutable
class PageRegistrationTeacher extends StatefulWidget {
  final String title = LocaleKeys.pageRegisTeacher_teacher_regis.tr();
  final String subTitle = "";
  final _formKey = GlobalKey<FormState>();
  TeacherModel? model;

  var repCommon = resolve<RepositoryCommon>();
  var repRegistration = resolve<RepositoryTeacher>();
  PageRegistrationTeacher({Key? key, this.model}) : super(key: key);

  @override
  _PageRegistrationTeacherState createState() => _PageRegistrationTeacherState();
}

class _PageRegistrationTeacherState extends State<PageRegistrationTeacher> with LoggerMixin {
  bool _saveEnable = true;
  int currentIndexPage = 4;
  bool? _active;
  var _nameSurname = TextEditingController();
  var _idNo = TextEditingController();
  var _phoneNumber = TextEditingController();
  var _password = TextEditingController();
  var _mail = TextEditingController();
  var _visibleClass = TextEditingController();
  var _color = TextEditingController();
  var _dateOfBirth = TextEditingController();
  var _address = TextEditingController();
  var _description = TextEditingController();
  var _lessonClass = TextEditingController();
  var _imgUrl = TextEditingController();
  var _permission = TextEditingController();
  bool? _mobileLogin;
  bool? _webLogin;
  var _picker = ImagePicker();
  var photoList = <File>[];

  @override
  void initState() {
    super.initState();
    currentIndexPage = 4;
    if (widget.model != null && widget.model!.id != 0) {
      setState(() {
        //! özel modelden okunması gereken datalar
        _active = widget.model?.active ?? true;
        _nameSurname.text = widget.model?.nameSurname ?? "";
        _idNo.text = widget.model?.idNo ?? "";
        _phoneNumber.text = widget.model?.phoneNumber ?? "";
        _password.text = widget.model?.password ?? "";
        _mail.text = widget.model?.mail ?? "";
        _visibleClass.text = widget.model?.visibleClassroom.toString() ?? "0";
        _color.text = widget.model?.color ?? Colors.red.toString();
        _dateOfBirth.text = widget.model != null ? DateFormat("dd.MM.yyyy").format(widget.model!.birthDate!) : "";
        _address.text = widget.model?.address ?? "";
        _description.text = widget.model?.description ?? "";
        _lessonClass.text = widget.model?.lessonClass ?? "";
        _imgUrl.text = widget.model?.imgUrl ?? "";
        _permission.text = widget.model?.permission.toString() ?? "";
        _mobileLogin = widget.model?.mobileLogin ?? false;
        _webLogin = widget.model?.webLogin ?? false;
      });
    } else {
      widget.model = TeacherModel(id: 0);
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
                  text: LocaleKeys.pageRegisTeacher_save.tr(),
                ),
              ],
              title: '${widget.title} İşlemler',
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
                          labelText: LocaleKeys.pageRegisTeacher_name_surname.tr(),
                          icon: Icons.account_circle,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.nameSurname = newValue;
                          },
                        ),
                        KzTextEdit(
                          controller: _idNo,
                          labelText: LocaleKeys.pageRegisTeacher_tc.tr(),
                          icon: Icons.comment_bank_outlined,
                          isRequired: true,
                          inputType: TextInputType.number,
                          onSaved: (newValue) {
                            widget.model!.idNo = newValue;
                          },
                        ),
                        KzTextEdit(
                          controller: _phoneNumber,
                          labelText: LocaleKeys.pageRegisTeacher_telephone.tr(),
                          icon: Icons.phone_iphone_outlined,
                          isRequired: true,
                          inputType: TextInputType.phone,
                          onSaved: (newValue) {
                            widget.model!.phoneNumber = newValue;
                          },
                        ),
                        KzTextEdit(
                          controller: _password,
                          labelText: LocaleKeys.pageRegisTeacher_password.tr(),
                          icon: Icons.password,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.password = newValue;
                          },
                        ),
                        KzDateTime(
                          controller: _dateOfBirth,
                          labelText: LocaleKeys.pageRegisTeacher_birthday.tr(),
                          startingDate: DateTime(1900),
                          isRequired: true,
                          onSaved: (newValue) {
                            if (newValue != null) widget.model!.birthDate = DateFormat("dd.MM.yyyy").parse(newValue);
                          },
                        ),
                        KzTextEdit(
                          controller: _mail,
                          labelText: LocaleKeys.pageRegisTeacher_mail.tr(),
                          icon: Icons.mail_outline,
                          isRequired: true,
                          inputType: TextInputType.emailAddress,
                          onSaved: (newValue) {
                            widget.model!.mail = newValue;
                          },
                        ),
                        KzTextEditMultiLine(
                          controller: _address,
                          labelText: LocaleKeys.pageRegisTeacher_address.tr(),
                          icon: Icons.location_on,
                          isRequired: true,
                          maxLines: 3,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.address = newValue;
                          },
                        ),
                        DropdownSearch<ClassroomModel>(
                          dropdownSearchDecoration: InputDecoration(
                            hintText: LocaleKeys.pageRegisTeacher_choose.tr(),
                            labelText: LocaleKeys.pageRegisTeacher_entry_class.tr(),
                            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 1)),
                            labelStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: MyBlock.vertical(context, x: 1.7),
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          onSaved: (model) {
                            if (model != null) widget.model!.visibleClassroom = model.id;
                          },
                          maxHeight: 300,
                          mode: Mode.BOTTOM_SHEET,
                          showClearButton: true,
                          isFilteredOnline: true,
                          searchFieldProps: TextFieldProps(
                            controller: _visibleClass,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear, color: ThemeColors.white, size: MyBlock.horizontal(context, x: 30)),
                                onPressed: () {
                                  _visibleClass.clear();
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
                          itemAsString: (val) => "${val!.name} || ${val.description}",
                          controller: _visibleClass,
                          selectedItemFuture: (filter) async {
                            var fields = <Field>[];
                            if (filter != null && filter.isNotEmpty) {
                              fields.add(Field(fieldName: "Id", fieldOperator: "eq", fieldValue: filter));
                            }
                            var list = await widget.repCommon.getLessonClassList(fields);
                            return list;
                          },
                        ),
                        PickerGrid(
                          screenPickerColor: _color,
                          heading: LocaleKeys.pageRegisTeacher_teacher_color.tr(),
                        ),
                        KzTextEdit(
                          controller: _color,
                          labelText: LocaleKeys.pageRegisTeacher_choosed_teacher_color.tr(),
                          icon: Icons.color_lens,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.color = newValue;
                          },
                          enabled: false,
                        ),
                        KzTextEditMultiLine(
                          controller: _description,
                          labelText: LocaleKeys.pageRegisTeacher_explanation.tr(),
                          icon: Icons.description,
                          isRequired: false,
                          maxLines: 3,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.description = newValue;
                          },
                        ),
                        ImageUpload(
                          photoList: photoList,
                          picker: _picker,
                          imgUrl: _imgUrl.text,
                        ),
                        KzCheckBox(
                          title: LocaleKeys.pageRegisTeacher_mobile_login.tr(),
                          checkedValue: _mobileLogin ?? false,
                          icon: Icons.mobile_friendly,
                          onChanged: (newValue) {
                            setState(() {
                              _mobileLogin = newValue;
                              widget.model!.mobileLogin = newValue;
                            });
                          },
                        ),
                        KzCheckBox(
                          title: LocaleKeys.pageRegisTeacher_web_login.tr(),
                          checkedValue: _webLogin ?? false,
                          icon: Icons.web,
                          onChanged: (newValue) {
                            setState(() {
                              _webLogin = newValue;
                              widget.model!.webLogin = newValue;
                            });
                          },
                        ),
                        KzCheckBox(
                          title: LocaleKeys.pageRegisTeacher_active.tr(),
                          checkedValue: _active ?? true,
                          icon: Icons.task_alt,
                          onChanged: (newValue) {
                            setState(() {
                              _active = newValue;
                              widget.model!.active = newValue;
                            });
                          },
                        ),
                        SizedBox(
                          height: MyBlock.vertical(context, x: widget.model!.id != 0 ? 1 : 10),
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

        var res = await widget.repRegistration.addOrUpdate(
          model: widget.model as TeacherModel,
          files: photoList,
        );
        if (res is TeacherModel) {
          showTopSnackBar(
            context,
            KzSnackWidgetMinifit(
              message: LocaleKeys.pageRegisTeacher_saved.tr(),
              messageType: MessageType.Success,
            ),
          );

          widget.model = res;
        } else if (res is MobileResult) {
          showTopSnackBar(
            context,
            KzSnackWidgetMinifit(
              message: LocaleKeys.pageRegisTeacher_warning.tr() + (res.message ?? ''),
              messageType: MessageType.Error,
            ),
          );
        }
      } catch (e) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageRegisTeacher_warning_messages.tr(),
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
