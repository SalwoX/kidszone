import 'package:flutter/material.dart';

import '../../../data/core/unathorised_exception.dart';
import '../../../register.dart';
import '../logger/logger_mixin.dart';
import '../router/app_router.dart';

class PageError extends StatefulWidget {
  final dynamic exception;
  final Function() function;

  const PageError({Key? key, required this.exception, required this.function}) : super(key: key);

  @override
  State<PageError> createState() => _PageErrorState();
}

class _PageErrorState extends State<PageError> with LoggerMixin {
  @override
  Widget build(BuildContext context) {
    if (widget.exception is UnauthorisedException) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        resolve<AppRouter>().replace(RouteLogin());
      });
      return Center();
    } else {
      return Column(
        children: [
          Center(
            child: Text(
              widget.exception.toString(),
            ),
          ),
          FloatingActionButton.extended(
            label: Text('Yeniden Dene'),
            onPressed: widget.function,
            icon: Icon(Icons.refresh),
          ),
        ],
      );
    }
  }
}
