// import 'package:flutter/material.dart';
// import 'package:kidszone_app/common/model/clipper.dart';
// import 'package:kidszone_app/views/_init/logger/logger_mixin.dart';
// import 'package:kidszone_app/views/_init/my_block.dart';
// import 'package:kidszone_app/views/registration/student/model/student_model.dart';

// import '../view_model/view_model_health.dart';



// // ignore: must_be_immutable
// class PageHealth extends StatefulWidget {
//   var vm = ViewModelHealth();
//   PageHealth({Key? key}) : super(key: key);

//   @override
//   _PageHealthState createState() => _PageHealthState();
// }

// class _PageHealthState extends State<PageHealth>with LoggerMixin {
//   Map<String, dynamic>? pickedKid;
//   List<Map<String, dynamic>>? pickedKidInfo = [];

//   bool filterActive = true;
//   bool filterPassive = false;

//   bool selected = true;

//   @override
//   void initState() {
//     super.initState();
//     widget.vm.getStudents();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         shadowColor: Colors.transparent,
//         title: Column(
//           children: [
//             Text("Sağlık İşlemleri"),
//           ],
//         ),
//         backgroundColor: Color(0xff65539E),
//       ),
//       body: Column(
//         children: [
//           Stack(
//             children: [
//               ClipPath(
//                 clipper: BottomClipper(myVal: MyBlock.horizontal(context, x: 6)),
//                 child: Container(
//                   width: double.maxFinite,
//                   height: MyBlock.horizontal(context, x: 12),
//                   decoration: BoxDecoration(
//                     color: Color(0xff65539E),
//                   ),
//                 ),
//               ),
//               Container(
//                 height: MyBlock.horizontal(context, x: 12),
//                 child: Center(
//                   child: Container(
//                     decoration: BoxDecoration(border: Border.all(color: Colors.white), color: Color(0xff65539E), borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
//                     padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.5)),
//                     child: Text(
//                       "23 Eylül 2020",
//                       style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.1), color: Colors.white),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: MyBlock.vertical(context, x: 0),
//                   ),
//                   Text(
//                     "Öğrenci Seçin",
//                     style: TextStyle(fontSize: MyBlock.vertical(context, x: 1.6), fontWeight: FontWeight.bold, color: Color(0xff6551A0)),
//                   ),
//                   SizedBox(
//                     height: MyBlock.vertical(context, x: 2),
//                   ),
//                   pickedKid == null
//                       ? Column(
//                           children: [
//                             Container(
//                               width: double.maxFinite,
//                               child: Center(
//                                 child: ToggleButtons(
//                                   constraints: BoxConstraints.tight(Size(MyBlock.horizontal(context, x: 45), MyBlock.vertical(context, x: 3))),
//                                   selectedColor: Color(0xff65539E),
//                                   color: Color(0xff65539E),
//                                   fillColor: Color(0xff65539E),
//                                   onPressed: (index) {
//                                     print("index= " + index.toString());
//                                     setState(() {
//                                       filterActive = !filterActive;
//                                       filterPassive = !filterPassive;
//                                     });
//                                   },
//                                   borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 10)),
//                                   isSelected: [filterActive, filterPassive],
//                                   children: ["Aktif", "Pasif"]
//                                       .map<Widget>((e) => Container(
//                                             width: MyBlock.horizontal(context, x: 40),
//                                             child: Center(
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: [
//                                                   Text(e,
//                                                       style: TextStyle(
//                                                           fontSize: MyBlock.vertical(context, x: 2),
//                                                           color: e == "Aktif" && filterActive
//                                                               ? Colors.white
//                                                               : e == "Pasif" && filterPassive
//                                                                   ? Colors.white
//                                                                   : Colors.black)),
//                                                   SizedBox(
//                                                     width: MyBlock.horizontal(context, x: 2),
//                                                   ),
//                                                   Container(
//                                                     width: MyBlock.vertical(context),
//                                                     height: MyBlock.vertical(context),
//                                                     decoration: BoxDecoration(shape: BoxShape.circle, color: e == "Aktif" ? Color(0xff08E10E) : Color(0xffE2231B)),
//                                                   )
//                                                 ],
//                                               ),
//                                             ),
//                                           ))
//                                       .toList(),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: MyBlock.vertical(context),
//                             ),
//                             GridView(
//                               physics: NeverScrollableScrollPhysics(),
//                               padding: EdgeInsets.only(
//                                   left: MyBlock.horizontal(context, x: 3), right: MyBlock.horizontal(context, x: 3), top: MyBlock.vertical(context, x: 1), bottom: MyBlock.vertical(context, x: 3)),
//                               shrinkWrap: true,
//                               gridDelegate:
//                                   SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: MyBlock.horizontal(context, x: 4), mainAxisSpacing: MyBlock.vertical(context, x: 4), crossAxisCount: 4),
//                               children: widget.vm.studentList.where((element) => element.active! == filterActive).map((e) => gridItem(e, context)).toList(),
//                             ),
//                           ],
//                         )
//                       : Padding(
//                           padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 3)),
//                           child: Container(
//                             width: double.maxFinite,
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)],
//                                 borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Align(
//                                       alignment: Alignment.centerLeft,
//                                       child: Column(
//                                         children: [
//                                           SizedBox(
//                                             height: MyBlock.vertical(context),
//                                           ),
//                                           Container(
//                                             decoration: BoxDecoration(
//                                                 boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 1, blurRadius: 3)],
//                                                 shape: BoxShape.circle,
//                                                 color: pickedKid!["gender"] == "female" ? Color(0xffF19BC3) : Color(0xff78C0FF)),
//                                             child: Padding(
//                                               padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.6)),
//                                               child: Icon(
//                                                 Icons.person_rounded,
//                                                 size: MyBlock.horizontal(context, x: 9),
//                                                 color: Colors.white,
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: MyBlock.vertical(context, x: 0.6),
//                                           ),
//                                           Container(
//                                             height: MyBlock.vertical(context, x: 3),
//                                             child: Padding(
//                                               padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2.2)),
//                                               child: FittedBox(
//                                                 fit: BoxFit.fitWidth,
//                                                 child: Text(
//                                                   pickedKid!["name"].toString(),
//                                                   style: TextStyle(fontWeight: FontWeight.w600, fontSize: MyBlock.horizontal(context, x: 3.2), color: Color(0xff6551A0)),
//                                                   textAlign: TextAlign.center,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: MyBlock.vertical(context),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: MyBlock.horizontal(context, x: 7),
//                                     ),
//                                     Expanded(
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         mainAxisSize: MainAxisSize.max,
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             "Bu Öğrencinin Kullandığı ${pickedKid!["pills"].length.toString()} İlaç Mevcut.",
//                                             style: TextStyle(fontWeight: FontWeight.w600, fontSize: MyBlock.horizontal(context, x: 3.2), color: Color(0xffF19BC3)),
//                                           ),
//                                           SizedBox(
//                                             height: MyBlock.vertical(context),
//                                           ),
//                                           Text(
//                                             "İlaç Başlama Tarihi: ${pickedKid!["dates"][0]["date"].toString()} - ${pickedKid!["dates"][0]["time"].toString()}",
//                                             style: TextStyle(fontWeight: FontWeight.w600, fontSize: MyBlock.horizontal(context, x: 3.2), color: Color(0xffF19BC3)),
//                                           ),
//                                           SizedBox(
//                                             height: MyBlock.vertical(context),
//                                           ),
//                                           Text(
//                                             "İlaç Bitiş Tarihi: ${pickedKid!["dates"][0]["date"].toString()} - ${pickedKid!["dates"][0]["time"].toString()}",
//                                             style: TextStyle(fontWeight: FontWeight.w600, fontSize: MyBlock.horizontal(context, x: 3.2), color: Color(0xffF19BC3)),
//                                           ),
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: MyBlock.vertical(context),
//                                 ),
//                                 pickedKid!["pills"].length != 0
//                                     ? Padding(
//                                         padding: EdgeInsets.symmetric(horizontal: 8.0),
//                                         child: SingleChildScrollView(
//                                           scrollDirection: Axis.horizontal,
//                                           child: Row(
//                                             children: pickedKid!["pills"].map<Widget>((e ) {
//                                               return Row(
//                                                 children: [
//                                                   Icon(
//                                                     Icons.medication,
//                                                     size: MyBlock.horizontal(context, x: 9),
//                                                     color: Color(0xff65539E),
//                                                   ),
//                                                   Text(
//                                                     e,
//                                                     style: TextStyle(fontSize: MyBlock.horizontal(context, x: 4.1), fontWeight: FontWeight.bold, color: Color(0xff65539E)),
//                                                   ),
//                                                   SizedBox(
//                                                     width: MyBlock.horizontal(context, x: 6),
//                                                   )
//                                                 ],
//                                               );
//                                             }).toList(),
//                                           ),
//                                         ),
//                                       )
//                                     : Container(),
//                                 SizedBox(
//                                   height: MyBlock.vertical(context, x: 3),
//                                 ),
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       flex: 2,
//                                       child: Center(
//                                         child: Text(
//                                           "Tarih",
//                                           style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.1), fontWeight: FontWeight.bold, color: Color(0xff65539E)),
//                                         ),
//                                       ),
//                                     ),
//                                     Expanded(
//                                       flex: 2,
//                                       child: Center(
//                                         child: Text(
//                                           "Saat",
//                                           style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.1), fontWeight: FontWeight.bold, color: Color(0xff65539E)),
//                                         ),
//                                       ),
//                                     ),
//                                     Expanded(
//                                       flex: 2,
//                                       child: Center(
//                                         child: Text(
//                                           "Aldı/Almadı",
//                                           style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.1), fontWeight: FontWeight.bold, color: Color(0xff65539E)),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                                 ListView(
//                                   physics: NeverScrollableScrollPhysics(),
//                                   shrinkWrap: true,
//                                   children: pickedKid!["dates"].map<Widget>((e) {
//                                     return Column(
//                                       children: [
//                                         Divider(
//                                           indent: 5,
//                                           endIndent: 5,
//                                         ),
//                                         Row(
//                                           children: [
//                                             Expanded(
//                                               flex: 2,
//                                               child: Center(
//                                                 child: Text(
//                                                   e["date"],
//                                                   style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.1), fontWeight: FontWeight.bold, color: Color(0xff65539E)),
//                                                 ),
//                                               ),
//                                             ),
//                                             Expanded(
//                                               flex: 2,
//                                               child: Center(
//                                                 child: Text(
//                                                   e["time"],
//                                                   style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.1), fontWeight: FontWeight.bold, color: Color(0xff65539E)),
//                                                 ),
//                                               ),
//                                             ),
//                                             Expanded(
//                                               flex: 2,
//                                               child: Center(
//                                                   child: e["status"]
//                                                       ? Icon(
//                                                           Icons.done_all_rounded,
//                                                           color: Color(0xff08E10E),
//                                                           size: MyBlock.horizontal(context, x: 6),
//                                                         )
//                                                       : Icon(
//                                                           Icons.clear,
//                                                           color: Color(0xffCB3E3B),
//                                                           size: MyBlock.horizontal(context, x: 6),
//                                                         )),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     );
//                                   }).toList(),
//                                 )
//                               ],
//                             ),
//                           ),
//                         )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   GestureDetector gridItem(StudentModel item, BuildContext context) {
//     String kidsName = item.nameSurname ?? '';
//     if (!kidsName.contains("\n")) {
//       String kidsLastName = kidsName.split(" ").last;
//       item.nameSurname = kidsName.replaceFirst(kidsLastName, "\n" + kidsLastName);
//     }
//     return GestureDetector(
//       onTap: () {
//         widget.vm.selectedStudent = item;
//         assert(pickedKid!["info"] is List);
//         setState(() {
//           pickedKidInfo = pickedKid!["info"];
//         });
//       },
//       child: Wrap(
//         children: [
//           Stack(
//             alignment: Alignment.topRight,
//             children: [
//               Column(
//                 children: [
//                   SizedBox(
//                     height: MyBlock.vertical(context, x: 1),
//                   ),
//                   Container(
//                     width: double.maxFinite,
//                     decoration: BoxDecoration(
//                         color: Colors.white, boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)], borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: MyBlock.vertical(context),
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                               boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 1, blurRadius: 3)], shape: BoxShape.circle, color: item.gender == 2 ? Color(0xffF19BC3) : Color(0xff78C0FF)),
//                           child: Padding(
//                             padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.6)),
//                             child: Icon(
//                               Icons.person_rounded,
//                               size: MyBlock.horizontal(context, x: 9),
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: MyBlock.vertical(context, x: 0.6),
//                         ),
//                         Container(
//                           height: MyBlock.vertical(context, x: 3),
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2.2)),
//                             child: FittedBox(
//                               fit: BoxFit.fitWidth,
//                               child: Text(
//                                 item.nameSurname ?? '',
//                                 style: TextStyle(fontWeight: FontWeight.w600, fontSize: MyBlock.horizontal(context, x: 3.2), color: Color(0xff6551A0)),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: MyBlock.vertical(context),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               Align(
//                 alignment: Alignment.topRight,
//                 child: Container(
//                   width: MyBlock.vertical(context, x: 2),
//                   height: MyBlock.vertical(context, x: 2),
//                   decoration: BoxDecoration(shape: BoxShape.circle, color: filterActive ? Color(0xff08E10E) : Color(0xffE2231B)),
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
