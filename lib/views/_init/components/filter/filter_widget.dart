import 'package:flutter/material.dart';

import '../../models/filter_model.dart';
import '../../models/filter_widget_model.dart';
import 'filter_widgets/kz_filter_dropdown.dart';
import 'filter_widgets/kz_filter_edit_widgets.dart';

class FilterWidget extends StatefulWidget {
  final String title;
  final List<FilterWidgetModel> filterModel;

  const FilterWidget({Key? key, required this.title, required this.filterModel}) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  List<Widget> widgets = [];
  List<Field> fields = [];

  @override
  void initState() {
    super.initState();
    _widgetListBuild();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(widget.title),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      actions: <Widget>[
        TextButton(
          child: const Text('Vazgeç'),
          onPressed: () {
            //widget.onCancel();
          },
        ),
        TextButton(
          child: const Text('Filtrele'),
          onPressed: () {
            //widget.onOk();
            for (Container i in widgets as List<Container>) {
              var w = i.child;
              if (w is Container) {
                var c = w.child;
                if (c is Column) {
                  var field = Field();
                  for (final column in c.children) {
                    if (column is KzFilterTextEdit) {
                      field.fieldName = (column.key as ValueKey).value.toString();
                      field.fieldValue = column.controller.text;
                    }
                    if (column is KzFilterDropDown) {
                      field.fieldOperator = column.value;
                    }
                  }
                  if (field.fieldName != null) {
                    fields.add(field);
                  }
                }
              }
            }
          },
        ),
      ],
      content: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: widgets,
          ),
        ),
      ),
    );
  }

  Widget _filterTextWidget({required String widgetKey, required String label, required String value, required String operator}) {
    operator = operator;
    var controller = TextEditingController(text: value);
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        children: [
          Text(label),
          KzFilterTextEdit(
            key: Key(widgetKey),
            labelText: label,
            controller: controller,
            inputType: TextInputType.text,
          ),
          const SizedBox(height: 5),
          // KzFilterDropDown(
          //   key: Key(widgetKey + ".1"),
          //   title: "Operator",
          //   // liste: operatorList(
          //   //   primaryTextStyle(
          //   //     size: textSizeSMedium,
          //   //     color: appTextColorPrimary,
          //   //   ),
          //   // ),
          //   value: operator,
          // ),
        ],
      ),
    );
  }

  Widget _filterTWidgetNumeric({required String widgetKey, required String label, required String value}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: double.maxFinite,
      child: Column(
        children: [
          TextFormField(
            key: Key(widgetKey),
            keyboardType: TextInputType.number,
            controller: TextEditingController(text: "Test1"),
          ),
        ],
      ),
    );
  }

  // ignore: unused_element
  Widget _filterDropDown(widgetKey) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          TextFormField(
            key: Key(widgetKey.toString()),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }

  void _widgetListBuild() {
    for (int i = 0; i < widget.filterModel.length; i++) {
      var field = widget.filterModel[i];
      if (field.type == "string") {
        widgets.add(
          _filterTextWidget(widgetKey: field.fieldName, label: field.fieldLabel, value: field.fieldValue, operator: "contains"),
        );
      } else if (field.type == "int") {
        widgets.add(
          _filterTWidgetNumeric(
            widgetKey: field.fieldName,
            label: field.fieldLabel,
            value: field.fieldValue,
          ),
        );
      }
      widgets.add(
        const SizedBox(height: 10),
      );
    }
  }
}
