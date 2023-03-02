import 'dart:convert';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../core/extension/convert_extension.dart';
import '../../../../data/repositories/repository_common.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../register.dart';
import '../../../_init/components/appbar/custom_appbar.dart';
import '../../../_init/components/button/save_button_model.dart';
import '../../../_init/components/checbox/kz_checkbox.dart';
import '../../../_init/components/datetime/kz_datetime.dart';
import '../../../_init/components/input/kz_edit_widgets.dart';
import '../../../_init/components/widgets/kzsnack_widget_minifity.dart';
import '../../../_init/logger/logger_mixin.dart';
import '../../../_init/models/mobile_result.dart';
import '../../../_init/models/term_model.dart';
import '../model/settings_model.dart';
import '../service/repository_settings.dart';

/* import 'package:kidszone_app/imports/import_components.dart' as kz;
import 'package:kidszone_app/imports/import_repository.dart' as repositories;
import 'package:kidszone_app/imports/import_themes.dart' as themes;
import 'package:kidszone_app/imports/import_common.dart' as core;
import 'package:kidszone_app/imports/import_model.dart' as models;
import 'package:kidszone_app/imports/import_register.dart' as register; */

// ignore: must_be_immutable
class PagesSettings extends StatefulWidget {
  final String title = LocaleKeys.pagesSettings_save.tr();
  final String subTitle = LocaleKeys.pagesSettings_do_settings.tr();
  final _formKey = GlobalKey<FormState>();
  SettingsModel? model;

  var repCommon = resolve<RepositoryCommon>();
  var repRegistration = resolve<RepositorySettings>();

  PagesSettings({Key? key, this.model}) : super(key: key);

  @override
  _PagesSettingsState createState() => _PagesSettingsState();
}

class _PagesSettingsState extends State<PagesSettings> with LoggerMixin {
  bool _saveEnable = true;
  int currentIndexPage = 4;
  int tabIndex = 0;
  var _startTime = TextEditingController();
  var _endTime = TextEditingController();
  var _name = TextEditingController();
  bool active = true;
  int? selectId;

