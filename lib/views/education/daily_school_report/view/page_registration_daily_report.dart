// // import 'package:animated_styled_widget/animated_styled_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:kidszone_app/common/utils/translate.dart';
// import 'package:kidszone_app/views/_init/my_block.dart';
// import 'package:kidszone_app/common/model/clipper.dart';

// import 'package:kidszone_app/views/education/daily_school_report/viewmodel/view_model_daily_report_template.dart';
// import 'package:kidszone_app/views/education/daily_school_report/model/daily_report_template_detail_model.dart';
// import 'package:kidszone_app/views/registration/student/model/student_model.dart';

// import '../model/reports.dart';
// import '../viewmodel/view_model_daily_report_x.dart';

// // ignore: must_be_immutable
// class PageRegistrationDailyReport extends StatefulWidget {
//   final String title = "Günlük Karne";
//   final String subTitle = "Günlük Karne";
//   // ignore: unused_field
//   final _formKey = GlobalKey<FormState>();
//   int? classroomId;
//   var vm = ViewModelDailyReportX();
//   var vmTemplate = ViewModelDailyReportTemplate();

//   PageRegistrationDailyReport({
//     Key? key,
//     this.classroomId,
//   }) : super(key: key);

//   @override
//   _PageRegistrationDailyReportState createState() => _PageRegistrationDailyReportState();
// }

// class _PageRegistrationDailyReportState extends State<PageRegistrationDailyReport> {
//   List studentList = List.generate(100, (index) => "Ahsen Baştimur ${index + 1}");

//   @override
//   void initState() {
//     super.initState();
//     widget.vm.upload();
//   }

