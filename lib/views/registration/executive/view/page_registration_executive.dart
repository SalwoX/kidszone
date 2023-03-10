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
import '../../../_init/components/dropdown/dropdownlist/dropdown_search.dart';
import '../../../_init/components/info/info_widget.dart';
import '../../../_init/components/input/kz_edit_widgets.dart';
import '../../../_init/components/widgets/image_upload.dart';
import '../../../_init/components/widgets/is_admin_widget_edit.dart';
import '../../../_init/components/widgets/kzsnack_widget_minifity.dart';
import '../../../_init/logger/logger_mixin.dart';
import '../../../_init/models/filter_model.dart';
import '../../../_init/models/mobile_result.dart';
import '../../../_init/models/permission_model.dart';
import '../../../_init/my_block.dart';
import '../../../_init/themes/colors.dart';
import '../model/executive_model.dart';
import '../service/repository_executive.dart';

/* import 'package:kidszone_app/imports/import_components.dart' as kz;
import 'package:kidszone_app/imports/import_repository.dart' as repositories;
import 'package:kidszone_app/imports/import_themes.dart' as themes;
import 'package:kidszone_app/imports/import_common.dart' as core;
import 'package:kidszone_app/imports/import_model.dart' as models;
import 'package:kidszone_app/imports/import_register.dart' as register;
 */
@immutable
// ignore: must_be_immutable
class PageRegistrationExecutive extends StatefulWidget {
  final String title = LocaleKeys.pageRegistrationExecutive_admin_regis.tr();
  final String subTitle = "";
  final _formKey = GlobalKey<FormState>();
  ExecutiveModel? model;
  List<File> photoList = [];

  var repCommon = resolve<RepositoryCommon>();
  var repRegistration = resolve<RepositoryExecutive>();
  PageRegistrationExecutive({Key? key, this.model}) : super(key: key);

  @override
  _PageRegistrationExecutiveState createState() => _PageRegistrationExecutiveState();
}

class _PageRegistrationExecutiveState extends State<PageRegistrationExecutive> with LoggerMixin {
  bool _saveEnable = true;
  int currentIndexPage = 4;
  bool? _active;
  var _nameSurname = TextEditingController();
  var _phoneNumber = TextEditingController();
  var _password = TextEditingController();
  var _imgUrl = TextEditingController();
  var _permission = TextEditingController();
  var _description = TextEditingController();
  var _schoolId = TextEditingController();
  var _branchId = TextEditingController();
  bool? _mobileLogin;
  bool? _webLogin;
  var _picker = ImagePicker();
  List<File> photoList = [];

