import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'colors.dart';
import 'constants.dart';

Widget divider() {
  return Padding(
    padding: EdgeInsets.only(left: 16.0, right: 16),
    child: Divider(
      color: appLayout_background,
      height: 16,
    ),
  );
}

//theme start

Widget headerView(String title, double height, BuildContext context) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.chevron_left,
              size: 25,
              color: appBlackColor,
            ).paddingAll(6).paddingOnly(top: spacing_standard).onTap(() {
              finish(context);
            }).paddingOnly(left: spacing_standard, right: spacing_standard_new, top: spacing_standard_new, bottom: spacing_standard),
          ],
        ),
        Text(
          title,
          style: context.textTheme.headlineMedium,
        ).paddingOnly(left: spacing_standard_new, right: spacing_standard),
      ],
    ),
  );
}

void loadingPanel({required BuildContext context, bool durum = true}) {
  if (durum) {
    showLoadingDialog(context);
  } else {
    Navigator.pop(context);
  }
}

Future<void> message({required BuildContext context, required String title, required String message}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text('Tamam'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

showLoadingDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(
          backgroundColor: Colors.transparent,
        ),
        Container(margin: EdgeInsets.only(left: 5), child: Text("Yükleniyor...")),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