//   @override
//   Widget build(BuildContext context) {
//     widget.vm.upload();
//     return Scaffold(
//       floatingActionButton: Padding(
//         padding: EdgeInsets.only(bottom: MyBlock.vertical(context, x: 12)),
//         child: FloatingActionButton(backgroundColor: Color(0xff65539E), child: Icon(Icons.menu), onPressed: () => floatingModal()),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         shadowColor: Colors.transparent,
//         title: Column(
//           children: [
//             Text(
//               lang("Günlük Karne Düzenle"),
//             ),
//             Text(
//               //!eklenecekler sınıf başlığı eklenecek
//               "3/A sınıfının günlük karne formunu değiştir",
//               style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3), color: Colors.white60),
//             ),
//           ],
//         ),
//         backgroundColor: Color(0xff65539E),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.more_vert_rounded),
//             onPressed: () => menuDialog(),
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Column(
//               children: [
//                 Stack(
//                   children: [
//                     ClipPath(
//                       clipper: BottomClipper(myVal: MyBlock.horizontal(context, x: 6)),
//                       child: Container(
//                         width: double.maxFinite,
//                         height: MyBlock.horizontal(context, x: 12),
//                         decoration: BoxDecoration(
//                           color: Color(0xff65539E),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       height: MyBlock.horizontal(context, x: 12),
//                       child: Center(
//                         child: Container(
//                           decoration: BoxDecoration(border: Border.all(color: Colors.white), color: Color(0xff65539E), borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
//                           padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.5)),
//                           child: Text(
//                             "23 Eylül 2020",
//                             style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.1), color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Padding(
//                       padding: EdgeInsets.only(bottom: MyBlock.vertical(context, x: 12)),
//                       child: Column(
//                         children: [
//                           Observer(builder: (_) {
//                             return SingleChildScrollView(
//                                 scrollDirection: Axis.horizontal,
//                                 child: Row(
//                                   children: widget.vm.studentList.map((item) => studentsList((widget.vm.studentList.first.id == item.id || widget.vm.selectedStudent != null), item)).toList(),
//                                 ));
//                           }),
//                           SizedBox(
//                             height: MyBlock.vertical(context),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 3)),
//                             child: teacherNote(context),
//                           ),
//                           SizedBox(
//                             height: MyBlock.vertical(context),
//                           ),
//                           Stack(
//                             children: [
//                               Column(
//                                 children: [
//                                   SizedBox(
//                                     height: MyBlock.vertical(context, x: 2.5),
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 3)),
//                                     child: Container(
//                                       padding: EdgeInsets.all(MyBlock.horizontal(context, x: 2)),
//                                       decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)],
//                                           borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 7))),
//                                       child: Column(
//                                         children: dailyReport(),
//                                         // [
//                                         // ,
//                                         //   SizedBox(
//                                         //     height: MyBlock.vertical(context),
//                                         //   ),
//                                         //   //  lunch(),
//                                         //   SizedBox(
//                                         //     height: MyBlock.vertical(context),
//                                         //   ),
//                                         //   //  dinner(),
//                                         //   SizedBox(
//                                         //     height: MyBlock.vertical(context),
//                                         //   ),
//                                         //   //  sleep(),
//                                         // ],
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               Container(
//                                 height: MyBlock.vertical(context, x: 5),
//                                 child: Center(
//                                   child: Container(
//                                     decoration:
//                                         BoxDecoration(border: Border.all(color: Color(0xff65539E)), color: Colors.white, borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
//                                     padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.5)),
//                                     child: Text(
//                                       lang("Günlük Karnesi"),
//                                       style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.1), color: Color(0xff65539E)),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: MyBlock.vertical(context),
//                           ),
//                           Stack(
//                             children: [
//                               Column(
//                                 children: [
//                                   SizedBox(
//                                     height: MyBlock.vertical(context, x: 2.5),
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 3)),
//                                     child: Container(
//                                       padding: EdgeInsets.all(MyBlock.horizontal(context, x: 2)),
//                                       decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)],
//                                           borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 7))),
//                                       child: Column(
//                                         children: educationReport(),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               Container(
//                                 height: MyBlock.vertical(context, x: 5),
//                                 child: Center(
//                                   child: Container(
//                                     decoration:
//                                         BoxDecoration(border: Border.all(color: Color(0xff65539E)), color: Colors.white, borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
//                                     padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.5)),
//                                     child: Text(
//                                       lang("Eğitim Karnesi"),
//                                       style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.1), color: Color(0xff65539E)),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Row teacherNote(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Card(
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(MyBlock.horizontal(context, x: 10)), right: Radius.circular(MyBlock.horizontal(context, x: 5)))),
//             elevation: 3,
//             child: Padding(
//               padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.5)),
//               child: Row(
//                 children: [
//                   Container(
//                       padding: EdgeInsets.all(MyBlock.horizontal(context, x: 2)),
//                       decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xff6551A0)),
//                       child: Icon(Icons.comment_outlined, color: Colors.white, size: MyBlock.horizontal(context, x: 8))),
//                   Expanded(
//                       child: TextField(
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: MyBlock.vertical(context, x: 2)),
//                     controller: widget.vm.teacherNote,
//                     decoration: InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 3)),
//                         labelText: lang("Öğretmen Notu"),
//                         labelStyle: TextStyle(color: Colors.black54, fontSize: MyBlock.vertical(context, x: 1.7)),
//                         border: InputBorder.none,
//                         focusedBorder: InputBorder.none),
//                   ))
//                 ],
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           width: MyBlock.horizontal(context, x: 3),
//         ),
//         GestureDetector(
//           onTap: () => textDialog(),
//           child: Container(
//               padding: EdgeInsets.all(MyBlock.horizontal(context, x: 2)),
//               decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)], shape: BoxShape.circle, color: Colors.white),
//               child: Icon(Icons.list, color: Color(0xff6551A0), size: MyBlock.horizontal(context, x: 10))),
//         ),
//       ],
//     );
//   }

