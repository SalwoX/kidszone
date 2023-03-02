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
import '../model/group_model.dart';
import '../service/repository_group.dart';

// ignore: must_be_immutable
class PageRegistrationGroup extends StatefulWidget {
  String? title = LocaleKeys.pageGroup_group_regis.tr();
  final String subTitle = "";
  final _formKey = GlobalKey<FormState>();
  GroupModel? model;

  var repCommon = resolve<RepositoryCommon>();
  var repKayit = resolve<RepositoryGroup>();

  PageRegistrationGroup({Key? key, this.model, this.title}) : super(key: key);

  @override
  _PageRegistrationGroupState createState() => _PageRegistrationGroupState();
}

class _PageRegistrationGroupState extends State<PageRegistrationGroup> with LoggerMixin {
  bool _saveEnable = true;
  int currentIndexPage = 4;
  bool? _active;
  var _name = TextEditingController();
  var _description = TextEditingController();

  @override
  void initState() {
    super.initState();
    currentIndexPage = 4;
    if (widget.model != null && widget.model!.id != 0) {
      setState(() {
        //! özel modelden okunması gereken datalar
        _active = widget.model?.active ?? true;
        _name.text = widget.model?.name ?? "";
        _description.text = widget.model?.description ?? "";
      });
    } else if (widget.model == null) {
      widget.model = GroupModel(id: 0);
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
                  text: LocaleKeys.pageGroup_save.tr(),
                ),
              ],
              title: " ${widget.title} İşlemleri",
            )
          : null,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            CustomAppBar(
              innerBoxIsScrolled,
              headerWidgets: [
                Text(
                  widget.title ?? '',
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
                        //ad
                        KzTextEdit(
                          controller: _name,
                          labelText: LocaleKeys.pageGroup_name.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.name = newValue;
                          },
                        ),

                        //aciklama
                        KzTextEdit(
                          controller: _description,
                          labelText: LocaleKeys.pageGroup_explanation.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.description = newValue;
                          },
                        ),

                        //aktif
                        KzCheckBox(
                          title: LocaleKeys.pageGroup_active.tr(),
                          checkedValue: _active ?? true,
                          onChanged: (newValue) {
                            setState(() {
                              _active = newValue;
                              widget.model!.active = newValue;
                            });
                          },
                        ),

                        //İnfo
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
        var res = await widget.repKayit.addOrUpdate(model: widget.model as GroupModel);
        if (res is GroupModel) {
          showTopSnackBar(
            context,
            KzSnackWidgetMinifit(
              message: LocaleKeys.pageGroup_saved.tr(),
              messageType: MessageType.Success,
            ),
          );

          widget.model = res;
          widget.model = res;
        } else if (res is MobileResult) {
          showTopSnackBar(
            context,
            KzSnackWidgetMinifit(
              message: LocaleKeys.pageGroup_warning.tr() + (res.message ?? ''),
              messageType: MessageType.Error,
            ),
          );
        }
      } catch (e) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageGroup_warning_messages.tr(),
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
