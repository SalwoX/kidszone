import 'package:flutter/material.dart';
import 'package:kidszone_app/core/extension/context_extension.dart';
import 'package:kidszone_app/register.dart';
import 'package:kidszone_app/views/_init/router/app_router.dart';

import '../../../../common/model/clipper.dart';
import '../../../_init/my_block.dart';

class PageFoodList extends StatefulWidget {
  @override
  _PageFoodListState createState() => _PageFoodListState();
}

class _PageFoodListState extends State<PageFoodList> {
  List myList = [
    {
      "title": "Sabah Kahvaltısı",
      "cal": "348",
      "contains": [
        "Domates-Salatalık",
        "Meyve Suyu",
        "Omlet",
        "Peynir",
        "Domates-Salatalık",
        "Meyve Suyu",
        "Omlet",
        "Peynir",
      ],
      "bg":
          "https://image.freepik.com/free-photo/food-with-ingredients_1220-4884.jpg"
    },
    {
      "title": "Öğle Yemeği",
      "cal": "365",
      "contains": [
        "Soslu Makarna",
        "Ekşili Çorba",
        "Ayran",
      ],
      "bg":
          "https://image.freepik.com/free-photo/food-with-ingredients_1220-4884.jpg"
    },
    {
      "title": "İkindi Kahvaltısı",
      "cal": "200",
      "contains": ["Dondurma"],
      "bg":
          "https://image.freepik.com/free-photo/food-with-ingredients_1220-4884.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: Column(
          children: [
            Text("Yemek Listesi"),
            Text(
              "Günün menülerini buradan görebilirsiniz.",
              style: TextStyle(
                  fontSize: MyBlock.horizontal(context, x: 3),
                  color: Colors.white60),
            ),
          ],
        ),
        backgroundColor: Color(0xff65539E),
        actions: [
          IconButton(
            onPressed: () => resolve<AppRouter>().push(RouteAddFoodList()),
            icon: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                ListView(
                  padding: EdgeInsets.only(
                      top: MyBlock.vertical(context, x: 2) * 4,
                      bottom: MyBlock.vertical(context, x: 12)),
                  shrinkWrap: true,
                  children: myList.map((e) => listItem(e)).toList(),
                ),
                Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Color(0xff65539E),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(
                                  MyBlock.horizontal(context, x: 6)))),
                      child: Center(
                          child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.white,
                              )),
                          Text(
                            DateTime.now().day.toString() +
                                "-" +
                                DateTime.now().month.toString() +
                                "-" +
                                DateTime.now().year.toString(),
                            style: context.textTheme.displaySmall,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                              ))
                        ],
                      )),
                    ),
                    ClipPath(
                      clipper: BottomClipper(
                          myVal: MyBlock.horizontal(context, x: 6)),
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
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget listItem(var item) {
    List itemList = item["contains"];
    return Stack(
      children: [
        Container(
          width: double.maxFinite,
          child: AspectRatio(
            aspectRatio: 1.9,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipPath(
                  clipper:
                      BottomClipper(myVal: MyBlock.horizontal(context, x: 6)),
                  child: Image.network(
                    item["bg"],
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  child: Container(
                    height: MyBlock.vertical(context, x: 4),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: itemList
                          .map((e) => Wrap(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right:
                                            MyBlock.horizontal(context, x: 1)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.9),
                                          borderRadius: BorderRadius.circular(
                                              MyBlock.vertical(context,
                                                  x: 1.2))),
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                            MyBlock.vertical(context, x: 0.9)),
                                        child: Text(
                                          e,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ))
                          .toList(),
                    ),
                  ),
                ),
                Wrap(
                  children: [
                    Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(
                                    MyBlock.horizontal(context, x: 6)))),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: MyBlock.horizontal(context, x: 6),
                              bottom: MyBlock.vertical(context, x: 0.5)),
                          child: Text(
                            item["title"],
                            style: TextStyle(
                                fontSize: MyBlock.horizontal(context, x: 3.6),
                                color: Colors.black54),
                          ),
                        )),
                    ClipPath(
                      clipper: BottomClipper(
                          myVal: MyBlock.horizontal(context, x: 6)),
                      child: Container(
                        width: double.maxFinite,
                        height: MyBlock.horizontal(context, x: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
/*
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(height: MyBlock.horizontal(context, x: 6),decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              MyBlock.horizontal(context, x: 6))))),
                )
*/
              ],
            ),
          ),
        ),
        Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding:
                  EdgeInsets.only(right: MyBlock.horizontal(context, x: 5)),
              child: Container(
                height: MyBlock.horizontal(context, x: 13),
                width: MyBlock.horizontal(context, x: 13),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xffEF9CC3)),
                child: Center(
                  child: Text(
                    item["cal"] + " cal",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MyBlock.horizontal(context, x: 3)),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:kidszone_app/views/_init/my_block.dart';
// import '../../../../common/model/clipper.dart';
// import '../../../_init/logger/logger_mixin.dart';

// class PageFoodList extends StatefulWidget {
//   @override
//   _PageFoodListState createState() => _PageFoodListState();
// }

// class _PageFoodListState extends State<PageFoodList> with LoggerMixin{
//   List myList = [
//     {
//       "title": "Sabah Kahvaltısı",
//       "cal": "348",
//       "contains": [
//         "Domates-Salatalık",
//         "Meyve Suyu",
//         "Omlet",
//         "Peynir",
//         "Domates-Salatalık",
//         "Meyve Suyu",
//         "Omlet",
//         "Peynir",
//       ],
//       "bg": "https://image.freepik.com/free-photo/food-with-ingredients_1220-4884.jpg"
//     },
//     {
//       "title": "Öğle Yemeği",
//       "cal": "365",
//       "contains": [
//         "Soslu Makarna",
//         "Ekşili Çorba",
//         "Ayran",
//       ],
//       "bg": "https://image.freepik.com/free-photo/food-with-ingredients_1220-4884.jpg"
//     },
//     {
//       "title": "İkindi Kahvaltısı",
//       "cal": "200",
//       "contains": ["Dondurma"],
//       "bg": "https://image.freepik.com/free-photo/food-with-ingredients_1220-4884.jpg"
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         shadowColor: Colors.transparent,
//         title: Column(
//           children: [
//             Text("Yemek Listesi"),
//             Text(
//               "Günün menülerini buradan görebilirsiniz.",
//               style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3), color: Colors.white60),
//             ),
//           ],
//         ),
//         backgroundColor: Color(0xff65539E),
//         actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Stack(
//               children: [
//                 ListView(
//                   padding: EdgeInsets.only(top: MyBlock.vertical(context, x: 2) * 4, bottom: MyBlock.vertical(context, x: 12)),
//                   shrinkWrap: true,
//                   children: myList.map((e) => listItem(e)).toList(),
//                 ),
//                 Column(
//                   children: [
//                     Container(
//                       width: double.maxFinite,
//                       decoration: BoxDecoration(color: Color(0xff65539E), borderRadius: BorderRadius.only(bottomRight: Radius.circular(MyBlock.horizontal(context, x: 6)))),
//                       child: Center(
//                           child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.arrow_back_ios_rounded,
//                                 color: Colors.white,
//                               )),
//                           Text(
//                             "21-Eylül-2020 Pazartesi",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.arrow_forward_ios_rounded,
//                                 color: Colors.white,
//                               ))
//                         ],
//                       )),
//                     ),
//                     ClipPath(
//                       clipper: BottomClipper(myVal: MyBlock.horizontal(context, x: 6)),
//                       child: Container(
//                         width: double.maxFinite,
//                         height: MyBlock.horizontal(context, x: 6),
//                         decoration: BoxDecoration(
//                           color: Color(0xff65539E),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget listItem(var item) {
//     List itemList = item["contains"];
//     return Stack(
//       children: [
//         Container(
//           width: double.maxFinite,
//           child: AspectRatio(
//             aspectRatio: 1.9,
//             child: Stack(
//               fit: StackFit.expand,
//               children: [
//                 ClipPath(
//                   clipper: BottomClipper(myVal: MyBlock.horizontal(context, x: 6)),
//                   child: Image.network(
//                     item["bg"].toString(),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Align(
//                   child: Container(
//                     height: MyBlock.vertical(context, x: 4),
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       shrinkWrap: true,
//                       children: itemList
//                           .map((e) => Wrap(
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsets.only(right: MyBlock.horizontal(context, x: 1)),
//                                     child: Container(
//                                       decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), borderRadius: BorderRadius.circular(MyBlock.vertical(context, x: 1.2))),
//                                       child: Padding(
//                                         padding: EdgeInsets.all(MyBlock.vertical(context, x: 0.9)),
//                                         child: Text(
//                                           e,
//                                           style: TextStyle(color: Colors.black),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ))
//                           .toList(),
//                     ),
//                   ),
//                 ),
//                 Wrap(
//                   children: [
//                     Container(
//                         width: double.maxFinite,
//                         decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(bottomRight: Radius.circular(MyBlock.horizontal(context, x: 6)))),
//                         child: Padding(
//                           padding: EdgeInsets.only(left: MyBlock.horizontal(context, x: 6), bottom: MyBlock.vertical(context, x: 0.5)),
//                           child: Text(
//                             item["title"],
//                             style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.6), color: Colors.black54),
//                           ),
//                         )),
//                     ClipPath(
//                       clipper: BottomClipper(myVal: MyBlock.horizontal(context, x: 6)),
//                       child: Container(
//                         width: double.maxFinite,
//                         height: MyBlock.horizontal(context, x: 6),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
// /*
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Container(height: MyBlock.horizontal(context, x: 6),decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(
//                               MyBlock.horizontal(context, x: 6))))),
//                 )
// */
//               ],
//             ),
//           ),
//         ),
//         Align(
//             alignment: Alignment.topRight,
//             child: Padding(
//               padding: EdgeInsets.only(right: MyBlock.horizontal(context, x: 5)),
//               child: Container(
//                 height: MyBlock.horizontal(context, x: 13),
//                 width: MyBlock.horizontal(context, x: 13),
//                 decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xffEF9CC3)),
//                 child: Center(
//                   child: Text(
//                     item["cal"] + " cal",
//                     style: TextStyle(color: Colors.white, fontSize: MyBlock.horizontal(context, x: 3)),
//                   ),
//                 ),
//               ),
//             ))
//       ],
//     );
//   }
// }
