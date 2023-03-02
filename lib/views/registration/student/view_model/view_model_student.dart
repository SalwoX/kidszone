import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../common/app_config.dart';
import '../../../../data/repositories/repository_common.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../register.dart';
import '../../../_init/components/widgets/kzsnack_widget_minifity.dart';
import '../../../_init/models/filter_model.dart';
import '../../../_init/models/mobile_result.dart';
import '../../../_init/view_model/base_view_model.dart';
import '../model/student_model.dart';
import '../service/repository_student.dart';

part 'view_model_student.g.dart';

class ViewModelStudent = _ViewModelStudentBase with _$ViewModelStudent;

abstract class _ViewModelStudentBase extends BaseViewModel<StudentModel, RepositoryStudent> with Store {
  @override
  void setContext(BuildContext ctx) => this.ctx = ctx;

  @override
  void init() {}

  int bottomNavigationBarIndex = 0;
  final formKey = GlobalKey<FormState>();

  var page_title = LocaleKeys.pageRegisStudent_student_list.tr();

  final String page_subTitle = "";

  @observable
  var scrollController = ScrollController();

  @observable
  var lastRegistration = false;

  @observable
  var oldFilterPage = 0;

  @observable
  var exception = "";

  // #region Kayıt
  @observable
  var repCommon = resolve<RepositoryCommon>();

  @observable
  var save = true;

  @observable
  var saveEnable = true;

  @observable
  bool? active;

  @observable
  var nameSurname = TextEditingController();

  @observable
  bool? isCitizenTC;

  @observable
  var idNo = TextEditingController();

  @observable
  var lessonClass = TextEditingController();

  @observable
  var studyClass = TextEditingController();

  @observable
  var studentNumber = TextEditingController();

  @observable
  var gender = TextEditingController();

  @observable
  var dateOfBirth = TextEditingController();

  @observable
  var disease = TextEditingController();

  @observable
  var bloodGroup = TextEditingController();

  @observable
  var startTime = TextEditingController();

  @observable
  var address = TextEditingController();

  @observable
  var description = TextEditingController();

  @observable
  var schoolBusId = TextEditingController();

  @observable
  var imgUrl = TextEditingController();

  @observable
  var files = TextEditingController();

  @observable
  var picker = ImagePicker();

  @observable
  var model = StudentModel();
  // #endregion

  //#region Arama Sayfası

  @observable
  FilterModel filter = FilterModel(
    page: 1,
    pageSize: AppConfig.pageSize,
    fields: <Field>[],
  );

  @observable
  List<Field> fields = [];

  @observable
  List<File> photoList = [];

  List<StudentModel> _modelList = [];
  List<StudentModel> get modelList => _modelList;

  Future<void> getList({bool yeni = true}) async {
    try {
      var repGet = resolve<RepositoryStudent>();
      Status = PageState.LOADING;
      var res = await repGet.getList(filterModel: filter);
      if (res is List<StudentModel>) {
        Status = PageState.SUCCESS;
        setList(res, yeni);
      } else if (res is MobileResult) {
        if (res.statusCode == "1") {
          Status = PageState.SUCCESS;
          setList([], yeni);
        } else {
          Status = PageState.ERROR;
        }
      }
    } catch (e) {
      Status = PageState.ERROR;
    }
  }

  Future<void> reload() async {
    lastRegistration = false;
    filter.page = 1;
    await getList();
  }

  Future<void> nextList() async {
    if (!lastRegistration) {
      filter.page += 1;
      await getList(yeni: false);
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }
  }

  //#endregion

  // #region Kayıt İşlemleri

  Future<void> addOrUpdate(StudentModel model, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      model.active = model.active ?? true;
      var repRegistration = resolve<RepositoryStudent>();

      var res = await repRegistration.addOrUpdate(
        model: model,
        files: photoList,
      );

      if (res is StudentModel) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageRegisStudent_saved.tr(),
            messageType: MessageType.Success,
          ),
        );
        model = res;
      } else if (res is MobileResult) {
        showTopSnackBar(
          context,
          KzSnackWidgetMinifit(
            message: LocaleKeys.pageRegisStudent_not_saved.tr() + (res.message ?? ''),
            messageType: MessageType.Error,
          ),
        );
      }
    }
    saveEnable = true;
  }
  // #endregion
}
