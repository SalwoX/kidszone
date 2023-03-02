import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../common/model/clipper.dart';
import '../../../core/extension/context_extension.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../register.dart';
import '../../_init/components/widgets/bottom_navigation_bar.dart';
import '../../_init/logger/logger_mixin.dart';
import '../../_init/my_block.dart';
import '../../_init/router/app_router.dart';
import '../../_init/themes/colors.dart';

class PageMessages extends StatefulWidget {
  final String title = "Ayarlar";
  final String subTitle = "Uygulama ayarlarını bu sayfadan yapabilirsiniz.";
  // ignore: unused_field
  final _formKey = GlobalKey<FormState>();

  PageMessages({Key? key}) : super(key: key);

  @override
  _PageMessagesState createState() => _PageMessagesState();
}

class _PageMessagesState extends State<PageMessages> with LoggerMixin {
  bool allLoaded = false;
  double searchWidth = 0;

  String pickedTarget = "...";

  int tabIndex = 0;

  List targetList = [
    LocaleKeys.condition_three_dots.tr(),
    LocaleKeys.condition_all_users.tr(),
    LocaleKeys.condition_class_list.tr(),
    LocaleKeys.condition_student_list.tr(),
    LocaleKeys.condition_just_teacher.tr()
  ];

  TextEditingController commentEdit = TextEditingController();

  List messages = [
    {"name": "Aybike GEMCİ", "lastMessage": "Tamamdır görüşmek üzere...", "dadNumber": "+905555555555", "momNumber": "+905555555555", "width": 0, "height": 0, "isCallOpen": false},
    {"name": "Aybike GEMCİ", "lastMessage": "Tamamdır görüşmek üzere...", "dadNumber": "+905555555555", "momNumber": "+905555555555", "width": 0, "height": 0, "isCallOpen": false},
    {"name": "Aybike GEMCİ", "lastMessage": "Tamamdır görüşmek üzere...", "dadNumber": "+905555555555", "momNumber": "+905555555555", "width": 0, "height": 0, "isCallOpen": false},
    {"name": "Aybike GEMCİ", "lastMessage": "Tamamdır görüşmek üzere...", "dadNumber": "+905555555555", "momNumber": "+905555555555", "width": 0, "height": 0, "isCallOpen": false},
    {"name": "Aybike GEMCİ", "lastMessage": "Tamamdır görüşmek üzere...", "dadNumber": "+905555555555", "momNumber": "+905555555555", "width": 0, "height": 0, "isCallOpen": false},
    {"name": "Aybike GEMCİ", "lastMessage": "Tamamdır görüşmek üzere...", "dadNumber": "+905555555555", "momNumber": "+905555555555", "width": 0, "height": 0, "isCallOpen": false},
    {"name": "Aybike GEMCİ", "lastMessage": "Tamamdır görüşmek üzere...", "dadNumber": "+905555555555", "momNumber": "+905555555555", "width": 0, "height": 0, "isCallOpen": false},
    {"name": "Aybike GEMCİ", "lastMessage": "Tamamdır görüşmek üzere...", "dadNumber": "+905555555555", "momNumber": "+905555555555", "width": 0, "height": 0, "isCallOpen": false},
    {"name": "Aybike GEMCİ", "lastMessage": "Tamamdır görüşmek üzere...", "dadNumber": "+905555555555", "momNumber": "+905555555555", "width": 0, "height": 0, "isCallOpen": false},
    {"name": "Aybike GEMCİ", "lastMessage": "Tamamdır görüşmek üzere...", "dadNumber": "+905555555555", "momNumber": "+905555555555", "width": 0, "height": 0, "isCallOpen": false},
    {"name": "Aybike GEMCİ", "lastMessage": "Tamamdır görüşmek üzere...", "dadNumber": "+905555555555", "momNumber": "+905555555555", "width": 0, "height": 0, "isCallOpen": false},
    {"name": "Aybike GEMCİ", "lastMessage": "Tamamdır görüşmek üzere...", "dadNumber": "+905555555555", "momNumber": "+905555555555", "width": 0, "height": 0, "isCallOpen": false},
    {"name": "Aybike GEMCİ", "lastMessage": "Tamamdır görüşmek üzere...", "dadNumber": "+905555555555", "momNumber": "+905555555555", "width": 0, "height": 0, "isCallOpen": false},
    {"name": "Aybike GEMCİ", "lastMessage": "Tamamdır görüşmek üzere...", "dadNumber": "+905555555555", "momNumber": "+905555555555", "width": 0, "height": 0, "isCallOpen": false},
  ];
  List teacherList = [
    {
      "name": "Aslınur ESKALEN",
    },
    {
      "name": "Aslınur ESKALEN",
    },
    {
      "name": "Aslınur ESKALEN",
    },
    {
      "name": "Aslınur ESKALEN",
    },
    {
      "name": "Aslınur ESKALEN",
    },
    {
      "name": "Aslınur ESKALEN",
    },
    {
      "name": "Aslınur ESKALEN",
    },
    {
      "name": "Aslınur ESKALEN",
    },
  ];

