import 'package:injectable/injectable.dart' show LazySingleton;
import '../../../../data/core/apiservices.dart';
import '../../../../register.dart';
import '../../../_init/models/user_model.dart';
import '../../../_init/repository/repository_base.dart';

@LazySingleton()
class RepositoryLogin extends RepositoryBase {
  ApiServices api = resolve<ApiServices>();

  Future<UserModel> login({required String phone, required String password}) async {
    var res = await api.login(phone, password);
    return res;
  }

  Future<UserModel> loginSecurityCode({required String phone, required String password, required String securityCode}) async {
    var res = await api.loginSecurity(phone, password, securityCode);
    return res;
  }
}
