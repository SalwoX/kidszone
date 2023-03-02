// ignore_for_file: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kidszone_app/core/extension/context_extension.dart';
import 'package:kidszone_app/views/_init/components/image/image_viewer.dart';
import 'package:kidszone_app/views/_init/my_block.dart';
import 'package:path_provider/path_provider.dart';

@immutable
// ignore: must_be_immutable
class KzImageUpload extends StatefulWidget {
  List<String> photoList;
  ImagePicker picker;

  KzImageUpload({
    Key? key,
    required this.photoList,
    required this.picker,
  }) : super(key: key);

  @override
  _KzImageUploadState createState() => _KzImageUploadState();
}

class _KzImageUploadState extends State<KzImageUpload> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.photoList.isNotEmpty
            ? SizedBox(
                height: MyBlock.vertical(context, x: 15),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: widget.photoList
                      .map((e) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ImageViewer(
                                  photos: widget.photoList,
                                  initialIndex: widget.photoList.indexWhere((element) => element == e),
                                ),
                              ),
                            );
                          },
                          onLongPress: () {
                            setState(() {
                              widget.photoList.remove(e);
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2), vertical: MyBlock.horizontal(context, x: 2)),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  boxShadow: [const BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)],
                                  borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3)),
                                    child: Image.file(
                                      e as File,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                          )))
                      .toList(),
                ),
              )
            : Container(),
        SizedBox(
          height: MyBlock.vertical(context, x: 1),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () async {
                List<XFile>? pickedImages = await widget.picker.pickMultiImage();
                List<File> imageFileList = [];
                if (pickedImages.length > 0) {
                  final dir = await getTemporaryDirectory();
                  for (int i = 0; i < pickedImages.length; i++) {
                    var pickedImage = pickedImages[i];
                    File file = File(pickedImage.path);
                    if (file.lengthSync() > 2097152) {
                      file = await FlutterImageCompress.compressAndGetFile(
                            file.absolute.path,
                            dir.absolute.path + "/temp$i.jpg",
                            quality: 50,
                          ) ??
                          file;
                    }
                    imageFileList.add(file);
                  }
                }
                setState(() {
                  widget.photoList.addAll(imageFileList as List<String>);
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 0.5)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [const BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)],
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(MyBlock.horizontal(context, x: 10)), right: Radius.circular(MyBlock.horizontal(context, x: 5)))),
                child: Padding(
                  padding: EdgeInsets.all(
                    MyBlock.horizontal(context, x: 1.5),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1)),
                          decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xff6551A0)),
                          child: Icon(Icons.add_photo_alternate_outlined, color: Colors.white, size: MyBlock.horizontal(context, x: 9))),
                      SizedBox(
                        width: MyBlock.horizontal(context, x: 3),
                      ),
                      Text(
                        "Resim Yükle",
                        style: context.textTheme.bodyMedium,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MyBlock.vertical(context, x: 1),
        ),
      ],
    );
  }
}