//   floatingModal() {
//     showModalBottomSheet(
//         context: context,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(MyBlock.horizontal(context, x: 6)))),
//         builder: (context) {
//           return SafeArea(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SizedBox(
//                   height: MyBlock.vertical(context, x: 1.5),
//                 ),
//                 Text(
//                   "Yapmak İstediğiniz İşlemi Seçiniz.",
//                   style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.4), fontWeight: FontWeight.w600, color: Color(0xff65539E)),
//                 ),
//                 SizedBox(
//                   height: MyBlock.vertical(context, x: 1),
//                 ),
//                 Divider(
//                   endIndent: MyBlock.horizontal(context, x: 6),
//                   indent: MyBlock.horizontal(context, x: 6),
//                   height: 0.5,
//                 ),
//                 SizedBox(
//                   height: MyBlock.vertical(context, x: 1),
//                 ),
//                 GestureDetector(
//                   onTap: () => Navigator.pop(context),
//                   child: Container(
//                     width: double.maxFinite,
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         SizedBox(
//                           width: MyBlock.horizontal(context, x: 16),
//                         ),
//                         Icon(Icons.save, color: Color(0xff6551A0), size: MyBlock.horizontal(context, x: 10)),
//                         SizedBox(
//                           width: MyBlock.horizontal(context, x: 4),
//                         ),
//                         Text(
//                           "Girilen Bilgileri Kaydet",
//                           style: TextStyle(fontSize: MyBlock.horizontal(context, x: 4), fontWeight: FontWeight.w600, color: Color(0xff65539E)),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: MyBlock.vertical(context, x: 1),
//                 ),
//                 Divider(
//                   endIndent: MyBlock.horizontal(context, x: 6),
//                   indent: MyBlock.horizontal(context, x: 6),
//                   height: 0.5,
//                 ),
//                 SizedBox(
//                   height: MyBlock.vertical(context, x: 1),
//                 ),
//                 GestureDetector(
//                   onTap: () => Navigator.pop(context),
//                   child: Container(
//                     width: double.maxFinite,
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         SizedBox(
//                           width: MyBlock.horizontal(context, x: 16),
//                         ),
//                         Icon(Icons.send, color: Color(0xff6551A0), size: MyBlock.horizontal(context, x: 10)),
//                         SizedBox(
//                           width: MyBlock.horizontal(context, x: 4),
//                         ),
//                         Text(
//                           "Veliye Gönder",
//                           style: TextStyle(fontSize: MyBlock.horizontal(context, x: 4), fontWeight: FontWeight.w600, color: Color(0xff65539E)),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: MyBlock.vertical(context, x: 1),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 16)),
//                   child: TextButton(
//                     onPressed: () => Navigator.pop(context),
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2)),
//                       child: Text(
//                         "Vazgeç",
//                         style: TextStyle(fontSize: MyBlock.horizontal(context, x: 5), fontWeight: FontWeight.w600, color: Colors.white),
//                       ),
//                     ),
//                     style: ButtonStyle(
//                         minimumSize: MaterialStateProperty.all(Size(double.maxFinite, 0)),
//                         shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
//                         backgroundColor: MaterialStateProperty.all(Color(0xff65539E))),
//                   ),
//                 ),
//                 SizedBox(
//                   height: MyBlock.vertical(context, x: 1),
//                 ),
//               ],
//             ),
//           );
//         });
//   }

//   textDialog() {
//     showModalBottomSheet(
//         context: context,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(MyBlock.horizontal(context, x: 6)))),
//         builder: (context) {
//           return SafeArea(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SizedBox(
//                   height: MyBlock.vertical(context, x: 1.5),
//                 ),
//                 Text(
//                   "Metin Listeniz",
//                   style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.4), fontWeight: FontWeight.w600, color: Color(0xff65539E)),
//                 ),
//                 SizedBox(
//                   height: MyBlock.vertical(context, x: 3),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 6)),
//                   child: Text(
//                     "Buraya yazdığınız metinler daha sonra kolayca kullanabilmeniz için kısayol oluşturulacaktır.",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3), color: Colors.black54),
//                   ),
//                 ),
//                 SizedBox(
//                   height: MyBlock.vertical(context, x: 2),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 16)),
//                   child: TextButton(
//                     onPressed: () => Navigator.pop(context),
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2)),
//                       child: Text(
//                         "Vazgeç",
//                         style: TextStyle(fontSize: MyBlock.horizontal(context, x: 5), fontWeight: FontWeight.w600, color: Colors.white),
//                       ),
//                     ),
//                     style: ButtonStyle(
//                         minimumSize: MaterialStateProperty.all(Size(double.maxFinite, 0)),
//                         shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
//                         backgroundColor: MaterialStateProperty.all(Color(0xff65539E))),
//                   ),
//                 ),
//                 SizedBox(
//                   height: MyBlock.vertical(context, x: 1),
//                 ),
//               ],
//             ),
//           );
//         });
//   }

