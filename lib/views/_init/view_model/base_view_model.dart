import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../common/app_config.dart';
import '../../../core/init/network/ICoreDio.dart';
import '../../../core/init/network/network_manager.dart';
import '../../../register.dart';
import '../cache/locale_manager.dart';
import '../models/filter_model.dart';
import '../models/mobile_result.dart';
import '../repository/repository_base.dart';

part 'base_view_model.g.dart';

enum PageState { SUCCESS, LOADING, ERROR, NORMAL, INITAL }

class BaseViewModel<
    @required
        TModel,
    @required
        TRepotitory extends RepositoryBase> = _BaseViewModelBase<TModel,
    TRepotitory> with _$BaseViewModel<TModel, TRepotitory>;

abstract class _BaseViewModelBase<@required TModel,
    @required TRepotitory extends RepositoryBase> with Store {
  late BuildContext ctx;

  ICoreDioNullSafety? coreDio = NetworkManager.instance!.coreDio;

  LocaleManager localeManager = LocaleManager.instance;

  var rep = resolve<TRepotitory>();

  void setContext(BuildContext context) {
    ctx = context;
  }

  void init() {
    if (State == PageState.INITAL) {
      upload(
        isNew: true,
      );
    }
  }

  var page_title = "";

  var page_subTitle = "";

  @observable
  var scrollController = ScrollController();

  @observable
  var lastRegistration = false;

  @observable
  var oldFilterPage = 0;

  @observable
  var exception = "";

  @observable
  FilterModel filter = FilterModel(
    page: 1,
    pageSize: AppConfig.pageSize,
    fields: <Field>[],
    sort: '',
  );

  @observable
  List<Field> fields = [];

  @observable
  PageState? _state;

  PageState get Status => _state ?? PageState.INITAL;
  set Status(PageState state) {
    _state = state;
  }

  @observable
  var models = <TModel>[];

  void setList(List<TModel> _model, bool yeni) {
    lastRegistration = _model.length < AppConfig.pageSize;
    print("${lastRegistration} ${_model.length} ${AppConfig.pageSize}");
    if (yeni)
      models = _model;
    else
      models.addAll(_model);
  }

  @action
  Future<void> upload({bool isNew = true}) async {
    try {
      filter.fields = fields;

      Status = PageState.LOADING;
      var res = await rep.getList(filterModel: filter);
      if (res is List<TModel>) {
        Status = PageState.SUCCESS;
        setList(res, isNew);
      } else if (res is MobileResult) {
        if (res.statusCode == "1") {
          Status = PageState.SUCCESS;

          setList([], isNew);
        } else {
          Status = PageState.ERROR;

          setList([], isNew);
        }
      }
    } catch (e) {
      this.Status = PageState.ERROR;
    }
  }

  @action
  Future<void> reload() async {
    lastRegistration = false;
    filter.page = 1;
    await upload();
  }

  @action
  Future<void> nextList() async {
    if (!lastRegistration) {
      filter.page += 1;
      await upload(isNew: false);
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }
  }

  /**
   * Kaydet
   */
  // #region Kayıt

  @observable
  var save = true;

  @observable
  var saveEnable = true;

  final formKey = GlobalKey<FormState>();

  // #endregion
}
