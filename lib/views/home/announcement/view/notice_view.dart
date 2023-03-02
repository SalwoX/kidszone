import 'package:flutter/material.dart';

import '../../../../common/app_config.dart';
import '../../../../core/base/view/base_view_search.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/datetime_extensions.dart';
import '../../../../register.dart';
import '../../../_init/components/image/image_viewer.dart';
import '../../../_init/my_block.dart';
import '../../../_init/router/app_router.dart';
import '../../../_init/socket_io/socket_server.dart';
import '../model/notice_model.dart';
import '../viewmodel/notice_view_model.dart';

// ignore: must_be_immutable
class PageNoticeView extends BaseViewSearch<PageNoticeViewModel, NoticeModel> {
  @override
  void init() {
    // socket bağlantısı
    ServerSocketIo();
    super.init();
  }

  @override
  int bottomNavigationSelectIndex = 0;

  @override
  final vm = PageNoticeViewModel();

  PageNoticeView({Key? key}) : super(key: key);

  @override
  List<Widget>? get iconButton => [
        IconButton(
          icon: Icon(
            Icons.add,
            color: vm.ctx.theme.primaryIconTheme.color,
            size: vm.ctx.theme.primaryIconTheme.size,
          ),
          onPressed: () async {
            await resolve<AppRouter>().push(RouteNoticeRegistration());

            vm.reload();
          },
        ),
      ];

  @override
  Widget items(BuildContext context, int index, List<NoticeModel> _models) {
    var item = _models[index];
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3)),
            child: ExpansionTile(
              title: Text(item.title ?? "",
                  style: context.theme.textTheme
                      .headlineSmall /*TextStyle(
                  fontSize: MyBlock.horizontal(context, x: 5),
                  fontWeight: FontWeight.bold,
                  color: !item.constant! ? Color(0xff65539E) : Colors.blue[800],
                ),*/
                  ),
              trailing: Text(
                DatetimeExtensions.timeFormat(item.sharingDate ?? item.registrationDate),
                style: context.textTheme.bodySmall,
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(MyBlock.horizontal(context, x: 3.2)),
                  child: Column(
                    children: [
                      item.imgUrl != null && item.imgUrl!.isNotEmpty
                          ? Column(
                              children: [
                                Container(
                                    height: MyBlock.vertical(context, x: 25),
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: item.imgUrl!.split(',').map<Widget>((image) {
                                        return Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ImageViewer(photos: item.imgUrl!.split(','), initialIndex: item.imgUrl!.split(',').indexWhere((element) => element == image)))),
                                              child: Container(
                                                width: MyBlock.horizontal(context, x: 70),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 5)),
                                                  child: Image.network(
                                                    Prefix + ApiUrl + SuffixUrl + '/' + image,
                                                    fit: BoxFit.cover,
                                                    loadingBuilder: (context, widget, loadingProgress) {
                                                      if (loadingProgress == null) return widget;
                                                      return Center(
                                                        child: Container(
                                                          width: 25.0,
                                                          height: 25.0,
                                                          child: CircularProgressIndicator(
                                                            value: loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: MyBlock.horizontal(context, x: 2),
                                            )
                                          ],
                                        );
                                      }).toList(),
                                    )),
                                SizedBox(
                                  height: MyBlock.vertical(context),
                                )
                              ],
                            )
                          : Container(),
                      Text(
                        item.content ?? "",
                        style: context.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: MyBlock.vertical(context, x: 0.5),
        )
      ],
    );
  }
}
