import '../../../core/extension/convert_extension.dart';

class UserModel {
  int? id;
  int? schoolId;
  int? branchId;
  String? nameSurname;
  String? mission;
  String? phoneNumber;
  String? confirmCode;
  String? password;
  String? imgUrl;
  String? description;
  int? permissionGroup;
  bool? mobileLogin;
  bool? webLogin;
  bool? isSuperAdmin;
  bool? isAdministrator;
  String? appName;
  String? token;

  UserModel({
    this.id,
    this.schoolId,
    this.branchId,
    this.nameSurname,
    this.mission,
    this.phoneNumber,
    this.confirmCode,
    this.password,
    this.imgUrl,
    this.description,
    this.permissionGroup,
    this.mobileLogin,
    this.webLogin,
    this.isSuperAdmin,
    this.isAdministrator,
    this.appName,
    this.token,
  });

  @override
  String toString() {
    return 'KullaniciModel(id: $id, schoolId: $schoolId, branchId: $branchId, nameSurname: $nameSurname, mission: $mission, phoneNumber: $phoneNumber, confirmCode: $confirmCode, password: $password, imgUrl: $imgUrl, description: $description, permissionGroup: $permissionGroup, mobileLogin: $mobileLogin, webLogin: $webLogin, isSuperAdmin: $isSuperAdmin, isAdministrator: $isAdministrator, appName: $appName, token: $token)';
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    int? id,
    int? schoolId,
    int? branchId,
    String? nameSurname,
    String? mission,
    String? phoneNumber,
    String? confirmCode,
    String? password,
    String? imgUrl,
    String? description,
    int? permissionGroup,
    bool? mobileLogin,
    bool? webLogin,
    bool? isSuperAdmin,
    bool? isAdministrator,
    String? appName,
    String? token,
  }) {
    return UserModel(
      id: id ?? this.id,
      schoolId: schoolId ?? this.schoolId,
      branchId: branchId ?? this.branchId,
      nameSurname: nameSurname ?? this.nameSurname,
      mission: mission ?? this.mission,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      confirmCode: confirmCode ?? this.confirmCode,
      password: password ?? this.password,
      imgUrl: imgUrl ?? this.imgUrl,
      description: description ?? this.description,
      permissionGroup: permissionGroup ?? this.permissionGroup,
      mobileLogin: mobileLogin ?? this.mobileLogin,
      webLogin: webLogin ?? this.webLogin,
      isSuperAdmin: isSuperAdmin ?? this.isSuperAdmin,
      isAdministrator: isAdministrator ?? this.isAdministrator,
      appName: appName ?? this.appName,
      token: token ?? this.token,
    );
  }
}

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int?,
      schoolId: json['schoolId'] as int?,
      branchId: json['branchId'] as int?,
      nameSurname: json['nameSurname'] as String?,
      mission: json['mission'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      confirmCode: json['confirmCode'] as String?,
      password: json['password'] as String?,
      imgUrl: json['imgUrl'] as String?,
      description: json['description'] as String?,
      permissionGroup: json['permissionGroup'] as int?,
      mobileLogin: json["mobileLogin"] == null ? null : json["mobileLogin"].toString().parseBool(),
      webLogin: json["webLogin"] == null ? null : json["webLogin"].toString().parseBool(),
      isSuperAdmin: json["isSuperAdmin"] == null ? null : json["isSuperAdmin"].toString().parseBool(),
      isAdministrator: json["isAdministrator"] == null ? null : json["isAdministrator"].toString().parseBool(),
      appName: json['appName'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'schoolId': instance.schoolId,
      'branchId': instance.branchId,
      'nameSurname': instance.nameSurname,
      'mission': instance.mission,
      'phoneNumber': instance.phoneNumber,
      'confirmCode': instance.confirmCode,
      'password': instance.password,
      'imgUrl': instance.imgUrl,
      'description': instance.description,
      'permissionGroup': instance.permissionGroup,
      'mobileLogin': instance.mobileLogin,
      'webLogin': instance.webLogin,
      'isSuperAdmin': instance.isSuperAdmin,
      'isAdministrator': instance.isAdministrator,
      'appName': instance.appName,
      'token': instance.token,
    };