//   menuDialog() {
//     showModalBottomSheet(
//         context: context,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(MyBlock.horizontal(context, x: 6)))),
//         builder: (context) {
//           return SafeArea(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SizedBox(
//                   height: MyBlock.vertical(context, x: 1.5),
//                 ),
//                 Text(
//                   "Yapmak İstediğiniz İşlemi Seçiniz.",
//                   style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.4), fontWeight: FontWeight.w600, color: Color(0xff65539E)),
//                 ),
//                 SizedBox(
//                   height: MyBlock.vertical(context, x: 1),
//                 ),
//                 Divider(
//                   endIndent: MyBlock.horizontal(context, x: 6),
//                   indent: MyBlock.horizontal(context, x: 6),
//                   height: 0.5,
//                 ),
//                 SizedBox(
//                   height: MyBlock.vertical(context, x: 1),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                     editReportDialog();
//                   },
//                   child: Container(
//                     width: double.maxFinite,
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         SizedBox(
//                           width: MyBlock.horizontal(context, x: 16),
//                         ),
//                         Icon(Icons.edit, color: Color(0xff6551A0), size: MyBlock.horizontal(context, x: 10)),
//                         SizedBox(
//                           width: MyBlock.horizontal(context, x: 4),
//                         ),
//                         Text(
//                           "Karneyi Düzenle",
//                           style: TextStyle(fontSize: MyBlock.horizontal(context, x: 4), fontWeight: FontWeight.w600, color: Color(0xff65539E)),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: MyBlock.vertical(context, x: 1),
//                 ),
//                 Divider(
//                   endIndent: MyBlock.horizontal(context, x: 6),
//                   indent: MyBlock.horizontal(context, x: 6),
//                   height: 0.5,
//                 ),
//                 SizedBox(
//                   height: MyBlock.vertical(context, x: 1),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                     savedStudentsDialog();
//                   },
//                   child: Container(
//                     width: double.maxFinite,
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         SizedBox(
//                           width: MyBlock.horizontal(context, x: 16),
//                         ),
//                         Icon(Icons.list, color: Color(0xff6551A0), size: MyBlock.horizontal(context, x: 10)),
//                         SizedBox(
//                           width: MyBlock.horizontal(context, x: 4),
//                         ),
//                         Expanded(
//                           child: Text(
//                             "Günlük Kaydedilen Öğrenci Listesi",
//                             style: TextStyle(fontSize: MyBlock.horizontal(context, x: 4), fontWeight: FontWeight.w600, color: Color(0xff65539E)),
//                           ),
//                         ),
//                         SizedBox(
//                           width: MyBlock.horizontal(context, x: 3),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: MyBlock.vertical(context, x: 1),
//                 ),
//                 Divider(
//                   endIndent: MyBlock.horizontal(context, x: 6),
//                   indent: MyBlock.horizontal(context, x: 6),
//                   height: 0.5,
//                 ),
//                 SizedBox(
//                   height: MyBlock.vertical(context, x: 1),
//                 ),
//                 GestureDetector(
//                   onTap: () => Navigator.pop(context),
//                   child: Container(
//                     width: double.maxFinite,
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         SizedBox(
//                           width: MyBlock.horizontal(context, x: 16),
//                         ),
//                         Icon(Icons.fastfood_outlined, color: Color(0xff6551A0), size: MyBlock.horizontal(context, x: 10)),
//                         SizedBox(
//                           width: MyBlock.horizontal(context, x: 4),
//                         ),
//                         Expanded(
//                           child: Text(
//                             "Günün Yemeklerini Listeye Ekle",
//                             style: TextStyle(fontSize: MyBlock.horizontal(context, x: 4), fontWeight: FontWeight.w600, color: Color(0xff65539E)),
//                           ),
//                         ),
//                         SizedBox(
//                           width: MyBlock.horizontal(context, x: 3),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: MyBlock.vertical(context, x: 1),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 16)),
//                   child: TextButton(
//                     onPressed: () => Navigator.pop(context),
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2)),
//                       child: Text(
//                         "Vazgeç",
//                         style: TextStyle(fontSize: MyBlock.horizontal(context, x: 5), fontWeight: FontWeight.w600, color: Colors.white),
//                       ),
//                     ),
//                     style: ButtonStyle(
//                         minimumSize: MaterialStateProperty.all(Size(double.maxFinite, 0)),
//                         shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
//                         backgroundColor: MaterialStateProperty.all(Color(0xff65539E))),
//                   ),
//                 ),
//                 SizedBox(
//                   height: MyBlock.vertical(context, x: 1),
//                 ),
//               ],
//             ),
//           );
//         });
//   }

//   savedStudentsDialog() {
//     showModalBottomSheet(
//         context: context,
//         isScrollControlled: true,
//         backgroundColor: Colors.transparent,
//         builder: (context) {
//           return DraggableScrollableSheet(
//             initialChildSize: 1,
//             maxChildSize: 1,
//             minChildSize: 1,
//             expand: true,
//             builder: (BuildContext context, ScrollController scrollController) {
//               return Column(
//                 children: [
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () => Navigator.pop(context),
//                       child: Container(
//                         color: Colors.transparent,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: MyBlock.vertical(context, x: 70),
//                     decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(MyBlock.horizontal(context, x: 6)))),
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 5)),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           SizedBox(
//                             height: MyBlock.vertical(context, x: 1.5),
//                           ),
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   "Günlük Kaydedilen Öğrenci Listesi 24-09-2021",
//                                   style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3), color: Colors.black54),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: MyBlock.horizontal(context, x: 2),
//                               ),
//                               Text(
//                                 "0/" + studentList.length.toString(),
//                                 style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.2), color: Colors.black),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: MyBlock.vertical(context, x: 1),
//                           ),
//                           Expanded(
//                               child: ListView(
//                             shrinkWrap: true,
//                             children: studentList
//                                 .map((e) => ListTile(
//                                       title: Text(e),
//                                       trailing: Icon(
//                                         Icons.done_all,
//                                         color: e == studentList[0] ? Color(0xff1988E9) : Color(0xffD1D1D1),
//                                       ),
//                                     ))
//                                 .toList(),
//                           ))
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           );
//         });
//   }