  TextEditingController searchEdit = TextEditingController();

  @override
  void initState() {
    super.initState();
    startSync();
  }

  startSync() async {
    Future.delayed(Duration.zero).then((value) {
      for (int a = 0; a < messages.length; a++) {
        messages[a]["height"] = MyBlock.horizontal(context, x: 9);
        messages[a]["width"] = MyBlock.horizontal(context, x: 9);
      }
      searchWidth = MyBlock.horizontal(context, x: 10);
      setState(() {
        allLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return allLoaded
        ? DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: PreferredSize(
                preferredSize: Size(AppBar().preferredSize.width, AppBar().preferredSize.height * 1.5),
                child: Stack(
                  children: [
                    AppBar(
                      shadowColor: Colors.transparent,
                      title: Text(
                        "Mesajlar",
                        style: context.textTheme.headlineMedium,
                      ),
                      backgroundColor: context.theme.backgroundColor,
                      bottom: PreferredSize(
                        preferredSize: Size(MyBlock.horizontal(context, x: 80), MyBlock.vertical(context, x: 4)),
                        child: Container(
                          width: MyBlock.horizontal(context, x: 80),
                          height: MyBlock.vertical(context, x: 4),
                          child: TabBar(
                            onTap: (a) {
                              setState(() {
                                tabIndex = a;
                              });
                            },
                            labelStyle: context.textTheme.displayLarge,
                            tabs: [
                              Tab(
                                child: Text("Sohbetler", style: context.textTheme.displaySmall),
                              ),
                              Tab(
                                child: Text("Toplu Mesaj", style: context.textTheme.displaySmall),
                              ),
                              Tab(
                                child: Text("Öğretmenler", style: context.textTheme.displaySmall),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    tabIndex != 1
                        ? Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                                height: AppBar().preferredSize.height * 1.35,
                                child: Wrap(
                                  children: [
                                    AnimatedContainer(
                                      width: searchWidth,
                                      height: MyBlock.horizontal(context, x: 8),
                                      decoration: BoxDecoration(color: Color(0xff65539E), borderRadius: BorderRadius.horizontal(left: Radius.circular(MyBlock.horizontal(context, x: 3)))),
                                      duration: Duration(milliseconds: 500),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (searchWidth != MyBlock.horizontal(context, x: 10)) {
                                                  searchWidth = MyBlock.horizontal(context, x: 10);
                                                } else {
                                                  searchWidth = MyBlock.horizontal(context, x: 80);
                                                }
                                              });
                                            },
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: MyBlock.horizontal(context),
                                                ),
                                                Icon(
                                                  Icons.search,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: MyBlock.horizontal(context),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                                height: MyBlock.horizontal(context, x: 5),
                                                child: TextField(
                                                  controller: searchEdit,
                                                  decoration: InputDecoration(border: InputBorder.none, fillColor: ThemeColors.white),
                                                  style: context.textTheme.bodyLarge,
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )))
                        : Container(),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TabBarView(children: [chats(), bulkMessage(), teachers()]),
                            )
                          ],
                        ),
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
                index: 2,
              ),
            ),
          )
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }

  Widget chats() {
    return ListView(
      padding: EdgeInsets.only(top: MyBlock.vertical(context, x: 1)),
      children: messages
          .map((e) => Padding(
                padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 1)),
                child: Column(
                  children: [
                    Container(
                      // direkt card widget ile sarmalama olayını sor uğur abiye.
                      // decoration: BoxDecoration(
                      //     color: Colors.white,
                      //     boxShadow: [
                      //       BoxShadow(
                      //           color: Colors.black26,
                      //           spreadRadius: 2,
                      //           blurRadius: 5)
                      //     ],
                      //     borderRadius: BorderRadius.circular(
                      //         MyBlock.horizontal(context, x: 3))),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Container(
                            // height: MyBlock.vertical(context, x: 8),
                            child: Card(
                              elevation: 0,
                              child: ListTile(
                                subtitle: Text(
                                  e["lastMessage"].toString(),
                                  style: context.textTheme.bodySmall,
                                ),
                                leading: Container(
                                    padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1)),
                                    decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xff6551A0)),
                                    child: Icon(Icons.person_rounded, color: ThemeColors.white, size: MyBlock.horizontal(context, x: 9))),
                                title: Text(e["name"].toString(), style: context.textTheme.bodyLarge),
                                onTap: () async {
                                  await resolve<AppRouter>().push(
                                    RouteMessageDetail(
                                      id: 5,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          GestureDetector(
                              onTap: () async {
                                setState(() {
                                  if (!(e["isCallOpen"] as bool)) {
                                    e["height"] = MyBlock.vertical(context, x: 8);
                                    e["width"] = MyBlock.horizontal(context, x: 100) - MyBlock.horizontal(context, x: 3);
                                  } else {
                                    e["height"] = MyBlock.horizontal(context, x: 9);
                                    e["width"] = MyBlock.horizontal(context, x: 9);
                                  }
                                });
                                if (!(e["isCallOpen"] as bool)) {
                                  await Future.delayed(Duration(milliseconds: 500));
                                }
                                setState(() {
                                  e["isCallOpen"] = !(e["isCallOpen"] as bool);
                                });
                              },
                              child: AnimatedContainer(
                                margin: EdgeInsets.only(right: MyBlock.vertical(context, x: 2)),
                                duration: Duration(milliseconds: 500),
                                height: e["height"] as double,
                                width: e["width"] as double,
                                decoration: BoxDecoration(
                                  color: Color(0xff6551A0),
                                  borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(
                                      MyBlock.horizontal(context, x: 3),
                                    ),
                                    right: Radius.circular(
                                      MyBlock.horizontal(context, x: 3),
                                    ),
                                  ),
                                ),
                                child: !(e["isCallOpen"] as bool)
                                    ? Icon(
                                        Icons.phone,
                                        color: Colors.white,
                                      )
                                    : Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Baba Telefonu Ara",
                                                    style: context.textTheme.bodySmall,
                                                  )),
                                              TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Anne Telefonu Ara",
                                                    style: context.textTheme.bodySmall,
                                                  )),
                                            ],
                                          ),
                                          Align(
                                              alignment: Alignment.centerRight,
                                              child: Icon(
                                                Icons.phone,
                                                color: Colors.white,
                                              ))
                                        ],
                                      ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MyBlock.vertical(context, x: 1),
                    )
                  ],
                ),
              ))
          .toList(),
    );
  }

  Widget bulkMessage() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 5)),
      child: Column(
        children: [
          SizedBox(
            height: MyBlock.vertical(context, x: 2),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2)),
            decoration: BoxDecoration(
                color: Colors.white, boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)], borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 10))),
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.all(MyBlock.horizontal(context, x: 2)),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xff6551A0)),
                    child: Icon(Icons.list, color: Colors.white, size: MyBlock.horizontal(context, x: 8))),
                SizedBox(width: MyBlock.horizontal(context, x: 5)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButton(
                          isExpanded: true,
                          style: context.textTheme.labelMedium,
                          onChanged: (value) {
                            setState(() {
                              pickedTarget = value.toString();
                            });
                          },
                          value: pickedTarget,
                          items: targetList.map((e) => DropdownMenuItem(value: e, child: Text(e.toString()))).toList()),
                      Text(
                        "Hedef Kitle",
                        style: context.textTheme.labelMedium,
                      )
                    ],
                  ),
                ),
                SizedBox(width: MyBlock.horizontal(context, x: 2)),
              ],
            ),
          ),
          SizedBox(
            height: MyBlock.vertical(context, x: 5),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 0.5)),
            decoration: BoxDecoration(
                color: Colors.white, boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)], borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 10))),
            child: Padding(
              padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.5)),
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1)),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xff6551A0)),
                      child: Icon(Icons.comment_outlined, color: ThemeColors.white, size: MyBlock.horizontal(context, x: 9))),
                  Expanded(
                      child: TextField(
                    style: context.textTheme.bodyMedium,
                    controller: commentEdit,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 3)),
                        labelText: "Mesajınızı Yazın",
                        labelStyle: context.textTheme.labelMedium,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  )),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MyBlock.vertical(context, x: 2),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2)),
                child: Text(
                  "Gönder",
                  style: context.textTheme.bodyLarge,
                ),
              ),
              style: ButtonStyle(
                  /*minimumSize: MaterialStateProperty.all(
                                  Size(double.maxFinite, 0)),*/
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
                  backgroundColor: MaterialStateProperty.all(Color(0xffF19BC3))),
            ),
          )
        ],
      ),
    );
  }

  Widget teachers() {
    return ListView(
      padding: EdgeInsets.only(top: MyBlock.vertical(context, x: 2)),
      children: teacherList
          .map((e) => Padding(
                padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 3)),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white, boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)], borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
                      child: ListTile(
                        leading: Container(
                            padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1)),
                            decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xff6551A0)),
                            child: Icon(Icons.person, color: Colors.white, size: MyBlock.horizontal(context, x: 9))),
                        title: Text(
                          e["name"].toString(),
                          style: context.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MyBlock.vertical(context, x: 2),
                    )
                  ],
                ),
              ))
          .toList(),
    );
  }
}
