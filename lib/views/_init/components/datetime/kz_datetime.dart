import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/extension/context_extension.dart';
import 'datetimepicker/rounded_flutter_datetime_picker.dart';
import '../../my_block.dart';
import '../../themes/colors.dart';

class KzDateTime extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final DateTime? startingDate;
  final DateTime? endDate;
  final String format;
  final bool isRequired;

  final Function(String?)? onSaved;

  const KzDateTime({
    Key? key,
    required this.controller,
    required this.labelText,
    this.startingDate,
    this.endDate,
    this.format = 'dd.MM.yyyy',
    this.onSaved,
    required this.isRequired,
  }) : super(key: key);

  @override
  _KzDateTimeState createState() => _KzDateTimeState();
}

class _KzDateTimeState extends State<KzDateTime> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var theme = DatePickerTheme(
          headerColor: ThemeColors.purple,
          backgroundColor: Colors.white,
          itemStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          cancelStyle: TextStyle(color: ThemeColors.white, fontSize: 16),
          doneStyle: TextStyle(color: ThemeColors.white, fontSize: 16),
        );
        DatePicker.showDatePicker(
          context,
          showTitleActions: true,
          minTime: widget.startingDate ?? DateTime(2010, 3, 5),
          maxTime: widget.endDate ?? DateTime.now(),
          theme: theme,
          onChanged: (date) {
            widget.controller.text = DateFormat(widget.format).format(date!);
          },
          onConfirm: (date) {
            widget.controller.text = DateFormat(widget.format).format(date!);
          },
          currentTime: widget.controller.text.isEmpty ? null : DateFormat(widget.format).parse(widget.controller.text),
          locale: LocaleType.tr,
        );
      },
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: ThemeColors.white),
              child: Icon(Icons.date_range_rounded,color: context.theme.iconTheme.color,
                  size: MyBlock.horizontal(context, x: 6.0))),
          SizedBox(
            width:15.0,
          ),
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              enabled: false,
              style: context.textTheme.labelMedium,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(1),
                  labelText: widget.labelText,
                  labelStyle: context.textTheme.labelMedium,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none),
              keyboardType: TextInputType.datetime,
              validator: (value) {
                return validation(
                  value,
                  widget.isRequired,
                  widget.labelText,
                );
              },
              onSaved: widget.onSaved,
            ),
          ),
        ],
      ),
    );
  }

  String? validation(String? value, bool isRequired, String? label) {
    if (isRequired) {
      if (value == null || value.isEmpty) {
        return '$label alanı zorunludur!';
      } else {
        return null;
      }
    }
    return null;
  }
}