//   editReportDialog() {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) {
//         return StatefulBuilder(builder: (context, setState) {
//           return DraggableScrollableSheet(
//             initialChildSize: 1,
//             maxChildSize: 1,
//             minChildSize: 1,
//             expand: true,
//             builder: (BuildContext context, ScrollController scrollController) {
//               return Column(
//                 children: [
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () => Navigator.pop(context),
//                       child: Container(
//                         color: Colors.transparent,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: MyBlock.vertical(context, x: 90),
//                     decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(MyBlock.horizontal(context, x: 6)))),
//                     child: ListView(
//                       shrinkWrap: true,
//                       children: widget.vm.templateModel!.details!.map((e) => editReportItem(context, setState, e)).toList(), //newKarne.map((e) => editKarneItem(context, setState, e)).toList(),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           );
//         });
//       },
//     );
//   }

//   Widget editReportItem(BuildContext context, StateSetter setState, DailyReportTemplateDetailModel value) {
//     return Stack(
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 4)),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: MyBlock.vertical(context, x: 4),
//               ),
//               Container(
//                 padding: EdgeInsets.all(MyBlock.horizontal(context, x: 3)),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)],
//                   borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3)),
//                 ),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: MyBlock.vertical(context, x: 1),
//                     ),
//                     Container(
//                       height: MyBlock.horizontal(context, x: 7),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           buttonDailyEducation(setState, value, context),
//                           buttonOptionsWritten(setState, value, context),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: MyBlock.vertical(context, x: 1),
//                     ),
//                     textEditHeader(context, value),
//                     if (value.contentType == ContentType.haveOptions) multiAddListOption(context, setState, value) else Container(),
//                     value.contentType == ContentType.haveOptions && (value.options!.any((element) => true))
//                         ? Column(
//                             children: [
//                               SizedBox(
//                                 height: MyBlock.vertical(context, x: 1),
//                               ),
//                               RichText(
//                                 text: TextSpan(
//                                   children: value.options!
//                                       .map<InlineSpan>((addedValue) => WidgetSpan(
//                                               child: GestureDetector(
//                                             onTap: () {
//                                               setState(() {
//                                                 value.options!.remove(addedValue);
//                                               });
//                                             },
//                                             child: Padding(
//                                               padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1)),
//                                               child: Container(
//                                                 padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1)),
//                                                 decoration: BoxDecoration(
//                                                   color: Color(0xff65539E),
//                                                   borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 1)),
//                                                 ),
//                                                 child: Row(
//                                                   mainAxisSize: MainAxisSize.min,
//                                                   children: [
//                                                     Text(addedValue! + " ", style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3), color: Colors.white)),
//                                                     Icon(
//                                                       Icons.clear,
//                                                       size: MyBlock.horizontal(context, x: 3),
//                                                       color: Colors.white,
//                                                     )
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           )))
//                                       .toList(),
//                                 ),
//                               ),
//                             ],
//                           )
//                         : Container()
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Center(
//           child: Container(
//             height: MyBlock.vertical(context, x: 8),
//             width: MyBlock.horizontal(context, x: 80),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 value != widget.vm.templateModel!.details!.last
//                     ? GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             int newInt = widget.vm.templateModel!.details!.indexOf(value) + 1;
//                             value.rowNumber = newInt;
//                             widget.vm.templateModel!.details!.remove(value);
//                             widget.vm.templateModel!.details!.insert(newInt, value);
//                           });
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(color: Color(0xff65539E), shape: BoxShape.circle),
//                           padding: EdgeInsets.all(MyBlock.horizontal(context, x: 2)),
//                           child: Icon(
//                             Icons.arrow_downward_rounded,
//                             size: MyBlock.vertical(context, x: 1.4),
//                             color: Colors.white,
//                           ),
//                         ))
//                     : Container(
//                         decoration: BoxDecoration(color: Color(0xff969696), shape: BoxShape.circle),
//                         padding: EdgeInsets.all(MyBlock.horizontal(context, x: 2)),
//                         child: Icon(
//                           Icons.arrow_downward_rounded,
//                           size: MyBlock.vertical(context, x: 1.4),
//                           color: Colors.white.withOpacity(0.8),
//                         ),
//                       ),
//                 Container(
//                   decoration: BoxDecoration(color: Color(0xff65539E), shape: BoxShape.circle),
//                   padding: EdgeInsets.all(MyBlock.horizontal(context, x: 2)),
//                   child: Text(
//                     value.rowNumber.toString(),
//                     style: TextStyle(fontSize: MyBlock.vertical(context, x: 2), color: Colors.white, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 value != widget.vm.model!.reports!.first
//                     ? GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             int newInt = widget.vm.templateModel!.details!.indexOf(value) - 1;
//                             widget.vm.templateModel!.details!.remove(value);
//                             widget.vm.templateModel!.details!.insert(newInt, value);
//                           });
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(color: Color(0xff65539E), shape: BoxShape.circle),
//                           padding: EdgeInsets.all(MyBlock.horizontal(context, x: 2)),
//                           child: Icon(
//                             Icons.arrow_upward_rounded,
//                             size: MyBlock.vertical(context, x: 1.4),
//                             color: Colors.white,
//                           ),
//                         ))
//                     : Container(
//                         decoration: BoxDecoration(color: Color(0xff969696), shape: BoxShape.circle),
//                         padding: EdgeInsets.all(MyBlock.horizontal(context, x: 2)),
//                         child: Icon(
//                           Icons.arrow_upward_rounded,
//                           size: MyBlock.vertical(context, x: 1.4),
//                           color: Colors.white.withOpacity(0.8),
//                         ),
//                       ),
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }

