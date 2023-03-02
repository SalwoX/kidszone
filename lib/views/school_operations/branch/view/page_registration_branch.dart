import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../data/repositories/repository_common.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../register.dart';
import '../../../_init/components/appbar/custom_appbar.dart';
import '../../../_init/components/dropdown/dropdownlist/dropdown_search.dart';
import '../../../_init/components/input/kz_edit_widgets.dart';
import '../../../_init/logger/logger_mixin.dart';
import '../../../_init/models/filter_model.dart';
import '../../../_init/models/mobile_result.dart';
import '../../../_init/my_block.dart';
import '../../../_init/themes/colors.dart';
import '../../school/model/school_model.dart';
import '../model/branch_model.dart';
import '../service/repository_branch.dart';

// ignore: must_be_immutable
class PageRegistrationBranch extends StatefulWidget {
  final String title = LocaleKeys.pageRegisBranch_branch_regis.tr();
  BranchModel? model;
  RepositoryCommon repCommon = resolve<RepositoryCommon>();
  RepositoryBranch repRegistration = resolve<RepositoryBranch>();
  final _formKey = GlobalKey<FormState>();

  Future<File>? file;
  String status = '';
  String? base64Image;
  File? tmpFile;
  String errMessage = LocaleKeys.pageRegisBranch_error_massage.tr();

  PageRegistrationBranch({Key? key, this.model}) : super(key: key);

  @override
  _PageRegistrationBranchState createState() => _PageRegistrationBranchState();
}

class _PageRegistrationBranchState extends State<PageRegistrationBranch> with LoggerMixin {
  int currentIndexPage = 4;
  var branchName = TextEditingController();
  var address = TextEditingController();
  var logoUrl = TextEditingController();
  var phoneNumber = TextEditingController();
  var slogan = TextEditingController();
  var mail = TextEditingController();
  var school = TextEditingController();

