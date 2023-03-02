// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:kidszone_app/core/extension/context_extension.dart';

// ignore: must_be_immutable
class KzNumericStepButton extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final int step;
  final String title;
  int? value;

  final ValueChanged<int>? onChanged;

  KzNumericStepButton({
    Key? key,
    this.minValue = 0,
    this.maxValue = 10,
    this.step = 1,
    required this.title,
    this.onChanged,
    required this.value,
  }) : super(key: key);

  @override
  State<KzNumericStepButton> createState() {
    return _KzNumericStepButtonState();
  }
}

class _KzNumericStepButtonState extends State<KzNumericStepButton> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    if (counter == 0) {
      counter = widget.value ?? widget.minValue;
    }
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Text(
                widget.title,
                style: context.textTheme.bodyMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.remove,
                      color: context.theme.iconTheme.color,
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 18.0),
                    iconSize: 32.0,
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      setState(() {
                        if (counter > widget.minValue) {
                          counter -= widget.step;
                          if (counter < widget.minValue) {
                            counter = widget.minValue;
                          }
                        }
                        widget.onChanged!(counter);
                      });
                    },
                  ),
                  Text(
                    '$counter',
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyLarge,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: context.theme.iconTheme.color,
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 18.0),
                    iconSize: 32.0,
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      setState(() {
                        if (counter < widget.maxValue) {
                          counter += widget.step;
                          if (counter > widget.maxValue) {
                            counter = widget.maxValue;
                          }
                        }
                        widget.onChanged!(counter);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