//   Observer multiAddListOption(BuildContext context, StateSetter setState, DailyReportTemplateDetailModel item) {
//     return Observer(
//       builder: (_) {
//         return Column(
//           children: [
//             SizedBox(
//               height: MyBlock.vertical(context, x: 1),
//             ),
//             TextField(
//               decoration: InputDecoration(
//                   hintText: lang("Seçenek"),
//                   suffixIcon: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           item.contentType = ContentType.haveOptions;
//                         });
//                       },
//                       child: Icon(Icons.add)),
//                   prefixIcon: Icon(
//                     Icons.widgets_outlined,
//                     color: Color(0xff65539E),
//                   ),
//                   contentPadding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2)),
//                   focusedBorder: OutlineInputBorder(gapPadding: 0, borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 1.5))),
//                   border: OutlineInputBorder(gapPadding: 0, borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 1.5)))),
//               onSubmitted: (value) => {
//                 item.options!.add(value),
//               },
//               //controller: value["optController"],
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Observer textEditHeader(BuildContext context, DailyReportTemplateDetailModel item) {
//     return Observer(builder: (_) {
//       return TextField(
//         decoration: InputDecoration(
//             hintText: lang("Başlık"),
//             prefixIcon: Icon(
//               Icons.info_outline_rounded,
//               color: Color(0xff65539E),
//             ),
//             contentPadding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2)),
//             focusedBorder: OutlineInputBorder(gapPadding: 0, borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 1.5))),
//             border: OutlineInputBorder(gapPadding: 0, borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 1.5)))),
//         onChanged: (value) => {
//           item.title = value.toString(),
//         },
//         //  controller: value["editingController"],
//       );
//     });
//   }

//   Observer buttonOptionsWritten(StateSetter setState, DailyReportTemplateDetailModel value, BuildContext context) {
//     return Observer(builder: (_) {
//       return ToggleButtons(
//           selectedColor: Color(0xff65539E),
//           color: Color(0xff65539E),
//           fillColor: Color(0xff65539E),
//           onPressed: (index) {
//             print("index= " + index.toString());
//             setState(() {
//               //?Seçenekli
//               if (index == 0) {
//                 value.contentType = ContentType.haveOptions;
//               }
//               //?Yazılı
//               else if (index == 1) {
//                 value.contentType = ContentType.haveWritten;
//               }
//             });
//           },
//           borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 1.5)),
//           isSelected: [
//             //
//           ],
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2)),
//               child: Text('Seçenekli', style: TextStyle(fontSize: MyBlock.vertical(context, x: 2), color: value.contentType == ContentType.haveOptions ? Colors.white : Colors.black)),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2)),
//               child: Text('Yazılı', style: TextStyle(fontSize: MyBlock.vertical(context, x: 2), color: value.contentType == ContentType.haveWritten ? Colors.white : Colors.black)),
//             ),
//           ]);
//     });
//   }