  @override
  void initState() {
    super.initState();
    currentIndexPage = 4;
    createModel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: _saveEnable
            ? SaveButtonModal(
                buttons: [
                  SaveModalButton(
                    onTab: () => {
                      setState(() {
                        _saveEnable = false;
                      }),
                      _kaydet(),
                    },
                    enable:
                        /*//!widget.model!.kayitDurum != 2 &&*/
                        _saveEnable,
                    icon: Icons.save,
                    text: LocaleKeys.pagesSettings_save.tr(),
                  ),
                ],
                title: LocaleKeys.pagesSettings_processes.tr(),
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
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: <Widget>[
                  ButtonsTabBar(
                    unselectedBackgroundColor: Colors.grey[300],
                    unselectedLabelStyle: TextStyle(color: Colors.black),
                    labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    contentPadding: EdgeInsets.symmetric(horizontal: 5),
                    radius: 5,
                    labelSpacing: 10,
                    tabs: [
                      Tab(
                        icon: Icon(Icons.settings),
                        text: LocaleKeys.condition_settings.tr(),
                      ),
                      Tab(
                        icon: Icon(Icons.verified_user_outlined),
                        text: LocaleKeys.pagesSettings_users_permissions.tr(),
                      ),
                      Tab(
                        icon: Icon(Icons.settings),
                        text: LocaleKeys.pagesSettings_period_settings.tr(),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      child: TabBarView(
                        children: <Widget>[
                          _settings(),
                          _userPermissions(),
                          _termSettings(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _settings() {
    return Container();
  }

  Widget _userPermissions() {
    return Container();
  }

  Widget _termSettings() {
    var termWidgets = <Widget>[];

    if (widget.model == null) {
      createModel();
    }

    if (widget.model?.termRegistrationModel != null) {
      termWidgets = widget.model!.termRegistrationModel!
          .where((e) => e.id.isNotEmpty())
          .map(
            (e) => Container(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        selectId = e.id;
                        _name.text = e.name!;
                        _startTime.text = e.startTime.format() ?? '';
                        _endTime.text = e.endTime.format() ?? '';
                      });
                    },
                    child: Text('${e.name} (${e.startTime.format()}/${e.endTime.format()})'),
                  ),
                ],
              ),
            ),
          )
          .toList();
    }

    if (widget.model?.termRegistrationModel == null) {
      widget.model!.termRegistrationModel = <TermModel>[];
    }
    widget.model!.termRegistrationModel!.add(TermModel());
    var widgetName = KzTextEdit(
      controller: _name,
      icon: Icons.access_time_rounded,
      labelText: LocaleKeys.pagesSettings_name.tr(),
      isRequired: false,
      onSaved: (newValue) {
        if (newValue != null) {
          var item = widget.model!.termRegistrationModel!.where((element) => element.id == selectId).first;
          item.name = newValue;
        }
      },
    );
    termWidgets.add(Container(child: widgetName));

    termWidgets.add(
      Container(
        child: KzDateTime(
          controller: _startTime,
          labelText: LocaleKeys.pagesSettings_start_date.tr(),
          isRequired: false,
          onSaved: (newValue) {
            if (newValue != null) {
              var item = widget.model!.termRegistrationModel!.where((element) => element.id == selectId).first;
              item.startTime = DateFormat("dd.MM.yyyy").parse(newValue);
            }
          },
        ),
      ),
    );

    termWidgets.add(
      Container(
        child: KzDateTime(
          controller: _endTime,
          labelText: LocaleKeys.pagesSettings_end_date.tr(),
          isRequired: false,
          onSaved: (newValue) {
            if (newValue != null) {
              var item = widget.model!.termRegistrationModel!.where((element) => element.id == selectId).first;
              item.endTime = DateFormat("dd.MM.yyyy").parse(newValue);
            }
          },
        ),
      ),
    );
    termWidgets.add(
      Container(
        child: KzCheckBox(
          checkedValue: active,
          title: LocaleKeys.pagesSettings_active_period.tr(),
          onChanged: (newValue) {
            setState(() {
              active = newValue ?? false;
              var item = widget.model!.termRegistrationModel!.where((element) => element.id == selectId).first;
              item.active = active;
            });
          },
        ),
      ),
    );
    termWidgets.add(
      Container(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  var item = widget.model!.termRegistrationModel!.where((element) => element.id == selectId).first;
                  item.name = _name.text;
                  item.startTime = DateFormat("dd.MM.yyyy").parse(_startTime.text);
                  item.endTime = DateFormat("dd.MM.yyyy").parse(_endTime.text);
                  selectId = null;
                  item.id = 0;
                  item.active = active;
                  _name.text = '';
                  _startTime.text = '';
                  _endTime.text = '';
                  print(jsonEncode(widget.model!.termRegistrationModel));
                });
              },
              child: Text(LocaleKeys.pagesSettings_adding.tr()),
            ),
          ],
        ),
      ),
    );
    return Column(
      children: termWidgets,
    );
  }

  _kaydet() async {
    if (widget._formKey.currentState!.validate()) {
      try {
        //  widget._formKey.currentState!.save();
        //! özel modele eklenmesi gereken datalar
        widget.model!.termRegistrationModel = widget.model!.termRegistrationModel!.where((element) => element.id.isNotEmpty()).toList();
        var res = await widget.repRegistration.addOrUpdate(model: widget.model as SettingsModel);
        if (res is SettingsModel) {
          showTopSnackBar(
            context,
            KzSnackWidgetMinifit(
              message: LocaleKeys.pagesSettings_saved.tr(),
              messageType: MessageType.Success,
            ),
          );

          widget.model = res;
        } else if (res is MobileResult) {
          showTopSnackBar(
            context,
            KzSnackWidgetMinifit(
              message: LocaleKeys.pagesSettings_warning.tr() + (res.message ?? ''),
              messageType: MessageType.Error,
            ),
          );
        }
      } catch (e) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pagesSettings_error_massage.tr(),
            messageType: MessageType.Error,
          ),
        );
      }
    }
    setState(() {
      _saveEnable = true;
    });
  }

  void createModel() {
    if (widget.model != null && widget.model!.id != 0) {
      setState(() {
        //! özel modelden okunması gereken datalar
        /*_aktif = widget.model?.aktif ?? true;
        _adi.text = widget.model?.adi ?? "";
        _baslangicTarihi.text = widget.model?.baslangicTarihi ?? "";
        _bitisTarihi.text = widget.model?.bitisTarihi ?? "";*/
      });
    } else {
      widget.model = SettingsModel(id: 0, active: true, advancedFoodMenuGroupId: 0);
    }
  }
}
