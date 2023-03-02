import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/convert_extension.dart';
import '../../themes/colors.dart';

class InfoWidget extends StatefulWidget {
  final int? id;
  final String? registrant;
  final DateTime? registrationDate;
  final String? modifier;
  final DateTime? modifiedDate;

  const InfoWidget({this.id, this.registrant, this.registrationDate, this.modifier, this.modifiedDate, Key? key}) : super(key: key);

  @override
  _InfoWidgetState createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.15,
      width: context.width * 1,
      color: ThemeColors.purple,
      child: Column(
        children: [
          Text(
            'blkodu:${widget.id}',
          ),
          Text('Kaydeden:${widget.registrant}'),
          Text(
            'Kayit Tarihi:${widget.registrationDate != null ? widget.registrationDate!.toStringFormat(format: "dd:MM:yyyy hh:mm") : ''}',
          ),
          Text('Değiştiren:${widget.modifier}'),
          Text('Değiştirme Tarihi:${widget.modifiedDate != null ? widget.modifiedDate!.toStringFormat(format: "dd:MM:yyyy hh:mm") : ''}'),
        ],
      ),
    );
  }
}
