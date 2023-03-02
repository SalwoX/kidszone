import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../core/extension/datetime_extensions.dart';
import '../../../../../register.dart';
import '../../../../_init/components/appbar/custom_appbar.dart';
import '../../../../_init/error/page_error.dart';
import '../../../../_init/logger/logger_mixin.dart';
import '../../../../_init/my_block.dart';
import '../../../../_init/router/app_router.dart';
import '../../../../_init/view_model/base_view_model.dart';
import '../model/preregistration_notes_model.dart';
import '../view_model/view_model_preregistration_notes.dart';
import 'page_registration_preregistration_notes.dart';

/*import 'package:kidszone_app/imports/import_components.dart' as kz;
import 'package:kidszone_app/imports/import_pages.dart' as pages;
import 'package:kidszone_app/imports/import_themes.dart' as themes;
import 'package:kidszone_app/imports/import_common.dart' as core;
import 'package:kidszone_app/imports/import_model.dart' as models;*/

// ignore: must_be_immutable
class PagePreregistrationNotes extends StatefulWidget {
  int? preregistrationId;
  bool newRegistrationActive;

  PagePreregistrationNotes({
    Key? key,
    this.preregistrationId,
    this.newRegistrationActive = false,
  }) : super(key: key);

  @override
  State<PagePreregistrationNotes> createState() => _PagePreregistrationNotesState();
}

class _PagePreregistrationNotesState extends State<PagePreregistrationNotes> with LoggerMixin {
  final vm = ViewModelPreregistrationNotes();

  @override
  Widget build(BuildContext context) {
    vm.newRegistrationActive = widget.newRegistrationActive;
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
                Visibility(
                  visible: vm.newRegistrationActive,
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      await resolve<AppRouter>().push(RouteRegistrationPreregistrationNotes(
                        model: PreregistrationNotesModel(
                          id: 0,
                          preregistrationId: vm.preregistrationId,
                        ),
                      ));

                      vm.reload();
                    },
                  ),
                ),
              ],
              isBackButton: true,
            ),
          ];
        },
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Container(
            padding: EdgeInsets.all(0),
            child: Observer(builder: (_) {
              switch (vm.Status) {
                case PageState.LOADING:
                  return Center(child: CircularProgressIndicator());
                case PageState.SUCCESS:
                  return RefreshIndicator(
                    child: builder(),
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
    );
  }

  Widget builder() {
    return ListView.builder(
      controller: vm.scrollController,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        if (index == (vm.models.length) && vm.lastRegistration == false) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (index == (vm.models.length) && vm.lastRegistration) {
          return Container();
        }
        return _buildCustomerItem(context, index);
      },
      itemCount: vm.models.length,
    );
  }

  Widget _buildCustomerItem(BuildContext context, int index) {
    var item = (vm.models)[index];
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3)),
            child: ListTile(
              title: Text(
                item.notes ?? "",
                style: TextStyle(fontSize: MyBlock.horizontal(context, x: 5), fontWeight: FontWeight.bold, color: Color(0xff65539E)),
              ),
              trailing: Text(
                DatetimeExtensions.timeFormat(item.registrationDate),
                style: TextStyle(fontSize: MyBlock.horizontal(context, x: 2.3), color: Color(0xff65539E).withOpacity(0.7)),
              ),
              onTap: () {
                onSelectRow(item, context);
              },
            ),
          ),
        ),
        SizedBox(
          height: MyBlock.vertical(context, x: 0.5),
        ),
      ],
    );
  }

  void onSelectRow(PreregistrationNotesModel item, BuildContext context) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => PageRegistrationPreregistrationNotes(model: item)));

    vm.reload();
  }
}

