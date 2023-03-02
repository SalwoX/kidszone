import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';
import '../../my_block.dart';

// ignore: must_be_immutable
class KzDropDown extends StatefulWidget {
  final ValueChanged<String?>? onChanged;
  final List<DropdownMenuItem<String>> list;
  String? value;
  final String title;
  final IconData? icon;

  KzDropDown({required this.list, Key? key, required this.title, this.onChanged, required this.value, this.icon}) : super(key: key);

  @override
  _KzDropDownState createState() => _KzDropDownState();
}

class _KzDropDownState extends State<KzDropDown> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
        children: [
        widget.icon != null
            ? Container(
                padding: EdgeInsets.all(MyBlock.horizontal(context, x: 3)),
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Icon(
                  widget.icon,
                  color: context.theme.iconTheme.color,
                  size: context.theme.iconTheme.size,
                ),
              )
            : Container(
                padding: EdgeInsets.all(MyBlock.horizontal(context, x: 3)),
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Icon(
                  Icons.list,
                  color: context.theme.iconTheme.color,
                  size: context.theme.iconTheme.size,
                ),
              ),
        SizedBox(
          width: MyBlock.horizontal(context, x: 3),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton<String?>(
                isExpanded: true,
                hint: Text('${widget.title} Seçiniz'),
                style: context.textTheme.labelMedium,
                onChanged: widget.onChanged,
                value: widget.value,
                items: widget.list,
              ),
            ],
            ),
          ),
          SizedBox(
            width: MyBlock.horizontal(
              context,
              x: 3,
            ),
          ),
        ],
    );
    /*Card(
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(MyBlock.horizontal(context, x: 10))),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(
          MyBlock.horizontal(context, x: 1.5),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(
                MyBlock.horizontal(context, x: 1),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff6551A0),
              ),
              child: Icon(
                widget.icon,
                color: Colors.white,
                size: MyBlock.horizontal(context, x: 9),
              ),
            ),
            Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: widget.value ?? null,
                  items: widget.liste,
                  onChanged: widget.onChanged ??
                      (_) {
                        setState(() {
                          widget.value = _;
                        });
                      },
                  hint: Text(widget.title ?? ''),
                ),
              ),
            )
          ],
        ),
      ),
    );







    Row(
        children: [
          SizedBox(
            width: MyBlock.horizontal(context, x: 1),
          ),
          widget.icon != null
              ? Container(
                  padding: EdgeInsets.all(MyBlock.horizontal(context, x: 2)),
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xff6551A0)),
                  child: Icon(
                    widget.icon,
                    color: Colors.white,
                    size: MyBlock.horizontal(context, x: 8),
                  ),
                )
              : Container(
                  padding: EdgeInsets.all(MyBlock.horizontal(context, x: 3)),
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xff6551A0)),
                  child: const Icon(Icons.list),
                ),
          SizedBox(
            width: MyBlock.horizontal(context, x: 3),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButton<String?>(
                  isExpanded: true,
                  hint: const Text('Seçiniz'),
                  style: TextStyle(fontSize: MyBlock.vertical(context, x: 1.7), color: const Color(0xff6551A0), fontWeight: FontWeight.bold),
                  onChanged: widget.onChanged,
                  value: widget.value,
                  items: widget.list,
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: MyBlock.horizontal(
                      context,
                      x: 3,
                    ),
                    color: Colors.black54,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: MyBlock.horizontal(
              context,
              x: 3,
            ),
          ),
        ],
      ),


    */
  }
}
