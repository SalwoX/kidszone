import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
import '../../../_init/components/widgets/kzsnack_widget_minifity.dart';
import '../../../_init/logger/logger_mixin.dart';
import '../../../_init/models/filter_model.dart';
import '../../../_init/models/mobile_result.dart';
import '../../../_init/my_block.dart';
import '../../../_init/themes/colors.dart';
import '../../../school_operations/group_operations/model/group_model.dart';
import '../../student/model/student_model.dart';
import '../model/parent_model.dart';
import '../service/repository_parent.dart';

/* import 'package:kidszone_app/imports/import_components.dart' as kz;
import 'package:kidszone_app/imports/import_repository.dart' as repositories;
import 'package:kidszone_app/imports/import_themes.dart' as themes;
import 'package:kidszone_app/imports/import_common.dart' as core;
import 'package:kidszone_app/imports/import_model.dart' as models;
import 'package:kidszone_app/imports/import_register.dart' as register; */

@immutable
// ignore: must_be_immutable
class PageRegistrationParent extends StatefulWidget {
  final String title = LocaleKeys.pageRegistrationParent_make_parent.tr();
  final String subTitle = "";
  final _formKey = GlobalKey<FormState>();
  ParentModel? model;

  var repCommon = resolve<RepositoryCommon>();
  var repRegistration = resolve<RepositoryParent>();
  PageRegistrationParent({Key? key, this.model}) : super(key: key);

  @override
  _PageRegistrationParentState createState() => _PageRegistrationParentState();
}

class _PageRegistrationParentState extends State<PageRegistrationParent> with LoggerMixin {
  bool _saveEnable = true;
  int currentIndexPage = 4;
  bool? _active;
  var _nameSurname = TextEditingController();
  var _idNo = TextEditingController();
  var _phoneNumber = TextEditingController();
  var _job = TextEditingController();
  var _mail = TextEditingController();
  var _birtDate = TextEditingController();
  var _type = TextEditingController();
  var _description = TextEditingController();
  var _address = TextEditingController();
  var _confirmCode = TextEditingController();
  var _password = TextEditingController();
  var _studentId = TextEditingController();
  var _permission = TextEditingController();
  bool? _mobileLogin;
  var selected = <StudentModel>[];
  void selectedItem() async {
    var fields = <Field>[];
    fields.add(Field(fieldName: "Id", fieldOperator: "contains", fieldValue: _studentId.text));
    var res = await widget.repCommon.getStudentList(fields);
    setState(() {
      selected = res;
    });
  }

