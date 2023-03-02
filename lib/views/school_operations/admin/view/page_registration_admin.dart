import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../common/enums.dart';
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
import '../../../_init/models/key_value_model.dart';
import '../../../_init/models/mobile_result.dart';
import '../../../_init/my_block.dart';
import '../../../_init/themes/colors.dart';
import '../../../registration/executive/model/executive_model.dart';
import '../../../registration/executive/service/repository_executive.dart';

/* import 'package:kidszone_app/imports/import_components.dart' as kz;
import 'package:kidszone_app/imports/import_repository.dart' as repositories;
import 'package:kidszone_app/imports/import_themes.dart' as themes;
import 'package:kidszone_app/imports/import_common.dart' as core;
import 'package:kidszone_app/imports/import_model.dart' as models;
import 'package:kidszone_app/imports/import_register.dart' as register; */

@immutable
// ignore: must_be_immutable
class PageRegistrationAdmin extends StatefulWidget {
  final String title = LocaleKeys.pageRegisAdmin_senior_manager_regis.tr();
  final String subTitle = "";
  final _formKey = GlobalKey<FormState>();
  ExecutiveModel? model;
  List<File> photoList = [];

  var repCommon = resolve<RepositoryCommon>();
  var repRegistration = resolve<RepositoryExecutive>();
  PageRegistrationAdmin({Key? key, this.model}) : super(key: key);

  @override
  _PageRegistrationAdminState createState() => _PageRegistrationAdminState();
}

class _PageRegistrationAdminState extends State<PageRegistrationAdmin> with LoggerMixin {
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
        //! özel modelden okunması gereken datalar
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
                  text: LocaleKeys.pageRegisAdmin_save.tr(),
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
                        //is administrator
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
                          onPressedSchool: () {},
                          onPressedBranch: () {},
                          onFindBranch: (filter) async {
                            var fields = <Field>[];
                            fields.add(Field(fieldName: "OkulId", fieldOperator: "eq", fieldValue: widget.model!.schoolId.toString()));
                            var list = widget.repCommon.getBranchList(filter, fields);
                            return list;
                          },
                          schoolController: _schoolId,
                          branchController: _branchId,
                        ),

                        //!is Admin
                        DropdownSearch<KeyValueModel>(
                          dropdownSearchDecoration: InputDecoration(
                            hintText: LocaleKeys.pageRegisAdmin_choose.tr(),
                            labelText: LocaleKeys.pageRegisAdmin_authorization_definition.tr(),
                            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 1)),
                            labelStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: MyBlock.vertical(context, x: 1.7),
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          onSaved: (model) {
                            if (model != null) widget.model!.admin = model.key.toInt();
                          },
                          maxHeight: 300,
                          mode: Mode.BOTTOM_SHEET,
                          showClearButton: true,
                          showSearchBox: false,
                          isFilteredOnline: false,
                          items: Enums.getAdminExecutiveTypes.values.map((e) => e).toList(),
                          compareFn: (item, selectedItem) => item?.key == selectedItem?.key,
                          itemAsString: (val) => "${val!.value!}",
                        ),

                        KzTextEdit(
                          controller: _nameSurname,
                          labelText: LocaleKeys.pageRegisAdmin_name_surname.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.nameSurname = newValue;
                          },
                        ),

                        KzTextEdit(
                          controller: _phoneNumber,
                          labelText: LocaleKeys.pageRegisAdmin_telephone.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.phoneNumber = newValue;
                          },
                        ),

                        KzTextEdit(
                          controller: _password,
                          labelText: LocaleKeys.pageRegisAdmin_password.tr(),
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
                        /// dyanmaic = YetkiModel hata oldugu için degiştirdim
                        DropdownSearch<dynamic>.multiSelection(
                          dropdownSearchDecoration: InputDecoration(
                            hintText: LocaleKeys.pageRegisAdmin_choose.tr(),
                            labelText: LocaleKeys.pageRegisAdmin_admin_menu.tr(),
                            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 1)),
                            labelStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: MyBlock.vertical(context, x: 1.7),
                            ),
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
                            return item!.permission!.toString().toLowerCase().contains(filter.toLowerCase());
                          },
                          onFind: (filter) async {
                            var fields = <Field>[];
                            if (filter != null && filter.isNotEmpty) {
                              fields.add(Field(fieldName: "Adi", fieldOperator: "startswith", fieldValue: filter));
                            }
                            var list = widget.repCommon.getPermissionList(fields);
                            return list;
                          },
                          itemAsString: (val) => "${val!.permission!} || ${val.id!}",
                        ),

                        KzTextEdit(
                          controller: _description,
                          labelText: LocaleKeys.pageRegisAdmin_explanation.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.description = newValue;
                          },
                        ),

                        //mobilGiris
                        KzCheckBox(
                          title: LocaleKeys.pageRegisAdmin_mobile_login.tr(),
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
                          title: LocaleKeys.pageRegisAdmin_web_login.tr(),
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
                          title: LocaleKeys.pageRegisAdmin_active.tr(),
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
        var res = await widget.repRegistration.addOrUpdate(model: widget.model as ExecutiveModel, files: photoList);
        if (res is ExecutiveModel) {
          showTopSnackBar(
            context,
            KzSnackWidgetMinifit(
              message: LocaleKeys.pageRegisAdmin_saved.tr(),
              messageType: MessageType.Success,
            ),
          );

          widget.model = res;
        } else if (res is MobileResult) {
          showTopSnackBar(
            context,
            KzSnackWidgetMinifit(
              message: LocaleKeys.pageRegisAdmin_warning.tr() + (res.message ?? ''),
              messageType: MessageType.Error,
            ),
          );
        }
      } catch (e) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageRegisAdmin_warning_messages.tr(),
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