// ignore: must_be_immutable
/*class PageOnKayitNotlar1 extends StatefulWidget {
  final String title = "Notlar";
  int? onKayitId;
  bool yeniKayitAktif;

  PageOnKayitNotlar1({
    Key? key,
    this.onKayitId,
    this.yeniKayitAktif = true,
  }) : super(key: key);

  @override
  _PageOnKayitNotlarState createState() => _PageOnKayitNotlarState();
}

class _PageOnKayitNotlarState extends State<PageOnKayitNotlar1> {
  int currentIndexPage = 0;

  List<models.OnKayitNotlarModel>? _models;

  models.FilterModel _filter = models.FilterModel(page: 1, pageSize: core.AppConfig.pageSize, fields: <models.Field>[]);
  ScrollController _scrollController = ScrollController();
  var oldFilterPage = 0;
  bool sonKayit = false;

  @override
  void initState() {
    _filter.page = 1;
    _filter.fields.add(
      models.Field(
        fieldName: 'OnKayitId',
        fieldOperator: 'eq', //AppStatic.filterOperator.operatorEnums!.eq,
        fieldValue: widget.onKayitId!.toString(),
      ),
    );

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
    final _bloc = context.read<OnKayitNotlarBloc>();
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
              iconButton: widget.yeniKayitAktif
                  ? [
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
                              routeName: pages.PageKayitOnKayitNotlar.tag,
                              page: pages.PageKayitOnKayitNotlar(
                                model: models.OnKayitNotlarModel(
                                  id: 0,
                                  onKayitId: widget.onKayitId,
                                ),
                              ),
                            ),
                          );

                          refresh();
                        },
                      ),
                    ]
                  : null,
              isBackButton: true,
            ),
          ];
        },
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Container(
            padding: EdgeInsets.all(0),
            child: BlocBuilder(
              bloc: _bloc,
              builder: (context, OnKayitNotlarState state) {
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
                        _models = <models.OnKayitNotlarModel>[];
                      }
                      _models!.add(row);
                    }
                    if (_models == null) {
                      _models = <models.OnKayitNotlarModel>[];
                    }
                  }
                  sonKayit = state.models!.length == 0 || state.models!.length < _filter.pageSize;

                  return RefreshIndicator(
                    child: builder(),
                    onRefresh: () {
                      refresh();
                      return Future.value(false);
                    },
                  );
                } else if (state is ErrorState) {
                  return pages.PageError(
                    exception: state.exception,
                    function: () {
                      _models = null;
                      _filter.page = 1;
                      _bloc.add(ReloadEvent(filterModel: _filter));
                    },
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
    );
  }

  Widget builder() {
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        if (index == (_models?.length ?? 0) && sonKayit == false) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (index == (_models?.length ?? 0) && sonKayit) {
          return Container();
        }
        return _buildCustomerItem(context, index);
      },
      itemCount: _models?.length ?? 0 + 1,
    );
  }

  Widget _buildCustomerItem(BuildContext context, int index) {
    var item = (_models as List<models.OnKayitNotlarModel>)[index];
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3))),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(MyBlock.horizontal(context, x: 3)),
            child: ListTile(
              title: Text(
                item.notlar ?? "",
                style: TextStyle(fontSize: MyBlock.horizontal(context, x: 5), fontWeight: FontWeight.bold, color: Color(0xff65539E)),
              ),
              trailing: Text(
                core.DatetimeExtensions.zamanFormat(item.kayitTarihi),
                style: TextStyle(fontSize: MyBlock.horizontal(context, x: 2.3), color: Color(0xff65539E).withOpacity(0.7)),
              ),
              onTap: () {
                onSelectRow(item);
              },
            ),
          ),
        ),
        SizedBox(
          height: MyBlock.vertical(context, x: 0.5),
        ),
      ],
    );
  }

  void onSelectRow(models.OnKayitNotlarModel item) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => pages.PageKayitOnKayitNotlar(model: item)));

    refresh();
  }

  void refresh() {
    final _bloc = BlocProvider.of<OnKayitNotlarBloc>(context);
    _filter.page = 1;
    _models = null;
    oldFilterPage = 0;
    _bloc.add(ReloadEvent(filterModel: _filter));
  }

  void getNextList(BuildContext context) {
    if (!sonKayit) {
      _filter.page += 1;
      _models = null;
      final _bloc = BlocProvider.of<OnKayitNotlarBloc>(context);
      _bloc.add(GetListEvent(filterModel: _filter));
    }
  }
}
*/