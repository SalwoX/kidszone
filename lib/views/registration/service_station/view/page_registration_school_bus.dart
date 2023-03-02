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
import '../../../_init/components/info/info_widget.dart';
import '../../../_init/components/input/kz_edit_widgets.dart';
import '../../../_init/components/widgets/kzsnack_widget_minifity.dart';
import '../../../_init/logger/logger_mixin.dart';
import '../../../_init/models/mobile_result.dart';
import '../../../_init/my_block.dart';
import '../model/school_bus_model.dart';
import '../service/repository_schoolbus.dart';

// ignore: must_be_immutable
class PageRegistrationSchoolBus extends StatefulWidget {
  final String title = LocaleKeys.pageRegisSchoolBus_service_regis.tr();
  final String subTitle = "";
  final _formKey = GlobalKey<FormState>();
  SchoolBusModel? model;

  var repCommon = resolve<RepositoryCommon>();
  var repRegistration = resolve<RepositorySchoolBus>();
  PageRegistrationSchoolBus({Key? key, this.model}) : super(key: key);

  @override
  _PageRegistrationSchoolBusState createState() => _PageRegistrationSchoolBusState();
}

class _PageRegistrationSchoolBusState extends State<PageRegistrationSchoolBus> with LoggerMixin {
  bool _saveEnable = true;
  int currentIndexPage = 4;
  bool? _active;
  var _profileName = TextEditingController();
  var _plate = TextEditingController();
  var _driver = TextEditingController();
  var _driverNum = TextEditingController();
  var _attendant = TextEditingController();
  var _attendantNum = TextEditingController();
  var _description = TextEditingController();

  @override
  void initState() {
    super.initState();
    currentIndexPage = 4;
    if (widget.model != null && widget.model!.id != 0) {
      setState(() {
        //! özel modelden okunması gereken datalar
        _active = widget.model?.active ?? true;
        _profileName.text = widget.model?.profileName ?? "";
        _plate.text = widget.model?.plate ?? "";
        _driver.text = widget.model?.driver ?? "";
        _driverNum.text = widget.model?.driverNum ?? "";
        _attendant.text = widget.model?.attendant ?? "";
        _attendantNum.text = widget.model?.attendantNum ?? "";
        _description.text = widget.model?.description ?? "";
      });
    } else {
      widget.model = SchoolBusModel(id: 0);
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
                  text: LocaleKeys.pageRegisSchoolBus_save.tr(),
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
                        //profilAd
                        KzTextEdit(
                          controller: _profileName,
                          labelText: LocaleKeys.pageRegisSchoolBus_profile_name.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.profileName = newValue;
                          },
                        ),

                        //plaka
                        KzTextEdit(
                          controller: _plate,
                          labelText: LocaleKeys.pageRegisSchoolBus_plaka.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.plate = newValue;
                          },
                        ),

                        //sofor
                        KzTextEdit(
                          controller: _driver,
                          labelText: LocaleKeys.pageRegisSchoolBus_driver.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.driver = newValue;
                          },
                        ),

                        //soforTel
                        KzTextEdit(
                          controller: _driverNum,
                          labelText: LocaleKeys.pageRegisSchoolBus_driver_phone.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.driverNum = newValue;
                          },
                        ),

                        //gorevli
                        KzTextEdit(
                          controller: _attendant,
                          labelText: LocaleKeys.pageRegisSchoolBus_officer.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.attendant = newValue;
                          },
                        ),

                        //gorevliTel
                        KzTextEdit(
                          controller: _attendantNum,
                          labelText: LocaleKeys.pageRegisSchoolBus_officer_phone.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.attendantNum = newValue;
                          },
                        ),

                        //aciklama
                        KzTextEdit(
                          controller: _description,
                          labelText: LocaleKeys.pageRegisSchoolBus_explanation.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.description = newValue;
                          },
                        ), //aktif

                        //aktif
                        KzCheckBox(
                          title: LocaleKeys.pageRegisSchoolBus_active.tr(),
                          checkedValue: _active ?? true,
                          icon: Icons.check_rounded,
                          onChanged: (newValue) {
                            setState(() {
                              _active = newValue;
                              widget.model!.active = newValue;
                            });
                          },
                        ),

//info
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
        var res = await widget.repRegistration.addOrUpdate(model: widget.model as SchoolBusModel);
        if (res is SchoolBusModel) {
          showTopSnackBar(
            context,
            KzSnackWidgetMinifit(
              message: LocaleKeys.pageRegisSchoolBus_saved.tr(),
              messageType: MessageType.Success,
            ),
          );

          widget.model = res;
        } else if (res is MobileResult) {
          showTopSnackBar(
            context,
            KzSnackWidgetMinifit(
              message: LocaleKeys.pageRegisSchoolBus_warning.tr() + (res.message ?? ''),
              messageType: MessageType.Error,
            ),
          );
        }
      } catch (e) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageRegisSchoolBus_warning_messages.tr(),
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
