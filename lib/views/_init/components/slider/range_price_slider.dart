// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class RangePriceSlider extends StatefulWidget {
  final double min;
  final double max;

  final void Function(RangeValues values) onCompleted;

  const RangePriceSlider({Key? key, required this.min, required this.max, required this.onCompleted}) : super(key: key);
  @override
  _RangePriceSliderState createState() => _RangePriceSliderState();
}

class _RangePriceSliderState extends State<RangePriceSlider> {
  late RangeValues _values;

  @override
  void initState() {
    super.initState();
    _values = RangeValues(widget.min, widget.max);
  }

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: _values,
      max: widget.max,
      min: widget.min,
      labels: RangeLabels('${_values.start}', '${_values.end}'),
      activeColor: Colors.red,
      divisions: 10,
      onChanged: (value) {
        setState(() {
          _values = value;
        });
        widget.onCompleted(_values);
      },
    );
  }
}
