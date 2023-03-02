import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../core/extension/context_extension.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../views/_init/my_block.dart';
import '../../../common/model/clipper.dart';
import '../../../views/_init/logger/logger_mixin.dart';

class PageSocialNetwork extends StatefulWidget {
  const PageSocialNetwork({Key? key}) : super(key: key);

  @override
  _PageSocialNetworkState createState() => _PageSocialNetworkState();
}

class _PageSocialNetworkState extends State<PageSocialNetwork>
    with LoggerMixin {
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
      "text":
          "Kaplumbağalarımız kaç yaşında? Kabuğundaki çizgileri sayarak hesapladık.",
      "postUrl":
          "https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/k-191-eye-ae-00137.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=592707fe9680c1a6512f25f934779c7e",
      "type": "photo"
    },
    {
      "name": "Zeynep ÖKSÜZ",
      "time": "2 Saat Önce",
      "text":
          "Kaplumbağalarımız kaç yaşında? Kabuğundaki çizgileri sayarak hesapladık.",
      "postUrl":
          "https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/k-191-eye-ae-00137.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=592707fe9680c1a6512f25f934779c7e",
      "type": "photo"
    },
    {
      "name": "Sena DİKİCİ",
      "time": "1 Hafta Önce",
      "text": "Resim Atölyesi dersimizde renk kodlama yaptık",
      "postUrl":
          "https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/k-191-eye-ae-00137.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=592707fe9680c1a6512f25f934779c7e",
      "type": "video"
    },
    {
      "name": "Sena DİKİCİ",
      "time": "1 Hafta Önce",
      "text": "Resim Atölyesi dersimizde renk kodlama yaptık",
      "postUrl":
          "https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/k-191-eye-ae-00137.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=592707fe9680c1a6512f25f934779c7e",
      "type": "video"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          shadowColor: Colors.transparent,
          title: Text("Sosyal Ağ"),
          centerTitle: true,
          backgroundColor: Color(0xff65539E),
          actions: [
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
                        children: [
                          Text(
                            LocaleKeys.condition_all_things.tr(),
                            style: context.textTheme.bodyMedium,
                          ),
                          Icon(filter == "all"
                              ? Icons.check_box_rounded
                              : Icons.check_box_outline_blank_rounded)
                        ],
                      )),
                  PopupMenuItem(
                      value: "photo",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LocaleKeys.condition_photoss.tr(),
                            style: context.textTheme.bodyMedium,
                          ),
                          Icon(filter == "photo"
                              ? Icons.check_box_rounded
                              : Icons.check_box_outline_blank_rounded)
                        ],
                      )),
                  PopupMenuItem(
                      value: "video",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LocaleKeys.condition_videoss.tr(),
                            style: context.textTheme.bodyMedium,
                          ),
                          Icon(filter == "video"
                              ? Icons.check_box_rounded
                              : Icons.check_box_outline_blank_rounded)
                        ],
                      )),
                ];
              },
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () =>
                  null, //Navigator.push(context, MaterialPageRoute(builder: (context)=>PaylasimYap())),
            ),
          ]),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MyBlock.horizontal(context, x: 5)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MyBlock.vertical(context, x: 3),
                      ),
                      Column(
                        children: posts
                            .where((element) => filter != "all"
                                ? element["type"] == filter
                                : true)
                            .map((e) => Column(
                                  children: [
                                    postWidget(e),
                                    SizedBox(
                                      height: MyBlock.vertical(context, x: 3),
                                    )
                                  ],
                                ))
                            .toList(),
                      )
                    ],
                  ),
                )),
                ClipPath(
                  clipper:
                      BottomClipper(myVal: MyBlock.horizontal(context, x: 6)),
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
    );
  }

  Widget postWidget(var value) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            SizedBox(
              height: MyBlock.horizontal(context, x: 6),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, spreadRadius: 2, blurRadius: 5)
                  ],
                  borderRadius:
                      BorderRadius.circular(MyBlock.horizontal(context, x: 7))),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    value["name"].toString(),
                                    style: context.textTheme.bodyLarge,
                                  ),
                                  Text(
                                    value["time"].toString(),
                                    style: context.textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.more_vert_rounded),
                              onPressed: () {},
                              color: Color(0xff65539E),
                            )
                          ],
                        ),
                        SizedBox(
                          height: MyBlock.vertical(context, x: 2),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MyBlock.horizontal(context, x: 3.3)),
                          child: Text(
                            value["text"].toString(),
                            textAlign: TextAlign.center,
                            style: context.textTheme.bodyLarge,
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
                            borderRadius: BorderRadius.circular(
                                MyBlock.horizontal(context, x: 7)),
                            child: Image.network(
                              value["postUrl"].toString(),
                              fit: BoxFit.fitWidth,
                            )),
                        value["type"] == "video"
                            ? Align(
                                child: Wrap(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(
                                            MyBlock.horizontal(context, x: 1)),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xff6551A0)),
                                        child: Icon(Icons.play_arrow_outlined,
                                            color: Colors.white,
                                            size: MyBlock.horizontal(context,
                                                x: 11))),
                                  ],
                                ),
                              )
                            : Container()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
            padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1)),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xff6551A0)),
            child: Icon(Icons.person_rounded,
                color: Colors.white, size: MyBlock.horizontal(context, x: 11)))
      ],
    );
  }
}
