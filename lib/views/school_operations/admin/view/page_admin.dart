import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../common/enums.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../register.dart';
import '../../../_init/components/appbar/custom_appbar.dart';
import '../../../_init/components/widgets/widgets.dart';
import '../../../_init/error/page_error.dart';
import '../../../_init/logger/logger_mixin.dart';
import '../../../_init/router/app_router.dart';
import '../../../_init/themes/colors.dart';
import '../../../_init/view_model/base_view_model.dart';
import '../../../registration/executive/model/executive_model.dart';
import '../../../registration/executive/view_model/view_model_executive.dart';
import 'page_registration_admin.dart';

class PageAdmin extends StatefulWidget {
  PageAdmin({Key? key}) : super(key: key);

  @override
  State<PageAdmin> createState() => _PageAdminState();
}

class _PageAdminState extends State<PageAdmin> with LoggerMixin {
  final vm = ViewModelExecutive();

  @override
  Widget build(BuildContext context) {
    vm.title = LocaleKeys.condition_senior_manager.tr();

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
                    await resolve<AppRouter>().push(RouteRegistrationAdmin());

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
            itemCount: vm.models.length,
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerItem(BuildContext context, int index) {
    var model = (vm.models)[index];
    return ListViewWidget().iconTextItem(
      context: context,
      text: '${model.nameSurname} ${model.admin != null ? '(${Enums.getAdminExecutiveTypes.values.toList().firstWhere((element) => element.key == model.admin.toString()).value})' : ''}',
      onTap: () {
        onSelectRow(model, context);
      },
    );
  }

  void onSelectRow(ExecutiveModel item, BuildContext context) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => PageRegistrationAdmin(model: item)));

    vm.reload();
  }
}

/*
class PageAdmin1 extends StatefulWidget {
  final String title = "Üst Düzey Yönetici";

  @override
  _PageAdminState createState() => _PageAdminState();
}

class _PageAdminState extends State<PageAdmin1> {
  int currentIndexPage = 0;
  List<models.YoneticiModel>? _models;
  models.FilterModel _filter = models.FilterModel(page: 1, pageSize: core.AppConfig.pageSize, fields: <models.Field>[]);
  ScrollController _scrollController = ScrollController();
  var oldFilterPage = 0;
  bool sonKayit = false;

  @override
  void initState() {
    _filter.page = 1;
    _filter.fields = <models.Field>[
      models.Field(
        fieldName: 'Admin',
        fieldOperator: "contains",
        fieldValue: '${core.Enumlar.getAdminYoneticiTipi.values.map((e) => e.key).join(',')}',
      ),
    ];
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        getNextList(context);
      }
    });

    super.initState();
    currentIndexPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    final _bloc = context.read<YoneticiBloc>();
    _bloc.add(GetListEvent(filterModel: _filter));
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            kz.CustomAppBar(
              innerBoxIsScrolled,
              headerWidgets: [
                Text(
                  widget.title,
                  style: primaryTextStyle(color: themes.ThemeColors.beyaz, size: 16, fontFamily: themes.fontRegular),
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
                    await Navigator.push(
                      context,
                      core.FadeInRoute(
                        routeName: pages.PageKayitAdmin.tag,
                        page: pages.PageKayitAdmin(),
                      ),
                    );

                    refresh();
                  },
                ),
              ],
              isBackButton: true,
            ),
          ];
        },
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
          color: themes.appLayout_background,
          child: Container(
            padding: EdgeInsets.all(0),
            child: BlocBuilder(
              bloc: _bloc,
              builder: (context, YoneticiState state) {
                if (state is Initial) {
                  return Center(
                    child: Text("Yükleniyor"),
                  );
                } else if (state is LoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GetListState) {
                  if (_filter.page != oldFilterPage && state.models != null) {
                    for (var row in state.models!.toList()) {
                      oldFilterPage = _filter.page;
                      if (_models == null) {
                        _models = <models.YoneticiModel>[];
                      }
                      _models!.add(row);
                    }
                    if (_models == null) {
                      _models = <models.YoneticiModel>[];
                    }
                  }
                  sonKayit = state.models!.length == 0 || state.models!.length < _filter.pageSize;

                  return RefreshIndicator(
                    child: Column(
                      children: [
                        builder(),
                      ],
                    ),
                    onRefresh: () {
                      refresh();
                      return Future.value(false);
                    },
                  );
                } else if (state is ErrorState) {
                  return pages.PageError(
                    exception: state.exception,
                    function: () => _bloc.add(ReloadEvent(filterModel: _filter)),
                  );
                }
                return Center(
                  child: Text("Boş"),
                );
              },
            ),
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
            controller: _scrollController,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              if (index == _models!.length && sonKayit == false) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (index == _models!.length && sonKayit) {
                return Container(
                  height: 1,
                );
              } else {
                return _buildCustomerItem(context, index);
              }
            },
            itemCount: _models != null ? _models!.length + 1 : 0,
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerItem(BuildContext context, int index) {
    var model = (_models as List<models.YoneticiModel>)[index];
    return kz.ListView().iconTextItem(
      context: context,
      text: '${model.adSoyad} ${model.admin != null ? '(${core.Enumlar.getAdminYoneticiTipi.values.toList().firstWhere((element) => element.key == model.admin.toString()).value})' : ''}',
      onTap: () {
        onSelectRow(model);
      },
    );
  }

  void onSelectRow(models.YoneticiModel item) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => pages.PageKayitAdmin(model: item)));

    refresh();
  }

  void refresh() {
    final _bloc = BlocProvider.of<YoneticiBloc>(context);
    _filter.page = 1;
    _models = null;
    oldFilterPage = 0;
    _bloc.add(ReloadEvent(filterModel: _filter));
  }

  void getNextList(BuildContext context) {
    if (!sonKayit) {
      _filter.page += 1;
      _models = null;
      final _bloc = BlocProvider.of<YoneticiBloc>(context);
      _bloc.add(GetListEvent(filterModel: _filter));
    }
  }
}
*/
