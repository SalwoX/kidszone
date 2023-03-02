import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../common/utils/app_static.dart';
import '../../../../data/repositories/repository_common.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../register.dart';
import '../../../_init/components/appbar/custom_appbar.dart';
import '../../../_init/components/button/save_button_model.dart';
import '../../../_init/components/datetime/kz_datetime.dart';
import '../../../_init/components/dropdown/kz_dropdown.dart';
import '../../../_init/components/info/info_widget.dart';
import '../../../_init/components/input/kz_edit_widgets.dart';
import '../../../_init/components/switch/gender.dart';
import '../../../_init/components/widgets/kzsnack_widget_minifity.dart';
import '../../../_init/logger/logger_mixin.dart';
import '../../../_init/models/mobile_result.dart';
import '../../../_init/my_block.dart';
import '../model/preregistration_model.dart';
import '../pre_registration_notes/view/page_preregistration_notes.dart';
import '../service/repository_preregistration.dart';

/*
import 'package:kidszone_app/imports/import_components.dart' as kz;
import 'package:kidszone_app/imports/import_repository.dart' as repositories;
import 'package:kidszone_app/imports/import_pages.dart' as pages;
import 'package:kidszone_app/imports/import_themes.dart' as themes;
import 'package:kidszone_app/imports/import_common.dart' as core;
import 'package:kidszone_app/imports/import_model.dart' as models;
import 'package:kidszone_app/imports/import_register.dart' as register;
 */

// ignore: must_be_immutable
class PageRegistrationPreregistration extends StatefulWidget {
  final String title = LocaleKeys.pageRegistrationPreregistration_pre_regis.tr();
  final String subTitle = LocaleKeys.pageRegistrationPreregistration_student_meet.tr();
  final _formKey = GlobalKey<FormState>();
  PreregistrationModel? model;

  var repCommon = resolve<RepositoryCommon>();
  var repRegistration = resolve<RepositoryPreregistration>();
  PageRegistrationPreregistration({Key? key, this.model}) : super(key: key);

  @override
  _PageRegistrationPreregistrationState createState() => _PageRegistrationPreregistrationState();
}

class _PageRegistrationPreregistrationState extends State<PageRegistrationPreregistration> with LoggerMixin {
  var currentIndexPage = 4;
  var nameSurname = TextEditingController();
  var idNo = TextEditingController();
  var birthDate = TextEditingController();
  var fatherName = TextEditingController();
  var fatherNum = TextEditingController();
  var motherName = TextEditingController();
  var motherNum = TextEditingController();
  var description = TextEditingController();
  var notes = TextEditingController();
  var registrationStatus = TextEditingController();
  var _saveEnable = true;

