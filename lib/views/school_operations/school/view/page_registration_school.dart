import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../data/repositories/repository_common.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../register.dart';
import '../../../_init/components/appbar/custom_appbar.dart';
import '../../../_init/components/button/KzNumericStepButton.dart';
import '../../../_init/components/checbox/kz_checkbox.dart';
import '../../../_init/components/dropdown/dropdownlist/dropdown_search.dart';
import '../../../_init/components/input/kz_edit_widgets.dart';
import '../../../_init/components/widgets/kzsnack_widget.dart';
import '../../../_init/logger/logger_mixin.dart';
import '../../../_init/models/filter_model.dart';
import '../../../_init/models/mobile_result.dart';
import '../../../_init/my_block.dart';
import '../../../_init/themes/colors.dart';
import '../../group_operations/model/group_model.dart';
import '../model/school_model.dart';
import '../service/repository_school.dart';

// ignore: must_be_immutable
class PageSchoolRegistration extends StatefulWidget {
  final String title = LocaleKeys.pageRegisSchool_school_regis.tr();
  final String subTitle = "";
  SchoolModel? model;

  RepositoryCommon repCommon = resolve<RepositoryCommon>();
  RepositorySchool repRegistration = resolve<RepositorySchool>();

  PageSchoolRegistration({Key? key, this.model}) : super(key: key);

  @override
  _PageSchoolRegistrationState createState() => _PageSchoolRegistrationState();
}

class _PageSchoolRegistrationState extends State<PageSchoolRegistration> with LoggerMixin {
  int currentIndexPage = 4;
  String? _schoolPackage;
  int? _studentCount = 0;
  var name = TextEditingController();
  var degree = TextEditingController();
//  List<DropdownMenuItem<String>> _packageList = <DropdownMenuItem<String>>[];
  bool? _active;

  @override
  void initState() {
    super.initState();
    currentIndexPage = 4;
    if (widget.model != null && widget.model!.id != 0) {
      setState(() {
        name.text = widget.model!.name ?? "";
        degree.text = widget.model!.degree ?? "";
        _studentCount = widget.model?.studentCount;
        _active = widget.model?.active;
        _schoolPackage = widget.model!.packageGroup!.toString();
      });
    } else {
      widget.model = SchoolModel(id: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                iconButton: [
                  IconButton(
                    icon: Icon(
                      Icons.save,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      await _save();
                    },
                  ),
                ],
              ),
            ];
          },
          body: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MyBlock.horizontal(context, x: 1),
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: KzTextEdit(
                          controller: name,
                          labelText: LocaleKeys.pageRegisSchool_school_name.tr(),
                          icon: Icons.title,
                          isRequired: true,
                          inputType: TextInputType.name,
                          onSaved: (newValue) {
                            widget.model!.name = newValue;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      KzTextEdit(
                        controller: degree,
                        labelText: LocaleKeys.pageRegisSchool_title.tr(),
                        icon: Icons.title,
                        isRequired: true,
                        inputType: TextInputType.name,
                        onSaved: (newValue) {
                          widget.model!.degree = newValue;
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      DropdownSearch<GroupModel>(
                        dropdownSearchDecoration: InputDecoration(
                          contentPadding: EdgeInsets.all(1),
                          icon: Icon(Icons.more_horiz),
                          hintText: LocaleKeys.pageRegisSchool_school_packet.tr(),
                          labelText: LocaleKeys.pageRegisSchool_school_packet.tr(),
                          labelStyle: context.textTheme.labelMedium,
                        ),
                        onSaved: (model) {
                          widget.model!.packageGroup = model!.id;
                          widget.model!.packageGroupName = model.name;
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
                                widget.model?.packageGroup = null;
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
                          }
                          fields.add(Field(fieldName: "Type", fieldOperator: "eq", fieldValue: "1"));
                          var list = widget.repCommon.getBloodGroupList(fields);
                          return list;
                        },
                        itemAsString: (val) => "${val!.name!}",
                        controller: TextEditingController(),
                        selectedItemFuture: (filter) async {
                          var fields = <Field>[];
                          if (filter != null && filter.isNotEmpty) {
                            fields.add(Field(fieldName: "Id", fieldOperator: "eq", fieldValue: filter));
                          }
                          var list = await widget.repCommon.getBloodGroupList(fields);
                          return list;
                        },
                      ).paddingTop(10),
                      // KzDropDown(
                      //   list: _packageList,
                      //   onChanged: (value) {
                      //     setState(() {
                      //       _schoolPackage = value;
                      //     });
                      //   },
                      //   value: _schoolPackage,
                      //   title: LocaleKeys.pageRegisSchool_school_packet.tr(),
                      //   icon: Icons.home_outlined,
                      // ),
                      SizedBox(
                        height: 16,
                      ),
                      KzNumericStepButton(
                        minValue: 50,
                        maxValue: 100000,
                        step: 20,
                        title: LocaleKeys.pageRegisSchool_student_number.tr(),
                        value: _studentCount ?? 0,
                        onChanged: (value) {
                          _studentCount = value;
                          widget.model!.studentCount = _studentCount;
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      KzCheckBox(
                        title: LocaleKeys.pageRegisSchool_active.tr(),
                        checkedValue: _active ?? true,
                        onChanged: (newValue) {
                          setState(() {
                            _active = newValue;
                            widget.model!.active = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              )),
            ],
          )),
    );
  }

  _save() async {
    widget.model!.name = name.text;
    widget.model!.degree = degree.text;
    widget.model!.active = _active;
    widget.model!.packageGroup = _schoolPackage.toInt();
    widget.model!.studentCount = _studentCount;
    var res = await widget.repRegistration.addOrUpdate(model: widget.model as SchoolModel);
    if (res is SchoolModel) {
      showTopSnackBar(
          context,
          KzSnackWidget(
            message: LocaleKeys.pageRegisSchool_saved.tr(),
            bgColor: Colors.white,
            textStyle: TextStyle(color: Color(0xff6551A0), fontSize: MyBlock.horizontal(context, x: 6), fontWeight: FontWeight.bold),
            leadingWidget: Icon(
              Icons.check_circle_outline_rounded,
              size: MyBlock.horizontal(context, x: 9),
              color: Color(0xff6551A0),
            ),
          ));
      widget.model = res;
    } else if (res is MobileResult) {
      showTopSnackBar(
          context,
          KzSnackWidget(
            message: res.message,
            bgColor: Colors.white,
            textStyle: TextStyle(color: Color(0xff6551A0), fontSize: MyBlock.horizontal(context, x: 6), fontWeight: FontWeight.bold),
            leadingWidget: Icon(
              Icons.error,
              size: MyBlock.horizontal(context, x: 9),
              color: Color(0xff6551A0),
            ),
          ));
    }
  }
}
