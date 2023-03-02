import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../data/repositories/repository_common.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../../register.dart';
import '../../../../_init/components/appbar/custom_appbar.dart';
import '../../../../_init/components/button/save_button_model.dart';
import '../../../../_init/components/input/kz_edit_widgets.dart';
import '../../../../_init/components/widgets/kzsnack_widget_minifity.dart';
import '../../../../_init/logger/logger_mixin.dart';
import '../../../../_init/models/mobile_result.dart';
import '../model/preregistration_notes_model.dart';
import '../service/repository_preregistrationnotes.dart';

// ignore: must_be_immutable
class PageRegistrationPreregistrationNotes extends StatefulWidget {
  final String title = LocaleKeys.pageRegistrationPreregistrationNotes_pre_regis_notes.tr();
  final String subTitle = LocaleKeys.pageRegistrationPreregistrationNotes_notes_edit.tr();
  PreregistrationNotesModel? model;

  var repCommon = resolve<RepositoryCommon>();
  var repRegistration = resolve<RepositoryPreregistrationNotes>();
  PageRegistrationPreregistrationNotes({Key? key, this.model}) : super(key: key);

  @override
  _PageRegistrationPreregistrationNotesState createState() => _PageRegistrationPreregistrationNotesState();
}

class _PageRegistrationPreregistrationNotesState extends State<PageRegistrationPreregistrationNotes> with LoggerMixin {
  final _formKey = GlobalKey<FormState>();
  int currentIndexPage = 4;
  bool _saveEnable = true;
  var not = TextEditingController();

  @override
  void initState() {
    super.initState();
    currentIndexPage = 4;
    if (widget.model != null && widget.model!.id != 0) {
      setState(() {
        not.text = widget.model!.notes ?? "";
      });
    } else if (widget.model!.preregistrationId == 0) {
      _saveEnable = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: _saveEnable,
        child: SaveButtonModal(
          buttons: [
            SaveModalButton(
              onTab: () => {
                setState(() {
                  _saveEnable = false;
                }),
                _save(),
              },
              icon: Icons.save,
              text: LocaleKeys.pageRegistrationPreregistrationNotes_save.tr(),
            ),
          ],
          title: LocaleKeys.pageRegistrationPreregistrationNotes_pre_regis_trans.tr(),
        ),
      ),
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
                  style: context.textTheme.displayLarge,
                ),
              ],
              isBackButton: true,
              appbarHeight: 90,
            ),
          ];
        },
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.0,
                    vertical: 5.0,
                  ),
                  child: KzTextEditMultiLine(
                    controller: not,
                    labelText: LocaleKeys.pageRegistrationPreregistrationNotes_note.tr(),
                    icon: Icons.info_rounded,
                    isRequired: true,
                    onSaved: (value) {
                      widget.model!.notes = value;
                    },
                    inputType: TextInputType.text,
                    maxLines: 5,
                  ),
                ),
              ],
            )),
      ),
    );
  }

  _save() async {
    if (_formKey.currentState!.validate()) {
      try {
        _formKey.currentState!.save();
        widget.model!.active = true;

        var res = await widget.repRegistration.addOrUpdate(model: widget.model as PreregistrationNotesModel);
        if (res is PreregistrationNotesModel) {
          showTopSnackBar(
            context,
            KzSnackWidgetMinifit(
              message: LocaleKeys.pageRegistrationPreregistrationNotes_saved.tr(),
              messageType: MessageType.Success,
            ),
          );

          widget.model = res;
        } else if (res is MobileResult) {
          showTopSnackBar(
            context,
            KzSnackWidgetMinifit(
              message: res.message,
              messageType: MessageType.Error,
            ),
          );
        }
      } catch (e) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageRegistrationPreregistrationNotes_warning_messages.tr(),
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