//   Observer buttonDailyEducation(StateSetter setState, DailyReportTemplateDetailModel value, BuildContext context) {
//     return Observer(builder: (_) {
//       return ToggleButtons(
//         selectedColor: Color(0xff65539E),
//         color: Color(0xff65539E),
//         fillColor: Color(0xff65539E),
//         onPressed: (index) {
//           setState(() {
//             //?Günlük
//             if (index == 0) {
//               value.reportType = ReportType.daily;
//             }
//             //?eğitim
//             else if (index == 1) {
//               value.reportType = ReportType.education;
//             }
//           });
//         },
//         borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 1.5)),
//         isSelected: [
//           //value.karneTipi = KarneTipi.gunluk;
//         ],
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2)),
//             child: Text('Günlük', style: TextStyle(fontSize: MyBlock.vertical(context, x: 2), color: value.reportType == ReportType.daily ? Colors.white : Colors.black)),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2)),
//             child: Text('Eğitim', style: TextStyle(fontSize: MyBlock.vertical(context, x: 2), color: value.reportType == ReportType.education ? Colors.white : Colors.black)),
//           ),
//         ],
//       );
//     });
//   }

//   List<Widget> dailyReport() {
//     var list = <Widget>[];
//     for (var item in widget.vm.model!.reports!.where((m) => m.reportType == ReportType.daily).toList()) {
//       var haveOptionAndText;
//       if (item.contentType == ContentType.haveOptions) {
//         var optionItems = (item.options ?? <String>[]);
//         haveOptionAndText = DropdownButton(
//           isExpanded: true,
//           style: TextStyle(fontSize: MyBlock.vertical(context, x: 1.7), color: Color(0xff6551A0), fontWeight: FontWeight.bold),
//           onChanged: (value) {
//             setState(() {
//               item.value = value.toString();
//             });
//           },
//           value: item.value,
//           items: optionItems.map((e) => DropdownMenuItem(value: e, child: Text(e!))).toList(),
//         );
//         list.add(
//           Row(
//             children: [
//               Container(
//                   padding: EdgeInsets.all(MyBlock.horizontal(context, x: 2)),
//                   decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xff6551A0)),
//                   child: Icon(Icons.breakfast_dining_rounded, color: Colors.white, size: MyBlock.horizontal(context, x: 8))),
//               SizedBox(width: MyBlock.horizontal(context, x: 5)),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     haveOptionAndText,
//                     Text(item.title ?? '', style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3), color: Colors.black54)),
//                   ],
//                 ),
//               ),
//               SizedBox(width: MyBlock.horizontal(context, x: 2)),
//               SizedBox(
//                 height: MyBlock.vertical(context),
//               ),
//             ],
//           ),
//         );
//       } else {
//         haveOptionAndText = Expanded(
//           child: Card(
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(MyBlock.horizontal(context, x: 10)), right: Radius.circular(MyBlock.horizontal(context, x: 5)))),
//             elevation: 3,
//             child: Padding(
//               padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.5)),
//               child: Row(
//                 children: [
//                   Container(
//                       padding: EdgeInsets.all(MyBlock.horizontal(context, x: 2)),
//                       decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xff6551A0)),
//                       child: Icon(Icons.comment_outlined, color: Colors.white, size: MyBlock.horizontal(context, x: 8))),
//                   Expanded(
//                       child: TextField(
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: MyBlock.vertical(context, x: 2)),
//                     //!  controller: widget.vm.ogretmenNotu,
//                     decoration: InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 3)),
//                         labelText: lang(item.title ?? ''),
//                         labelStyle: TextStyle(color: Colors.black54, fontSize: MyBlock.vertical(context, x: 1.7)),
//                         border: InputBorder.none,
//                         focusedBorder: InputBorder.none),
//                     onChanged: (value) => {
//                       item.value = value.toString(),
//                     },
//                   ))
//                 ],
//               ),
//             ),
//           ),
//         );

//         list.add(
//           Row(
//             children: [haveOptionAndText],
//           ),
//         );
//       }
//     }
//     return list;
//   }

//   void setValueDailyReport(Reports item, Object? value) {
//     setState(() {
//       item.value = value.toString();
//       var entity = widget.vm.model!.reports!.firstWhere((element) => element.id == item.id);
//       entity.value = value.toString();
//     });
//   }

