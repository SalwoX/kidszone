import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../register.dart';
import '../../../_init/components/appbar/custom_appbar.dart';
import '../../../_init/components/widgets/widgets.dart';
import '../../../_init/error/page_error.dart';
import '../../../_init/logger/logger_mixin.dart';
import '../../../_init/router/app_router.dart';
import '../../../_init/themes/colors.dart';
import '../../../_init/view_model/base_view_model.dart';
import '../model/school_bus_model.dart';
import '../view_model/view_model_school_bus.dart';
import 'page_registration_school_bus.dart';

class PageSchoolBus extends StatefulWidget {
  PageSchoolBus({Key? key}) : super(key: key);

  @override
  State<PageSchoolBus> createState() => _PageSchoolBusState();
}

class _PageSchoolBusState extends State<PageSchoolBus> with LoggerMixin {
  final vm = ViewModelSchoolBus();

  @override
  Widget build(BuildContext context) {
    vm.upload();
    vm.scrollController.addListener(() {
      if (vm.scrollController.position.pixels == vm.scrollController.position.maxScrollExtent) {
        vm.nextList();
      }
    });
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            CustomAppBar(
              innerBoxIsScrolled,
              headerWidgets: [
                Text(
                  vm.title,
                  style: context.textTheme.displayLarge,
                ),
              ],
              iconButton: [
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    await resolve<AppRouter>().push(RouteRegistrationSchoolBus());

                    vm.reload();
                  },
                ),
              ],
              isBackButton: true,
            ),
          ];
        },
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
          color: appLayout_background,
          child: Container(
            padding: EdgeInsets.all(0),
            child: Observer(builder: (_) {
              switch (vm.Status) {
                case PageState.LOADING:
                  return Center(child: CircularProgressIndicator());
                case PageState.SUCCESS:
                  return RefreshIndicator(
                    child: Column(
                      children: [
                        builder(),
                      ],
                    ),
                    onRefresh: () {
                      vm.reload();
                      return Future.value(false);
                    },
                  );
                case PageState.ERROR:
                  return PageError(
                      exception: vm.exception,
                      function: () {
                        vm.reload();
                      });
                default:
                  return SizedBox();
              }
            }),
          ),
        ),
      ),
      /*bottomNavigationBar: kz.bottomNavigationBar(
				context: context,
				index: currentIndexPage,
			  ),*/
    );
  }

  Widget builder() {
    return Expanded(
      child: Stack(
        children: [
          ListView.builder(
            controller: vm.scrollController,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              if (index == vm.models.length && vm.lastRegistration == false) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (index == vm.models.length && vm.lastRegistration) {
                return Container(
                  height: 1,
                );
              } else {
                return _buildCustomerItem(context, index);
              }
            },
            itemCount: vm.models.length + 1,
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerItem(BuildContext context, int index) {
    var model = (vm.models)[index];
    return ListViewWidget().iconTextItem(
      context: context,
      text: "${model.profileName} ${model.plate}",
      onTap: () {
        onSelectRow(model, context);
      },
    );
  }

  void onSelectRow(SchoolBusModel item, BuildContext context) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => PageRegistrationSchoolBus(model: item)));

    vm.reload();
  }
}