  // List<DropdownMenuItem<String>> _schoolList = <DropdownMenuItem<String>>[];
  // void schoolList() async {
  //   var res = await widget.repCommon.schoolGetListDropDown(
  //     context.textTheme.bodyMedium!,
  //   );
  //   setState(() {
  //     _schoolList = res;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    currentIndexPage = 4;
    //  this.schoolList();
    if (widget.model != null && widget.model!.id! > 0) {
      setState(() {
        branchName.text = widget.model!.branchName ?? "";
        address.text = widget.model!.address ?? "";
        logoUrl.text = widget.model!.logoUrl ?? "";
        phoneNumber.text = widget.model!.phoneNumber ?? "";
        slogan.text = widget.model!.slogan ?? "";
        mail.text = widget.model!.mail ?? "";
      });
    } else {
      widget.model = BranchModel(id: 0);
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
              ],
              appbarHeight: 70,
              iconButton: [
                IconButton(
                  icon: Icon(
                    Icons.save,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    if (widget._formKey.currentState!.validate()) {
                      widget._formKey.currentState!.save();
                      //widget.model!.subeAdi = subeAdi.text;
                      //widget.model!.adres = adress.text;
                      //widget.model!.mail = mail.text;
                      //widget.model!.logoUrl = logoUrl.text;
                      //widget.model!.slogan = slogan.text;
                      //widget.model!.tel = tel.text;
                      widget.model!.active = true;

                      var res = await widget.repRegistration.addOrUpdate(model: widget.model!);
                      if (res is BranchModel) {
                        toast(LocaleKeys.pageRegisBranch_success_message.tr());
                        widget.model = res;
                      } else if (res is MobileResult) {
                        toast(res.message);
                      }
                    }
                  },
                ),
              ],
              isBackButton: true,
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Container(
              width: double.infinity,
              child: Form(
                key: widget._formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: widget.model!.schoolId! <= 0,
                      child:
                          //Okul Seçiniz
                          DropdownSearch<SchoolModel>(
                        dropdownSearchDecoration: InputDecoration(
                          hintText: "Seçiniz",
                          labelText: "Okul",
                          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.vertical(context, x: 1)),
                          labelStyle: context.textTheme.labelMedium,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        onSaved: (value) {
                          if (widget.model == null) widget.model = BranchModel();
                          widget.model!.schoolId = value!.id!;
                        },
                        maxHeight: 300,
                        mode: Mode.BOTTOM_SHEET,
                        showClearButton: true,
                        isFilteredOnline: true,
                        showSelectedItems: true,
                        searchFieldProps: TextFieldProps(
                          controller: new TextEditingController(),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(Icons.clear, color: ThemeColors.white, size: MyBlock.horizontal(context, x: 30)),
                              onPressed: () {
                                ;
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
                          var list = widget.repCommon.getSchoolList(fields);
                          return list;
                        },
                        itemAsString: (val) => "${val!.name!}",
                        //  selectedItem:,
                        controller: school,
                        selectedItemFuture: (filter) async {
                          var fields = <Field>[];
                          if (filter != null && filter.isNotEmpty) {
                            fields.add(Field(fieldName: "Id", fieldOperator: "eq", fieldValue: filter));
                          }
                          var list = await widget.repCommon.getSchoolList(fields);
                          return list;
                        },
                      ),
                    ),
                    // WorkContext.userModel?.branchId == 0
                    //     ? KzDropDown(
                    //         list: _schoolList,
                    //         onChanged: (value) {
                    //           setState(() {
                    //             _schoolId = value.toInt();
                    //           });
                    //         },
                    //         value: _schoolId != null ? _schoolId.toString() : null,
                    //         title: LocaleKeys.pageRegisBranch_school_packet.tr(),
                    //         icon: Icons.home_outlined,
                    //       )
                    //     : Container(),
                    KzTextEdit(
                      controller: branchName,
                      labelText: LocaleKeys.pageRegisBranch_branch_name.tr(),
                      icon: Icons.title,
                      isRequired: true,
                      inputType: TextInputType.name,
                      onSaved: (newValue) {
                        widget.model!.branchName = newValue;
                      },
                    ),
                    KzTextEditMultiLine(
                      controller: address,
                      labelText: LocaleKeys.pageRegisBranch_address.tr(),
                      icon: Icons.title,
                      isRequired: true,
                      inputType: TextInputType.name,
                      onSaved: (newValue) {
                        widget.model!.address = newValue;
                      },
                    ),
                    KzTextEdit(
                      controller: slogan,
                      labelText: LocaleKeys.pageRegisBranch_slogan.tr(),
                      icon: Icons.alarm,
                      isRequired: true,
                      inputType: TextInputType.name,
                      onSaved: (newValue) {
                        widget.model!.slogan = newValue;
                      },
                    ),
                    KzTextEdit(
                      controller: phoneNumber,
                      labelText: LocaleKeys.pageRegisBranch_telephone.tr(),
                      icon: Icons.title,
                      inputType: TextInputType.phone,
                      isRequired: true,
                      onSaved: (newValue) {
                        widget.model!.phoneNumber = newValue;
                      },
                    ),
                    KzTextEdit(
                      controller: mail,
                      labelText: LocaleKeys.pageRegisBranch_mail.tr(),
                      icon: Icons.mail,
                      inputType: TextInputType.emailAddress,
                      isRequired: true,
                      onSaved: (newValue) {
                        widget.model!.mail = newValue;
                      },
                    ),
                    KzTextEdit(
                      controller: logoUrl,
                      labelText: LocaleKeys.pageRegisBranch_logo_url.tr(),
                      icon: Icons.title,
                      isRequired: false,
                      onSaved: (newValue) {
                        widget.model!.logoUrl = newValue;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: widget.file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done && null != snapshot.data) {
          widget.tmpFile = snapshot.data ?? File("");
          widget.base64Image = base64Encode(snapshot.data!.readAsBytesSync());
          return Flexible(
            child: Image.file(
              snapshot.data as File,
              fit: BoxFit.fill,
            ),
          );
        } else if (null != snapshot.error) {
          return Text(
            LocaleKeys.pageRegisBranch_error_image.tr(),
            textAlign: TextAlign.center,
          );
        } else {
          return Text(
            LocaleKeys.pageRegisBranch_no_image.tr(),
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }
}