//   List<Widget> educationReport() {
//     var list = <Widget>[];
//     for (var item in widget.vm.model!.reports!) {
//       var secenekliAndText;
//       if (item.contentType == ContentType.haveOptions && item.options!.any((element) => true)) {
//         var secenekItems = item.options!;
//         secenekliAndText = DropdownButton(
//           isExpanded: true,
//           style: TextStyle(fontSize: MyBlock.vertical(context, x: 1.7), color: Color(0xff6551A0), fontWeight: FontWeight.bold),
//           onChanged: (value) {
//             setState(() {
//               item.value = value.toString();
//             });
//           },
//           value: item.value,
//           items: secenekItems.map((e) => DropdownMenuItem(value: e, child: Text(e!))).toList(),
//         );
//         list.add(
//           Row(
//             children: [
//               Container(
//                   padding: EdgeInsets.all(MyBlock.horizontal(context, x: 2)),
//                   decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xff6551A0)),
//                   child: Icon(Icons.breakfast_dining_rounded, color: Colors.white, size: MyBlock.horizontal(context, x: 8))),
//               SizedBox(width: MyBlock.horizontal(context, x: 5)),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     secenekliAndText,
//                     Text(item.title ?? '', style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3), color: Colors.black54)),
//                   ],
//                 ),
//               ),
//               SizedBox(width: MyBlock.horizontal(context, x: 2)),
//               SizedBox(
//                 height: MyBlock.vertical(context),
//               ),
//             ],
//           ),
//         );
//       } else {
//         secenekliAndText = Expanded(
//           child: Card(
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(MyBlock.horizontal(context, x: 10)), right: Radius.circular(MyBlock.horizontal(context, x: 5)))),
//             elevation: 3,
//             child: Padding(
//               padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.5)),
//               child: Row(
//                 children: [
//                   Container(
//                       padding: EdgeInsets.all(MyBlock.horizontal(context, x: 2)),
//                       decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xff6551A0)),
//                       child: Icon(Icons.comment_outlined, color: Colors.white, size: MyBlock.horizontal(context, x: 8))),
//                   Expanded(
//                       child: TextField(
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: MyBlock.vertical(context, x: 2)),
//                     //!  controller: widget.vm.ogretmenNotu,
//                     decoration: InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: MyBlock.horizontal(context, x: 3)),
//                         labelText: lang(item.title ?? ''),
//                         labelStyle: TextStyle(color: Colors.black54, fontSize: MyBlock.vertical(context, x: 1.7)),
//                         border: InputBorder.none,
//                         focusedBorder: InputBorder.none),
//                   ))
//                 ],
//               ),
//             ),
//           ),
//         );

//         list.add(
//           Row(
//             children: [secenekliAndText],
//           ),
//         );
//       }
//     }
//     return list;
//   }

//   Widget studentsList(bool firstIndex, StudentModel item) {
//     var nameSurname = '';
//     var surname = (item.nameSurname ?? '').toString().split(' ').last;
//     nameSurname = (item.nameSurname ?? '').replaceAll(surname, '');
//     nameSurname += '\n' + surname;
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           widget.vm.selectedStudent = item;
//         });
//       },
//       child: Container(
//         padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.5)),
//         height: MyBlock.vertical(context, x: 15.5),
//         child: ((widget.vm.selectedStudent != null && widget.vm.selectedStudent!.id == item.id) || (widget.vm.selectedStudent == null && firstIndex))
//             ? Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white, boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)], borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
//                 child: Expanded(
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: MyBlock.vertical(context),
//                       ),
//                       Container(
//                         decoration: BoxDecoration(boxShadow: [
//                           BoxShadow(
//                             color: Colors.black26,
//                             spreadRadius: 1,
//                             blurRadius: 3,
//                           )
//                         ], shape: BoxShape.circle, color: Color(0xffF19BC3)),
//                         child: Padding(
//                           padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.6)),
//                           child: Icon(
//                             Icons.person_rounded,
//                             size: MyBlock.horizontal(context, x: 7),
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: MyBlock.vertical(context, x: 0.5),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2.2)),
//                         child: Text(
//                           nameSurname,
//                           style: TextStyle(fontWeight: FontWeight.w600, fontSize: MyBlock.horizontal(context, x: 3.2), color: Color(0xff6551A0)),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                       SizedBox(
//                         height: MyBlock.vertical(context),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             : Wrap(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                         color: Colors.white, boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)], borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 2))),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: MyBlock.vertical(context, x: 0.5),
//                         ),
//                         Container(
//                           decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 1, blurRadius: 3)], shape: BoxShape.circle, color: Color(0xffF19BC3)),
//                           child: Padding(
//                             padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1)),
//                             child: Icon(
//                               Icons.person_rounded,
//                               size: MyBlock.horizontal(context, x: 7),
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: MyBlock.vertical(context, x: 0.5),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 1.5)),
//                           child: Text(
//                             nameSurname,
//                             style: TextStyle(fontWeight: FontWeight.w600, fontSize: MyBlock.horizontal(context, x: 2), color: Color(0xff6551A0)),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                         SizedBox(
//                           height: MyBlock.vertical(context, x: 0.5),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }
