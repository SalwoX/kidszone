import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:nb_utils/src/extensions/widget_extensions.dart';

// ignore: must_be_immutable
class KzFilterDropDown extends StatefulWidget {
  final ValueChanged<String?>? onChanged;
  List<DropdownMenuItem<dynamic>> list = <DropdownMenuItem<dynamic>>[];
  String value;
  final String title;

  KzFilterDropDown({required this.list, required Key key, required this.title, this.onChanged, required this.value}) : super(key: key);

  @override
  _KzFilterDropDownState createState() => _KzFilterDropDownState();
}

class _KzFilterDropDownState extends State<KzFilterDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        border: Border.all(
          //  color: ThemeColors.appColorPrimary,
          width: 0.5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: widget.value,
              items: widget.list as List<DropdownMenuItem<String>>?,
              onChanged: widget.onChanged ??
                  (_) {
                    setState(() {
                      widget.value = _ ?? "";
                    });
                  },
              hint: Text(widget.title),
            ),
          ).expand(),
        ],
      ),
    );
  }
}
