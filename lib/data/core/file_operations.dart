import 'dart:io';

import 'package:path_provider/path_provider.dart';

class DosyaIslemleri {
  Future<String> get _localPath async {
    final directory = await getApplicationSupportDirectory();
    return directory.path;
  }

  String? _fileName;

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$_fileName.kzapp');
  }

  Future<String> readFile(String filename) async {
    try {
      _fileName = filename;
      final file = await _localFile;
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      return "-1";
    }
  }

  Future<File> writeFile(String data, String filename) async {
    _fileName = filename;
    final file = await _localFile;
    return file.writeAsString('$data');
  }
}
