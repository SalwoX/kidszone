
// import 'package:flutter/widgets.dart';
// import 'package:kidszone_app/imports/import_repository.dart' as repositories;
// import 'package:kidszone_app/imports/import_model.dart' as models;
// import 'package:kidszone_app/imports/import_register.dart' as register;
// import 'package:mobx/mobx.dart';

// import '../../view/init/view_model/base_view_model.dart';
// part 'view_model_login.g.dart';

// class ViewModelLogin = _ViewModelLoginBase with _$ViewModelLogin;

// abstract class _ViewModelLoginBase with Store {
//   final repositories.RepositoryLogin rep = register.resolve<repositories.RepositoryLogin>();

//   @observable
//   String? phone;

//   @observable
//   String? password;

//   @observable
//   String? securityCode;

//   @observable
//   models.KullaniciModel? model;

//   @observable
//   PageState? _state;

//   void isLogin(BuildContext context) async {
//     try {
//       var login = await rep.login(phone: phone!, password: password!);
//       if (login.id != null) {
//         model = login;
//       } else {
//         model = null;
//         //   showTopSnackBar(
//         //   context,
//         //   kz.KzSnackWidgetMinifity(
//         //     message: core.lang('Hata') + (login.message ?? ''),
//         //     messageType: kz.MessageType.Error,
//         //   ),
//         // );
//       }
//     } catch (_) {
//       model = null;
//     }
//   }

//   void loginSecurityCode(BuildContext context) async {
//     try {
//       var login = await rep.loginSecurityCode(
//         phone: phone!,
//         password: password!,
//         securityCode: securityCode!,
//       );
//       if (login.id != null) {
//         model = login;
//       } else {
//         model = null;
//       }
//     } catch (_) {
//       model = null;
//     }
//   }
// }
