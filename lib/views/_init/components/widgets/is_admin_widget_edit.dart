// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:kidszone_app/common/infrastructure/work_context.dart';
import 'package:kidszone_app/core/extension/context_extension.dart';
import 'package:kidszone_app/views/_init/models/filter_model.dart';
import 'package:kidszone_app/views/_init/my_block.dart';
import 'package:kidszone_app/views/_init/themes/colors.dart';
import 'package:kidszone_app/views/school_operations/branch/model/branch_model.dart';

import '../../../../data/repositories/repository_common.dart';
import '../../../../register.dart';
import '../../../school_operations/school/model/school_model.dart';
import '../dropdown/dropdownlist/dropdown_search.dart';

class IsAdminWidgetEdit extends StatefulWidget {
  final FormFieldSetter<SchoolModel>? onSavedSchool;
  final FormFieldSetter<BranchModel>? onSavedBranch;
  final DropdownSearchOnFind<BranchModel>? onFindBranch;
  final VoidCallback? onPressedSchool;
  final VoidCallback? onPressedBranch;
  TextEditingController schoolController;
  TextEditingController branchController;

  var repCommon = resolve<RepositoryCommon>();

  IsAdminWidgetEdit({
    Key? key,
    this.onSavedSchool,
    this.onSavedBranch,
    this.onPressedSchool,
    this.onPressedBranch,
    this.onFindBranch,
    required this.schoolController,
    required this.branchController,
  }) : super(key: key);

  @override
  _IsAdminWidgetEditState createState() => _IsAdminWidgetEditState();
}

class _IsAdminWidgetEditState extends State<IsAdminWidgetEdit> {
  var superAdmin = WorkContext.userModel!.schoolId!.toInt() <= 0 ? true : false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          superAdmin
              ? DropdownSearch<SchoolModel>(
                  dropdownSearchDecoration: InputDecoration(
                    hintText: "Seçiniz",
                    labelText: "Okul",
                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.vertical(context, x: 1)),
                    labelStyle: context.textTheme.labelMedium,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  onSaved: widget.onSavedSchool,
                  maxHeight: 300,
                  mode: Mode.BOTTOM_SHEET,
                  showClearButton: true,
                  isFilteredOnline: true,
                  showSelectedItems: true,
                  /*  dropdownBuilder: (context, selectedItem) {
                    var a = selectedItem;
                    var list = widget.repCommon.getOkulId(filter);
                    return list;
                  },*/
                  searchFieldProps: TextFieldProps(
                    controller: widget.schoolController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear, color: ThemeColors.white, size: MyBlock.horizontal(context, x: 30)),
                        onPressed: () {
                          widget.schoolController.clear();
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
                      fields.add(Field(fieldName: "Adi", fieldOperator: "startswith", fieldValue: filter));
                    }
                    var list = widget.repCommon.getSchoolList(fields);
                    return list;
                  },
                  itemAsString: (val) => "${val!.name!}",
                  //  selectedItem:,
                  onChanged: widget.onSavedSchool,
                  controller: widget.schoolController,
                  selectedItemFuture: (filter) async {
                    var fields = <Field>[];
                    if (filter != null && filter.isNotEmpty) {
                      fields.add(Field(fieldName: "Id", fieldOperator: "eq", fieldValue: filter));
                    }
                    var list = await widget.repCommon.getSchoolList(fields);
                    return list;
                  },
                )
              : Container(),
          superAdmin
              ? DropdownSearch<BranchModel>(
                  dropdownSearchDecoration: InputDecoration(
                    hintText: "Seçiniz",
                    labelText: "Şube",
                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 1)),
                    labelStyle: context.textTheme.labelMedium,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  onSaved: widget.onSavedBranch,
                  maxHeight: 300,
                  mode: Mode.BOTTOM_SHEET,
                  showClearButton: true,
                  isFilteredOnline: true,
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear, color: ThemeColors.white, size: MyBlock.horizontal(context, x: 30)),
                        onPressed: () {
                          widget.branchController.clear();
                        },
                      ),
                    ),
                  ),
                  compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
                  filterFn: (item, filter) {
                    if (filter!.isEmpty) return true;
                    return item!.branchName!.toLowerCase().contains(filter.toLowerCase());
                  },
                  onFind: widget.onFindBranch,
                  itemAsString: (val) => "${val!.branchName!}",
                  controller: widget.branchController,
                  selectedItemFuture: (filter) async {
                    var fields = <Field>[];
                    if (filter != null && filter.isNotEmpty) {
                      fields.add(Field(fieldName: "Id", fieldOperator: "eq", fieldValue: filter));
                    }
                    var list = await widget.repCommon.getBranchList('', fields);
                    return list;
                  },
                )
              : Container(),
        ],
      ),
    );
  }
}
