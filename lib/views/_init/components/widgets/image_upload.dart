import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
/* 
import 'package:kidszone_app/imports/import_components.dart' as kz;
import 'package:kidszone_app/imports/import_common.dart' as core;
import 'package:kidszone_app/imports/import_register.dart' as register;
import 'package:kidszone_app/imports/import_data.dart' as entity; */
import 'package:path_provider/path_provider.dart';

import '../../../../common/app_config.dart';
import '../../../../common/log.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../data/core/apiservices.dart';
import '../../../../register.dart';
import '../../my_block.dart';
import '../image/image_viewer.dart';

// ignore: must_be_immutable
class ImageUpload extends StatefulWidget {
  ImagePicker picker;
  List<File>? photoList = [];
  String imgUrl;

  ImageUpload({Key? key, required this.photoList, required this.picker, required this.imgUrl}) : super(key: key);

  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  @override
  void initState() {
    super.initState();
    uploadImages();
  }

  uploadImages() async {
    if (widget.imgUrl.isNotEmpty) {
      if (widget.photoList == null) widget.photoList = [];
      for (var url in widget.imgUrl.split(',')) {
        try {
          var imgName = url.split('\\').last;
          url = url.replaceAll('\\', '/');
          var image = await resolve<ApiServices>().downloadFile('${Prefix}${ApiUrl}${SuffixUrl}/$url', imgName);

          setState(() {
            widget.photoList!.add(image);
          });
        } catch (e) {
          print('hata resim indirme:${e.toString()}');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.photoList!.isNotEmpty
            ? Container(
                height: MyBlock.vertical(context, x: 15),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: widget.photoList!
                      .map((e) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ImageViewer(
                                  photos: widget.photoList as List<String>,
                                  initialIndex: widget.photoList!.indexWhere((element) => element == e),
                                ),
                              ),
                            );
                          },
                          onLongPress: () {
                            setState(() {
                              widget.photoList!.remove(e);
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2), vertical: MyBlock.horizontal(context, x: 2)),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)],
                                  borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3)),
                                    child: Image.file(
                                      e,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                List<XFile>? pickedImages = await widget.picker.pickMultiImage();
                List<File> imageFileList = [];
                if (pickedImages.isNotEmpty) {
                  final dir = await getTemporaryDirectory();
                  for (int i = 0; i < pickedImages.length; i++) {
                    var pickedImage = pickedImages[i];
                    File file = File(pickedImage.path);
                    Log.config(file.lengthSync());
                    if (file.lengthSync() > 2097152) {
                      file = await FlutterImageCompress.compressAndGetFile(
                            file.absolute.path,
                            dir.absolute.path + "/temp$i.jpg",
                            quality: 50,
                          ) ??
                          file;
                    }
                    Log.config(file.lengthSync());
                    imageFileList.add(file);
                  }
                }
                setState(() {
                  widget.photoList!.addAll(imageFileList);
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 0.5)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)],
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
                          decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xff6551A0)),
                          child: Icon(Icons.add_photo_alternate_outlined, color: Colors.white, size: MyBlock.horizontal(context, x: 9))),
                      SizedBox(
                        width: MyBlock.horizontal(context, x: 3),
                      ),
                      Text(
                        "Resim Yükle",
                        style: context.textTheme.labelMedium,
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
