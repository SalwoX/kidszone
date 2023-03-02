import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../common/model/clipper.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../_init/error/page_error.dart';
import '../../../_init/logger/logger_mixin.dart';
import '../../../_init/my_block.dart';
import '../../../_init/view_model/base_view_model.dart';
import '../viewmodel/view_model_attendance.dart';
import 'page_attendance_list_detail.dart';

class PageAttendanceList extends StatefulWidget {
  final String title = "Yoklama İşlemleri";
  final String subTitle = "";
  final vm = ViewModelAttendance();

  PageAttendanceList({Key? key}) : super(key: key);

  @override
  State<PageAttendanceList> createState() => _PageAttendanceListState();
}

class _PageAttendanceListState extends State<PageAttendanceList> with LoggerMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: Column(
          children: [
            Text(LocaleKeys.pageAttendanceProcess_polling_operations.tr()),
          ],
        ),
        backgroundColor: Color(0xff65539E),
        actions: [
          IconButton(
            icon: Icon(Icons.analytics_outlined),
            onPressed: () {},
            // onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Istatistikler())),
          )
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: BottomClipper(myVal: MyBlock.horizontal(context, x: 6)),
                child: Container(
                  width: double.maxFinite,
                  height: MyBlock.horizontal(context, x: 12),
                  decoration: BoxDecoration(
                    color: Color(0xff65539E),
                  ),
                ),
              ),
              Container(
                height: MyBlock.horizontal(context, x: 12),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.white), color: Color(0xff65539E), borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
                    padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.5)),
                    child: Text(
                      "23 Eylül 2020",
                      style: context.textTheme.bodyLarge,
                    ),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MyBlock.vertical(context, x: 0),
                  ),
                  _studentIList(context),
                  SizedBox(
                    height: MyBlock.vertical(context, x: 5),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _studentIList(BuildContext context) {
    return Column(
      children: [
        Text(
          LocaleKeys.pageAttendanceProcess_choose_student.tr(),
          style: context.textTheme.bodySmall, //1,6
        ),
        SizedBox(
          height: MyBlock.vertical(context, x: 2),
        ),
        Observer(builder: (_) {
          switch (widget.vm.Status) {
            case PageState.LOADING:
              return Center(child: CircularProgressIndicator());
            case PageState.SUCCESS:
              return RefreshIndicator(
                child: Column(
                  children: [
                    _studentGrid(context),
                  ],
                ),
                onRefresh: () {
                  widget.vm.reload();
                  return Future.value(false);
                },
              );
            case PageState.ERROR:
              return PageError(
                  exception: widget.vm.exception,
                  function: () {
                    widget.vm.reload();
                  });
            default:
              return SizedBox();
          }
        }),
      ],
    );
  }

  GridView _studentGrid(BuildContext context) {
    return GridView(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(left: MyBlock.horizontal(context, x: 3), right: MyBlock.horizontal(context, x: 3), top: MyBlock.vertical(context, x: 1), bottom: MyBlock.vertical(context, x: 3)),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: MyBlock.horizontal(context, x: 4), mainAxisSpacing: MyBlock.vertical(context, x: 4), crossAxisCount: 4),
      children: widget.vm.models
          .map((item) => GestureDetector(
                onTap: () {
                  setState(() {
                    //!TODO: Detail Page
                    Navigator.of(context).pop(PageAttendanceListDetail(
                      item: item,
                      details: item.detail,
                    ));
                  });
                },
                child: Wrap(
                  children: [
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.white, boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)], borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MyBlock.vertical(context),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 1, blurRadius: 3)], shape: BoxShape.circle, color: item.gender == 2 ? Color(0xffF19BC3) : Color(0xff78C0FF)),
                            child: Padding(
                              padding: EdgeInsets.all(MyBlock.horizontal(context, x: 1.6)),
                              child: Icon(
                                Icons.person_rounded,
                                size: MyBlock.horizontal(context, x: 9),
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MyBlock.vertical(context, x: 0.6),
                          ),
                          Container(
                            height: MyBlock.vertical(context, x: 3),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: MyBlock.horizontal(context, x: 2.2)),
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  item.nameSurname ?? "",
                                  style: context.textTheme.bodyLarge,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MyBlock.vertical(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
