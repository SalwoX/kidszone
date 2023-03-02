import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../generated/locale_keys.g.dart';
import '../../../views/_init/components/appbar/custom_appbar.dart';
import '../../../views/_init/components/widgets/bottom_navigation_bar.dart';
import '../../../views/_init/error/page_error.dart';
import '../../../views/_init/my_block.dart';
import '../../../views/_init/themes/colors.dart';
import '../../../views/_init/view_model/base_view_model.dart';

// ignore: must_be_immutable
abstract class BaseViewSearch<@required T extends BaseViewModel, TModel> extends StatefulWidget {
  String? get tag => this.toString();
  bool isBackAppBarButton = false;

  int bottomNavigationSelectIndex = 0;

  @required
  late T vm;

  List<Widget>? get iconButton;

  BaseViewSearch({Key? key}) : super(key: key);

  @override
  State<BaseViewSearch> createState() => _BaseViewSearchState();

  void init() {
    if (vm.Status == PageState.INITAL) {
      vm.upload();
    }

    vm.scrollController.addListener(() {
      if (vm.scrollController.position.pixels == vm.scrollController.position.maxScrollExtent) {
        vm.nextList();
      }
    });
  }

  @protected
  Widget items(BuildContext context, int index, List<TModel> _models) {
    return Center(
      child: Text(LocaleKeys.baseViewSearch_items_text.tr()),
    );
  }
}

class _BaseViewSearchState extends State<BaseViewSearch> {
  @override
  Widget build(BuildContext context) {
    widget.vm.setContext(context);
    widget.vm.scrollController.addListener(() {
      if (widget.vm.scrollController.position.pixels == widget.vm.scrollController.position.maxScrollExtent) {
        widget.vm.nextList();
      }
    });

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CustomAppBar(
              innerBoxIsScrolled,
              appbarHeight: MyBlock.vertical(context, x: 6),
              isBackButton: widget.isBackAppBarButton,
              headerWidgets: [
                Text(
                  widget.vm.page_title.tr(),
                  style: context.textTheme.displayLarge,
                ),
                Text(
                  widget.vm.page_subTitle.tr(),
                  style: context.textTheme.displaySmall,
                ),
              ],
              iconButton: widget.iconButton,
            ),
          ];
        },
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
          color: appLayout_background,
          child: Container(
            padding: EdgeInsets.all(0),
            child: Observer(builder: (_) {
              print(widget.vm.Status);
              switch (widget.vm.Status) {
                case PageState.INITAL:
                  widget.init();
                  return Center(child: CircularProgressIndicator());
                case PageState.LOADING:
                  return Center(child: CircularProgressIndicator());
                case PageState.SUCCESS:
                  return refreshIndicator(context);
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
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(
        context: context,
        index: widget.bottomNavigationSelectIndex,
      ),
    );
  }

  RefreshIndicator refreshIndicator(BuildContext context) {
    return RefreshIndicator(
      child: listViewBuilder(context),
      onRefresh: () {
        widget.vm.reload();
        return Future.value(false);
      },
    );
  }

  ListView listViewBuilder(BuildContext context) {
    return ListView.builder(
      controller: widget.vm.scrollController,
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: MyBlock.vertical(context, x: 1), bottom: MyBlock.vertical(context, x: 12)),
      shrinkWrap: true,
      itemBuilder: itemBuilder,
      itemCount: widget.vm.models.length + 1,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    if (index == widget.vm.models.length && widget.vm.lastRegistration == false) {
      print("test ${index} ${widget.vm.models.length} ${widget.vm.lastRegistration}");
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (index == widget.vm.models.length && widget.vm.lastRegistration) {
      return Container();
    }
    return widget.items(context, index, widget.vm.models);
  }
}