  @override
  void initState() {
    super.initState();
    currentIndexPage = 4;
    if (widget.model != null && widget.model!.id != 0) {
      setState(() {
        //! özel modelden okunması gereken datalar
        _active = widget.model?.active ?? true;
        _studentId.text = widget.model?.studentIds.toString() ?? "";
        _nameSurname.text = widget.model?.nameSurname ?? "";
        _idNo.text = widget.model?.idNo ?? "";
        _phoneNumber.text = widget.model?.phoneNumber ?? "";
        _job.text = widget.model?.job ?? "";
        _mail.text = widget.model?.mail ?? "";
        _birtDate.text = widget.model != null ? DateFormat("dd.MM.yyyy").format(widget.model!.birthDate!) : "";
        _type.text = widget.model?.type.toString() ?? "";
        _description.text = widget.model?.description ?? "";
        _address.text = widget.model?.address ?? "";
        _confirmCode.text = widget.model?.confirmCode ?? "";
        _password.text = widget.model?.password ?? "";
        _permission.text = widget.model?.permission.toString() ?? "";
        _mobileLogin = widget.model?.mobileLogin ?? false;
        selectedItem();
      });
    } else {
      widget.model = ParentModel(id: 0);
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
                  text: LocaleKeys.pageRegistrationParent_save.tr(),
                ),
              ],
              title: LocaleKeys.pageRegistrationParent_pre_registration_transactions.tr(),
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
                          labelText: LocaleKeys.pageRegistrationParent_name_surname.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.nameSurname = newValue;
                          },
                        ),
                        KzTextEdit(
                          controller: _idNo,
                          labelText: LocaleKeys.pageRegistrationParent_tc.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.idNo = newValue;
                          },
                        ),
                        KzTextEdit(
                          controller: _phoneNumber,
                          labelText: LocaleKeys.pageRegistrationParent_telephone.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.phoneNumber = newValue;
                          },
                        ),
                        KzTextEdit(
                          controller: _job,
                          labelText: LocaleKeys.pageRegistrationParent_job.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.job = newValue;
                          },
                        ),
                        KzTextEdit(
                          controller: _mail,
                          labelText: LocaleKeys.pageRegistrationParent_mail.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.mail = newValue;
                          },
                        ),
                        KzDateTime(
                          controller: _birtDate,
                          labelText: LocaleKeys.pageRegistrationParent_birthday_date.tr(),
                          isRequired: false,
                          onSaved: (newValue) {
                            if (newValue != null) widget.model!.birthDate = DateFormat("dd.MM.yyyy").parse(newValue);
                          },
                        ),
                        DropdownSearch<GroupModel>(
                          dropdownSearchDecoration: InputDecoration(
                            hintText: LocaleKeys.pageRegistrationParent_choose.tr(),
                            labelText: LocaleKeys.pageRegistrationParent_type.tr(),
                            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 1)),
                            labelStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: MyBlock.vertical(context, x: 1.7),
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          onSaved: (model) {
                            widget.model!.type = model!.type;
                          },
                          maxHeight: 300,
                          mode: Mode.BOTTOM_SHEET,
                          showClearButton: true,
                          isFilteredOnline: true,
                          searchFieldProps: TextFieldProps(
                            controller: _type,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear, color: ThemeColors.white, size: MyBlock.horizontal(context, x: 30)),
                                onPressed: () {
                                  _type.clear();
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
                            var defsart = Field(fieldName: 'tip', fieldOperator: "eq", fieldValue: _type.text);
                            fields.add(defsart);
                            var list = widget.repCommon.getGroupList(filter, fields);
                            return list;
                          },
                          itemAsString: (val) => "${val!.name!} || ${val.description!}",
                          controller: _type,
                          selectedItemFuture: (filter) async {
                            var fields = <Field>[];
                            if (filter != null && filter.isNotEmpty) {
                              fields.add(Field(fieldName: "tip", fieldOperator: "eq", fieldValue: filter));
                            }
                            var list = await widget.repCommon.getGroupList('', fields);
                            return list;
                          },
                        ),
                        KzTextEdit(
                          controller: _description,
                          labelText: LocaleKeys.pageRegistrationParent_explanation.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.description = newValue;
                          },
                        ),
                        KzTextEdit(
                          controller: _address,
                          labelText: LocaleKeys.pageRegistrationParent_address.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.address = newValue;
                          },
                        ),

                        KzTextEdit(
                          controller: _password,
                          labelText: LocaleKeys.pageRegistrationParent_password.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.password = newValue;
                          },
                        ),
                        DropdownSearch<StudentModel>.multiSelection(
                          dropdownSearchDecoration: InputDecoration(
                            hintText: LocaleKeys.pageRegistrationParent_choose.tr(),
                            labelText: LocaleKeys.pageRegistrationParent_student.tr(),
                            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 1)),
                            labelStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: MyBlock.vertical(context, x: 1.7),
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          onSaved: (model) {
                            widget.model!.studentIds = model!.map((e) => e.id).join(',');
                            _studentId.text = widget.model!.studentIds!;
                          },
                          selectedItems: selected,
                          maxHeight: 300,
                          mode: Mode.BOTTOM_SHEET,
                          showClearButton: true,
                          isFilteredOnline: true,
                          showSearchBox: true,
                          searchFieldProps: TextFieldProps(
                            controller: _studentId,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear, color: ThemeColors.white, size: MyBlock.horizontal(context, x: 30)),
                                onPressed: () {
                                  _studentId.clear();
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
                            if (filter != null && filter != _studentId.text)
                              fields.add(Field(fieldName: "AdSoyad", fieldOperator: "startswith", fieldValue: filter));
                            else
                              filter = "";

                            var list = widget.repCommon.getStudentList(fields);
                            return list;
                          },
                          itemAsString: (val) => "${val!.nameSurname!} || ${val.id!}",
                          controller: _studentId,
                          selectedItemFuture: (filter) async {
                            var fields = <Field>[];
                            if (filter != null && filter.isNotEmpty) {
                              fields.add(Field(fieldName: "Id", fieldOperator: "eq", fieldValue: filter));
                            }
                            var list = await widget.repCommon.getStudentList(fields);
                            return list;
                          },
                        ),
                        KzCheckBox(
                          title: LocaleKeys.pageRegistrationParent_active.tr(),
                          checkedValue: _active ?? true,
                          onChanged: (newValue) {
                            setState(() {
                              _active = newValue;
                              widget.model!.active = newValue;
                            });
                          },
                        ),
                        // kz.DropdownSearch<models.YetkiModel>(
                        //   dropdownSearchDecoration: InputDecoration(
                        //     hintText: "Seçiniz",
                        //     labelText: "Veli",
                        //     contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 1)),
                        //     labelStyle: TextStyle(
                        //       color: Colors.black54,
                        //       fontSize: MyBlock.vertical(context, x: 1.7),
                        //     ),
                        //     border: InputBorder.none,
                        //     focusedBorder: InputBorder.none,
                        //   ),
                        //   onSaved: ( model) {
                        //     widget.model!.yetkiRolu = model!.id;
                        //   },
                        //   maxHeight: 300,
                        //   mode: kz.Mode.BOTTOM_SHEET,
                        //   showClearButton: true,
                        //   isFilteredOnline: true,
                        //   searchFieldProps: kz.TextFieldProps(
                        //     controller: _yetkiRolu,
                        //     decoration: InputDecoration(
                        //       suffixIcon: IconButton(
                        //         icon: Icon(Icons.clear, color: ThemeColors.beyaz, size: MyBlock.horizontal(context, x: 30)),
                        //         onPressed: () {
                        //           _yetkiRolu.clear();
                        //         },
                        //       ),
                        //     ),
                        //   ),
                        //   compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
                        //   filterFn: (item, filter) {
                        //     if (filter!.isEmpty) return true;
                        //     return item!.yetkiler!.toLowerCase().contains(filter.toLowerCase());
                        //   },
                        //   onFind: ( filter) async {
                        //     var list = widget.repCommon.getVeliList(filter);
                        //     return list;
                        //   },
                        //   itemAsString: ( val) => "${val!.yetkiler!} || ${val.id!}",
                        // ),
                        KzCheckBox(
                          title: LocaleKeys.pageRegistrationParent_mobile_login.tr(),
                          checkedValue: _mobileLogin ?? false,
                          onChanged: (newValue) {
                            setState(() {
                              _mobileLogin = newValue;
                              widget.model!.mobileLogin = newValue;
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
    //!Todo: veli kaydedilirken map ile öğrencisi de ilişkilendirilecek.
    if (widget._formKey.currentState!.validate()) {
      try {
        widget._formKey.currentState!.save();
        //! özel modele eklenmesi gereken datalar
        var res = await widget.repRegistration.addOrUpdate(model: widget.model as ParentModel);
        if (res is ParentModel) {
          showTopSnackBar(
            context,
            KzSnackWidgetMinifit(
              message: LocaleKeys.pageRegistrationParent_saved.tr(),
              messageType: MessageType.Success,
            ),
          );

          widget.model = res;
        } else if (res is MobileResult) {
          showTopSnackBar(
            context,
            KzSnackWidgetMinifit(
              message: LocaleKeys.pageRegistrationParent_warning.tr() + (res.message ?? ''),
              messageType: MessageType.Error,
            ),
          );
        }
      } catch (e) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageRegistrationParent_warning_messages.tr(),
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