  @override
  void initState() {
    super.initState();
    currentIndexPage = 4;
    if (widget.model != null && widget.model!.id != 0) {
      setState(() {
        //! ??zel modelden okunmas?? gereken datalar
        _active = widget.model?.active ?? true;
        _nameSurname.text = widget.model?.nameSurname ?? "";
        _phoneNumber.text = widget.model?.phoneNumber ?? "";
        _password.text = widget.model?.password ?? "";
        _imgUrl.text = widget.model?.imgUrl ?? "";
        _permission.text = widget.model?.permission.toString() ?? "";
        _description.text = widget.model?.description ?? "";
        _mobileLogin = widget.model?.mobileLogin ?? false;
        _webLogin = widget.model?.webLogin ?? false;
        _schoolId.text = widget.model?.schoolId.toString() ?? "";
        _branchId.text = widget.model?.branchId.toString() ?? "";
      });
    } else {
      widget.model = ExecutiveModel(id: 0);
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
                  text: LocaleKeys.pageRegistrationExecutive_save.tr(),
                ),
              ],
              title: " ${widget.title} ????lemler",
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
                IsAdminWidgetEdit(
                  onSavedSchool: (model) {
                    if (model != null) {
                      widget.model!.schoolId = model.id;
                    }
                  },
                  onSavedBranch: (model) {
                    if (model != null) {
                      widget.model!.branchId = model.id;
                    }
                  },
                  onPressedSchool: () {
                    widget.model!.schoolId = -1;
                  },
                  onPressedBranch: () {
                    widget.model!.schoolId = -1;
                  },
                  onFindBranch: (filter) async {
                    var fields = <Field>[];
                    fields.add(Field(fieldName: "OkulId", fieldOperator: "eq", fieldValue: widget.model!.schoolId.toString()));
                    var list = widget.repCommon.getBranchList(filter, fields);
                    return list;
                  },
                  schoolController: _schoolId,
                  branchController: _branchId,
                ),
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
                          labelText: LocaleKeys.pageRegistrationExecutive_name_surname.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.nameSurname = newValue;
                          },
                        ),
                        KzTextEdit(
                          controller: _phoneNumber,
                          labelText: LocaleKeys.pageRegistrationExecutive_telephone.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.phoneNumber = newValue;
                          },
                        ),

                        KzTextEdit(
                          controller: _password,
                          labelText: LocaleKeys.pageRegistrationExecutive_password.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.visiblePassword,
                          onSaved: (newValue) {
                            widget.model!.password = newValue;
                          },
                        ),

                        //!resim yolu
                        ImageUpload(
                          photoList: photoList,
                          picker: _picker,
                          imgUrl: _imgUrl.text,
                        ),

                        //!yetkiRolu
                        DropdownSearch<PermissionModel>.multiSelection(
                          dropdownSearchDecoration: InputDecoration(
                            hintText: "Se??iniz",
                            labelText: LocaleKeys.pageRegistrationExecutive_authorized_menu.tr(),
                            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 1)),
                            labelStyle: context.textTheme.labelMedium,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          onSaved: (model) {
                            if (model != null) widget.model!.permission = model.map((e) => e.id).join(',');
                          },
                          maxHeight: 300,
                          mode: Mode.BOTTOM_SHEET,
                          showClearButton: true,
                          isFilteredOnline: true,
                          searchFieldProps: TextFieldProps(
                            controller: _permission,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear, color: ThemeColors.white, size: MyBlock.horizontal(context, x: 30)),
                                onPressed: () {
                                  _permission.clear();
                                },
                              ),
                            ),
                          ),
                          compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
                          filterFn: (item, filter) {
                            if (filter!.isEmpty) return true;
                            return item!.permissions!.toLowerCase().contains(filter.toLowerCase());
                          },
                          onFind: (filter) async {
                            var fields = <Field>[];
                            if (filter != null && filter.isNotEmpty) {
                              fields.add(Field(fieldName: LocaleKeys.pageRegistrationExecutive_authority.tr(), fieldOperator: "startswith", fieldValue: filter));
                            }
                            var list = widget.repCommon.getPermissionList(fields);
                            return list;
                          },
                          itemAsString: (val) => "${val!.permissions!} || ${val.id!}",
                          controller: _permission,
                          selectedItemFuture: (filter) async {
                            var fields = <Field>[];
                            if (filter != null && filter.isNotEmpty) {
                              fields.add(Field(fieldName: "Id", fieldOperator: "eq", fieldValue: filter));
                            }
                            var list = await widget.repCommon.getPermissionList(fields);
                            return list;
                          },
                        ),

                        KzTextEdit(
                          controller: _description,
                          labelText: LocaleKeys.pageRegistrationExecutive_explanation.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.description = newValue;
                          },
                        ),

                        //mobilGiris
                        KzCheckBox(
                          title: LocaleKeys.pageRegistrationExecutive_mobile_login.tr(),
                          checkedValue: _mobileLogin ?? false,
                          onChanged: (newValue) {
                            setState(() {
                              _mobileLogin = newValue;
                              widget.model!.mobileLogin = newValue;
                            });
                          },
                        ),

                        //webGiris
                        KzCheckBox(
                          title: LocaleKeys.pageRegistrationExecutive_web_login.tr(),
                          checkedValue: _webLogin ?? false,
                          onChanged: (newValue) {
                            setState(() {
                              _webLogin = newValue;
                              widget.model!.webLogin = newValue;
                            });
                          },
                        ),

                        //aktif
                        KzCheckBox(
                          title: LocaleKeys.pageRegistrationExecutive_active.tr(),
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
        //! ??zel modele eklenmesi gereken datalar
        var res = await widget.repRegistration.addOrUpdate(model: widget.model as ExecutiveModel, files: photoList);
        if (res is ExecutiveModel) {
          showTopSnackBar(
            context,
            KzSnackWidgetMinifit(
              message: LocaleKeys.pageRegistrationExecutive_saved.tr(),
              messageType: MessageType.Success,
            ),
          );

          widget.model = res;
        } else if (res is MobileResult) {
          showTopSnackBar(
            context,
            KzSnackWidgetMinifit(
              message: LocaleKeys.pageRegistrationExecutive_warning.tr() + (res.message ?? ''),
              messageType: MessageType.Error,
            ),
          );
        }
      } catch (e) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageRegistrationExecutive_error_massage.tr(),
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
