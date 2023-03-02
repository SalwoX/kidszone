// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_model_login.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ViewModelLogin on _ViewModelLoginBase, Store {
  late final _$isloadingAtom =
      Atom(name: '_ViewModelLoginBase.isloading', context: context);

  @override
  bool get isloading {
    _$isloadingAtom.reportRead();
    return super.isloading;
  }

  @override
  set isloading(bool value) {
    _$isloadingAtom.reportWrite(value, super.isloading, () {
      super.isloading = value;
    });
  }

  late final _$phoneAtom =
      Atom(name: '_ViewModelLoginBase.phone', context: context);

  @override
  String? get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String? value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_ViewModelLoginBase.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$securityCodeAtom =
      Atom(name: '_ViewModelLoginBase.securityCode', context: context);

  @override
  String? get securityCode {
    _$securityCodeAtom.reportRead();
    return super.securityCode;
  }

  @override
  set securityCode(String? value) {
    _$securityCodeAtom.reportWrite(value, super.securityCode, () {
      super.securityCode = value;
    });
  }

  late final _$modelAtom =
      Atom(name: '_ViewModelLoginBase.model', context: context);

  @override
  UserModel? get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(UserModel? value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  @override
  String toString() {
    return '''
isloading: ${isloading},
phone: ${phone},
password: ${password},
securityCode: ${securityCode},
model: ${model}
    ''';
  }
}
