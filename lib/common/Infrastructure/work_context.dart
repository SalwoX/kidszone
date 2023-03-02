import 'package:localstorage/localstorage.dart';

import '../../views/_init/models/user_model.dart';

class WorkContext {
  static UserModel? get userModel => WorkContext().getUser;
  static String get nameSurname => userModel?.nameSurname ?? "";
  static bool get isDemo => false;

  String get token => userModel?.token ?? "";

  void saveUser(UserModel user) async {
    if (user.id != null) {
      // if (getUser != null) {
      //   deleteUser();
      // }
      await storage.setItem("Kullanıcı", user.toJson());
      // storage.dispose();
    }
  }

  void deleteUser() async {
    try {
      return await storage.deleteItem("Kullanıcı");
    } catch (e) {
      return await storage.clear();
    }
  }

  UserModel? get getUser {
    UserModel? user;
    if (storage.getItem("Kullanici").toString().isNotEmpty) {
      var res = storage.getItem("Kullanıcı");
      if (res != null) {
        user = UserModel.fromJson((res as Map<String, dynamic>));
      }
    }
    return user;
  }

  // ignore: unnecessary_new
  LocalStorage get storage => new LocalStorage('kisdzoneus.json');
}
/*
abstract class IWorkContext {
  LocalStorage get storage;
  kullaniciKaydet(KullaniciModel user) {}
  KullaniciModel? get kullaniciGetir {
    return null;
  }
}
*/