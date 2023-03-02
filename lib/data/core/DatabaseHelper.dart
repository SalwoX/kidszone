import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../common/log.dart';
import '../../views/_init/models/user_model.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  String _loginTableName = 'User';

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._internal();
      return _databaseHelper as DatabaseHelper;
    } else {
      return _databaseHelper as DatabaseHelper;
    }
  }
  DatabaseHelper._internal();

  Future<Database> _getDatabase() async {
    if (_database == null) {
      _database = await _initializeDatebase() as Database?;
      return _database as Database;
    } else {
      return _database as Database;
    }
  }

  _initializeDatebase() async {
    Directory folder = await getApplicationDocumentsDirectory();
    String dbPath = join(folder.path, "kidszoneapp.db");
    Log.info('db pathi:' + dbPath);

    var kidszoneDb = openDatabase(dbPath, version: 4, onCreate: _createDB);
    return kidszoneDb;
  }

  Future<void> _createDB(Database db, int version) async {
    Log.info('create db tablo oluşturma başladı');

    await db.execute("""CREATE TABLE $_loginTableName (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          schoolId INTEGER,
          branchId INTEGER,
          nameSurname TEXT,
          mission TEXT,
          number TEXT,
          confirmCode TEXT,
          password TEXT,
          imageUrl TEXT,
          description TEXT,
          permissionGroup INTEGER,
          mobileLogin BOOLEAN,
          webLogin BOOLEAN,
          isSuperAdmin BOOLEAN,
          isAdministrator BOOLEAN,
          appName TEXT,
          token TEXT )""");
    // await db.execute(
    //     "CREATE TABLE Fatura (Id INTEGER PRIMARY KEY AUTOINCREMENT, CustomerId INTEGER, TicUnvani TEXT, Adi TEXT, Soyadi TEXT,Sehir TEXT,Ilce TEXT,Toplam REAL, OdemeTuru TEXT,OdenenFiyat REAL,Depo TEXT)");
    // await db.execute(
    //     "CREATE TABLE FaturaHr (Id INTEGER PRIMARY KEY AUTOINCREMENT,Blkodu INTEGER,FaturaId INTEGER, Barkod TEXT, UrunKodu TEXT, UrunAdi TEXT, SatisFiyati REAL,Adet REAL,ToplamTutar REAL,SonAlis REAL,SonSatis REAL,Depo TEXT)");
    // await db.execute(
    //     "CREATE TABLE OldPrice(Id INTEGER PRIMARY KEY AUTOINCREMENT,Blkodu INTEGER,PriceDate TEXT,Price REAL)");
  }

  Future<int> loginInsert(UserModel model) async {
    var db = await _getDatabase();
    var result = 0;
    try {
      result = await db.insert(_loginTableName, model.toJson(), nullColumnHack: "id");
    } catch (e) {
      try {
        result = await db.update(_loginTableName, model.toJson(), where: 'id = ?', whereArgs: [model.id]);
      } catch (ee) {}
    }
    return result;
  }

  Future<UserModel> loginUpdate(UserModel model) async {
    var db = await _getDatabase();
    await db.update(_loginTableName, model.toJson(), where: 'id = ?', whereArgs: [model.id]);
    return model;
  }

  Future<UserModel> loginGet() async {
    var db = await _getDatabase();
    List<Map> result = await db.query(_loginTableName, where: ' id = ? ', whereArgs: [-1]);
    if (result.length <= 0) {
      return UserModel();
    }
    var setting = result.map((e) => (UserModel.fromJson(e as Map<String, dynamic>)));
    var x = setting.first;
    return x;
  }
}
