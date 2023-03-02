// import 'package:flutter/material.dart';
// import 'package:kidszone_app/blocs/my_block.dart';

// import 'package:kidszone_app/imports/import_components.dart' as kz;
// import 'package:kidszone_app/imports/import_themes.dart' as themes;
// import 'package:kidszone_app/imports/import_common.dart' as core;
// import 'package:kidszone_app/presentation/view_model/view_model_daily_report_template.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:provider/provider.dart';

// import 'view/page_registration_daily_report.dart';

// // ignore: must_be_immutable
// class PageGunlukKarneSablon extends StatefulWidget {
//   final String title = "Günlük Karne Düzenle";
//   final String subTitle = "Öğrencinizin günlük durumunu takip edebilirsiniz.";
//   // ignore: unused_field
//   final _formKey = GlobalKey<FormState>();

//   int? sinifId;

//   PageGunlukKarneSablon({
//     Key? key,
//     this.sinifId,
//   }) : super(key: key);

//   @override
//   _PageGunlukKarneSablonState createState() => _PageGunlukKarneSablonState();
// }

// class _PageGunlukKarneSablonState extends State<PageGunlukKarneSablon> {
//   Map<String, dynamic>? pickedKid;
//   List<Map<String, dynamic>>? pickedKidInfo = [];

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: NestedScrollView(
//           headerSliverBuilder: (context, innerBoxIsScrolled) {
//             return [
//               kz.CustomAppBar(
//                 innerBoxIsScrolled,
//                 headerWidgets: [
//                   Text(
//                     widget.title,
//                     style: primaryTextStyle(color: themes.ThemeColors.beyaz, size: 16, fontFamily: themes.fontRegular),
//                   ),
//                 ],
//                 iconButton: [
//                   IconButton(
//                     icon: Icon(
//                       Icons.add,
//                       color: Colors.white,
//                       size: 30.0,
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         core.FadeInRoute(
//                           routeName: PageKayitGunlukKarne.tag,
//                           page: PageKayitGunlukKarne(),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//                 isBackButton: true,
//               ),
//             ];
//           },
//           body: context.watch<ViewModelGunlukKarneSablon>().state == JobState.BUSY
//               ? buildLoadingWidget()
//               : context.watch<ViewModelGunlukKarneSablon>().state == JobState.ERROR
//                   ? buildErrorWidget()
//                   : body(context)),
//       bottomNavigationBar: kz.bottomNavigationBar(
//         context: context,
//         index: 3,
//       ),
//     );
//   }

//   Center buildErrorWidget() => Center(child: Text('Something went wrong!'));

//   Center buildLoadingWidget() => Center(child: CircularProgressIndicator());

//   Column body(BuildContext context) {
//     return Column(
//       children: [
//         Stack(
//           children: [
//             Container(
//               height: MyBlock.horizontal(context, x: 7),
//               child: Center(
//                 child: tarih(context),
//               ),
//             )
//           ],
//         ),
//         Expanded(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: MyBlock.vertical(context, x: 0),
//                 ),
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }

//   Container tarih(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(border: Border.all(color: Colors.white), color: Color(0xff65539E), borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
//       padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.5)),
//       child: Text(
//         "23 Eylül 2020",
//         style: TextStyle(fontSize: MyBlock.horizontal(context, x: 3.1), color: Colors.white),
//       ),
//     );
//   }
// }