  @override
  void initState() {
    super.initState();
    currentIndexPage = 4;

    if (widget.model != null && widget.model!.id != 0) {
      setState(() {
        nameSurname.text = widget.model?.nameSurname ?? "";
        idNo.text = widget.model?.idNo ?? "";
        birthDate.text = widget.model != null ? DateFormat("dd.MM.yyyy").format(widget.model!.birthDate!) : "";
        fatherName.text = widget.model?.fatherName ?? "";
        fatherNum.text = widget.model?.fatherNum ?? "";
        motherName.text = widget.model?.motherName ?? "";
        motherNum.text = widget.model?.motherNum ?? "";
        description.text = widget.model?.description ?? "";
        notes.text = widget.model?.notes ?? "";
        registrationStatus.text = widget.model?.registrationStatus.toString() ?? "";
      });
    } else {
      widget.model = PreregistrationModel(id: 0);
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
                  enable: widget.model!.registrationStatus != 0 && _saveEnable,
                  icon: Icons.save,
                  text: LocaleKeys.pageRegistrationPreregistration_save.tr(),
                ),
                Visibility(
                  visible: (widget.model != null && widget.model!.id != null && widget.model!.id != 0),
                  child: SaveModalButton(
                    onTab: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return PagePreregistrationNotes(
                          preregistrationId: widget.model?.id,
                          newRegistrationActive: widget.model!.registrationStatus != 2,
                        );
                      }))
                    },
                    icon: Icons.inbox,
                    text: LocaleKeys.pageRegistrationPreregistration_pre_regis_notes.tr(),
                  ),
                ),
              ],
              title: LocaleKeys.pageRegistrationPreregistration_pre_regis_trans.tr(),
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
                          controller: nameSurname,
                          labelText: LocaleKeys.pageRegistrationPreregistration_name_surname.tr(),
                          icon: Icons.abc,
                          isRequired: true,
                          onSaved: (newValue) {
                            widget.model!.nameSurname = newValue;
                          },
                        ),
                        KzTextEdit(
                          controller: idNo,
                          labelText: LocaleKeys.pageRegistrationPreregistration_tc.tr(),
                          icon: Icons.credit_card_rounded,
                          inputType: TextInputType.number,
                          isRequired: true,
                          onSaved: (newValue) {
                            widget.model!.idNo = newValue;
                          },
                        ),
                        KzDateTime(
                          controller: birthDate,
                          labelText: LocaleKeys.pageRegistrationPreregistration_birthday.tr(),
                          isRequired: true,
                          onSaved: (newValue) {
                            if (newValue != null) widget.model!.birthDate = DateFormat("dd.MM.yyyy").parse(newValue);
                          },
                        ),
                        //cinsiyet
                        Gender(
                          gender: widget.model?.gender,
                          onPress: (index) {
                            setState(() {
                              widget.model!.gender = index == 0 ? 2 : 1;
                            });
                          },
                        ),
                        KzTextEdit(
                          controller: fatherName,
                          labelText: LocaleKeys.pageRegistrationPreregistration_dad_name.tr(),
                          icon: Icons.person_rounded,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.fatherName = newValue;
                          },
                        ),
                        KzTextEdit(
                          controller: fatherNum,
                          labelText: LocaleKeys.pageRegistrationPreregistration_dad_phone.tr(),
                          icon: Icons.phone_rounded,
                          inputType: TextInputType.phone,
                          isRequired: true,
                          onSaved: (newValue) {
                            widget.model!.fatherNum = newValue;
                          },
                        ),
                        KzTextEdit(
                          controller: motherName,
                          labelText: LocaleKeys.pageRegistrationPreregistration_mom_name.tr(),
                          icon: Icons.person_rounded,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.motherName = newValue;
                          },
                        ),
                        KzTextEdit(
                          controller: motherNum,
                          labelText: LocaleKeys.pageRegistrationPreregistration_mom_number.tr(),
                          icon: Icons.phone_rounded,
                          inputType: TextInputType.phone,
                          isRequired: true,
                          onSaved: (newValue) {
                            widget.model!.motherNum = newValue;
                          },
                        ),
                        KzDropDown(
                          list: AppStatic.preregistrationStatusList(),
                          title: LocaleKeys.pageRegistrationPreregistration_regis_status.tr(),
                          icon: Icons.info_outline,
                          value: widget.model?.registrationStatus == null ? null : widget.model?.registrationStatus.toString(),
                          onChanged: (value) {
                            setState(() {
                              widget.model!.registrationStatus = value.toInt();
                            });
                          },
                        ),
                        KzTextEditMultiLine(
                          controller: description,
                          labelText: LocaleKeys.pageRegistrationPreregistration_explanation.tr(),
                          icon: Icons.comment_outlined,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.description = newValue;
                          },
                          maxLines: 3,
                        ),
                        widget.model!.id != 0
                            ? KzTextEdit(
                                controller: notes,
                                labelText: LocaleKeys.pageRegistrationPreregistration_last_note.tr(),
                                icon: Icons.info,
                                inputType: TextInputType.text,
                                isRequired: false,
                                enabled: false,
                                onSaved: (newValue) {
                                  widget.model!.notes = newValue;
                                },
                              )
                            : Container(),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _save() async {
    if (widget._formKey.currentState!.validate()) {
      try {
        widget._formKey.currentState!.save();
        widget.model!.active = true;

        var res = await widget.repRegistration.addOrUpdate(model: widget.model as PreregistrationModel);
        if (res is PreregistrationModel) {
          showTopSnackBar(
            context,
            KzSnackWidgetMinifit(
              message: LocaleKeys.pageRegistrationPreregistration_saved.tr(),
              messageType: MessageType.Success,
            ),
          );
          widget.model = res;
        } else if (res is MobileResult) {
          showTopSnackBar(
            context,
            KzSnackWidgetMinifit(
              message: LocaleKeys.pageRegistrationPreregistration_not_saved.tr() + (res.message ?? ''),
              messageType: MessageType.Error,
            ),
          );
        }
      } catch (e) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageRegistrationPreregistration_warning_messages.tr(),
            messageType: MessageType.Error,
          ),
        );
      }
    } else {
      Navigator.pop(context);
    }
    setState(() {
      _saveEnable = true;
    });
  }
}
