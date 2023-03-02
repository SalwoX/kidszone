// ignore_for_file: use_key_in_widget_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kidszone_app/common/app_config.dart';
import 'package:photo_view/photo_view.dart';

// ignore: must_be_immutable
class ImageViewer extends StatefulWidget {
  List<String>? photos;
  int? initialIndex;

  ImageViewer({@required this.photos, @required this.initialIndex});

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  PageController? controller;
  bool allLoaded = false;
  bool isFile = false;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: widget.initialIndex ?? 0);
    startSync();
  }

  startSync() async {
    setState(() {
      if (widget.photos?.first is String) {
        isFile = false;
      } else {
        isFile = true;
      }
      allLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return allLoaded
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black45,
              shadowColor: Colors.transparent,
            ),
            extendBodyBehindAppBar: true,
            body: PageView(
              controller: controller,
              children: widget.photos!
                  .map((image) => isFile
                      ? PhotoView(
                          imageProvider: FileImage(image as File),
                          loadingBuilder: (context, event) => Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                value: event == null ? 0 : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
                              ),
                            ),
                          ),
                        )
                      : PhotoView(
                          imageProvider: NetworkImage(Prefix + ApiUrl + SuffixUrl + '/' + image.toString()),
                          loadingBuilder: (context, event) => Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                value: event == null ? 0 : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
                              ),
                            ),
                          ),
                        ))
                  .toList(),
            ),
          )
        : const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
