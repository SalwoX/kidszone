import 'package:flutter/material.dart';

import '../../../common/model/clipper.dart';
import '../../../core/extension/datetime_extensions.dart';
import '../../../register.dart';
import '../../_init/components/video/video_player_widget.dart';
import '../../_init/components/widgets/bottom_navigation_bar.dart';
import '../../_init/logger/logger_mixin.dart';
import '../../_init/my_block.dart';
import '../../_init/router/app_router.dart';
import '../../_init/themes/colors.dart';
import '../model/social_network_model.dart';
import '../viewmodel/view_model_share.dart';

// ignore: must_be_immutable
class PageSocialNetwork extends StatefulWidget {
  ViewModelShare? vm = ViewModelShare();
  PageSocialNetwork({Key? key}) : super(key: key);

  @override
  _PageSocialNetworkState createState() => _PageSocialNetworkState();
}

class _PageSocialNetworkState extends State<PageSocialNetwork> with LoggerMixin {
  String filter = "all";

  // double containerDummyWidth = IconButton(
  //       icon: Icon(Icons.more_vert_rounded),
  //       onPressed: () {},
  //     ).padding.horizontal +
  //     IconButton(
  //       icon: Icon(Icons.more_vert_rounded),
  //       onPressed: () {},
  //     ).iconSize;

  List posts = [
    {
      "name": "Zeynep ÖKSÜZ",
      "time": "2 Saat Önce",
      "text": "Kaplumbağalarımız kaç yaşında? Kabuğundaki çizgileri sayarak hesapladık.",
      "postUrl":
          "https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/k-191-eye-ae-00137.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=592707fe9680c1a6512f25f934779c7e",
      "videoUrl": "",
      "type": "photo"
    },
    {
      "name": "Zeynep ÖKSÜZ",
      "time": "2 Saat Önce",
      "text": "Kaplumbağalarımız kaç yaşında? Kabuğundaki çizgileri sayarak hesapladık.",
      "postUrl":
          "https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/k-191-eye-ae-00137.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=592707fe9680c1a6512f25f934779c7e",
      "videoUrl": "",
      "type": "photo"
    },
    {
      "name": "Sena DİKİCİ",
      "time": "1 Hafta Önce",
      "text": "Resim Atölyesi dersimizde renk kodlama yaptık",
      "postUrl": "",
      "videoUrl": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      "type": "video"
    },
    {"name": "Sena DİKİCİ1", "time": "1 Hafta Öncex", "text": "Resim Atölyesi dersimizde renk kodlama yaptık", "postUrl": "", "videoUrl": "https://www.fluttercampus.com/video.mp4", "type": "video"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(shadowColor: Colors.transparent, title: Text("Sosyal Ağ"), centerTitle: true, backgroundColor: ThemeColors.mainPurple, actions: [
        PopupMenuButton(
          icon: Icon(Icons.filter_alt_outlined),
          color: Color(0xff65539E),
          onSelected: (value) {
            print(value);
            setState(() {
              filter = value.toString();
            });
          },
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                  value: "all",
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Hepsi", style: TextStyle(color: Colors.white)), Icon(filter == "all" ? Icons.check_box_rounded : Icons.check_box_outline_blank_rounded)],
                  )),
              PopupMenuItem(
                  value: "photo",
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Fotoğraflar", style: TextStyle(color: Colors.white)), Icon(filter == "photo" ? Icons.check_box_rounded : Icons.check_box_outline_blank_rounded)],
                  )),
              PopupMenuItem(
                  value: "video",
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Videolar", style: TextStyle(color: Colors.white)), Icon(filter == "video" ? Icons.check_box_rounded : Icons.check_box_outline_blank_rounded)],
                  )),
            ];
          },
        ),
        IconButton(icon: Icon(Icons.add), onPressed: () => resolve<AppRouter>().push(RouteShare()) //Navigator.push(context, MaterialPageRoute(builder: (context)
            // =>PaylasimYap())),
            ),
      ]),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 5)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MyBlock.vertical(context, x: 3),
                      ),
                      Column(
                        children: widget.vm!.models
                            .where((element) => filter != "all" ? (filter == "photo" ? element.imgUrl?.isNotEmpty == true : element.videoUrl?.isNotEmpty == true) : true)
                            .map((e) => Column(
                                  children: [
                                    postWidget(e),
                                    SizedBox(
                                      height: e.imgUrl?.isNotEmpty == true ? 85.0 : 20.0,
                                    )
                                  ],
                                ))
                            .toList(),
                      )
                    ],
                  ),
                )),
                ClipPath(
                  clipper: BottomClipper(myVal: MyBlock.horizontal(context, x: 6)),
                  child: Container(
                    width: double.maxFinite,
                    height: MyBlock.horizontal(context, x: 6),
                    decoration: BoxDecoration(
                      color: Color(0xff65539E),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: bottomNavigationBar(
        context: context,
        index: 3,
      ),
    );
  }

  Widget postWidget(SocialNetworkModel item) {
    final Image noImage = Image.asset('assets/images/login_bottom.png');
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            SizedBox(
              height: 1,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 5)], borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 7))),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(MyBlock.horizontal(context, x: 2)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                                //  width: containerDummyWidth,
                                ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item.registrant.toString(),
                                    style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.3), fontWeight: FontWeight.bold, color: Color(0xff65539E)),
                                  ),
                                  Text(
                                    DatetimeExtensions.timeFormat(item.registrationDate),
                                    style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.3), fontWeight: FontWeight.bold, color: Color(0xff65539E)),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.more_vert_rounded),
                              onPressed: () {},
                              color: ThemeColors.mainPurple,
                            )
                          ],
                        ),
                        SizedBox(
                          height: MyBlock.vertical(context, x: 2),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 3.3)),
                          child: Text(
                            item.content.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.1), fontWeight: FontWeight.normal, color: Color(0xffF19BC3)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: MyBlock.vertical(context, x: 20),
                    width: double.maxFinite,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 7)),
                          child: item.imgUrl != null
                              ? Image.network(
                                  item.imgUrl.toString(),
                                  fit: BoxFit.fitWidth,
                                  loadingBuilder: (context, child, loadingProgress) => (loadingProgress == null) ? child : CircularProgressIndicator(),
                                  errorBuilder: (context, error, stackTrace) => noImage,
                                )
                              : Container(),
                        ),
                        Visibility(
                            visible: item.videoUrl?.isNotEmpty == true,
                            child: Align(
                              child: Wrap(
                                children: [
                                  PageVideoPlayerWidget(
                                    videoUrl: item.videoUrl.toString(),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Visibility(
            //   visible: value["type"] == "video",
            //   child: Row(
            //     children: [
            //       Container(
            //         padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1)),
            //         decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xff6551A0)),
            //         child: IconButton(
            //           onPressed: (() {
            //             setState(() {
            //               value["onPlay"] = !value["onPlay"];
            //             });
            //             debugPrint('Play e Basıldı :${value['videoUrl']}, onPlay: ${value["onPlay"]}');
            //           }),
            //           icon: Icon(
            //             value["onPlay"] ? Icons.pause : Icons.play_arrow_outlined,
            //             color: Colors.white,
            //             size: MyBlock.horizontal(context, x: 11),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
        Container(
            padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1)),
            decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xff6551A0)),
            child: Icon(Icons.person_rounded, color: Colors.white, size: MyBlock.horizontal(context, x: 11)))
      ],
    );
  }
}
