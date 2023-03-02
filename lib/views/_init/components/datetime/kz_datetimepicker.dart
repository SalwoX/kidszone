import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class KzDateTimePickerPage extends StatefulWidget {
  const KzDateTimePickerPage({Key? key}) : super(key: key);

  @override
  KzDateTimePickerPageState createState() => KzDateTimePickerPageState();
}

class KzDateTimePickerPageState extends State<KzDateTimePickerPage> {
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        helpText: 'Select your Booking date',
        cancelText: 'Not Now',
        confirmText: "Book",
        fieldLabelText: 'Booking Date',
        fieldHintText: 'Month/Date/Year',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter date in valid range',
        context: context,
        builder: (BuildContext context, Widget? child) {
          return Container(
            child: child,
          );
        },
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        child: ListTile(
          onTap: () {
            _selectDate(context);
          },
          title: Text(
            'Select your Booking date',
            style: context.textTheme.bodyMedium,
          ),
          subtitle: Text(
            "${selectedDate.toLocal()}".split(' ')[0],
            style: context.textTheme.bodyMedium,
          ),
          trailing: IconButton(
            // ignore: prefer_const_constructors
            icon: Icon(
              Icons.date_range,
              color: Colors.red,
            ),
            onPressed: () {
              _selectDate(context);
            },
          ),
        ));
  }
}
