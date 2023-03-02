import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Center circularProgress(BuildContext context) {
  return Center(
    child: SpinKitFadingCircle(
      size: 40.0,
      color: Theme.of(context).colorScheme.secondary,
    ),
  );
}

Container linearProgress(BuildContext context) {
  // ignore: avoid_unnecessary_containers
  return Container(
    child: LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Theme.of(context).colorScheme.secondary),
    ),
  );
}
