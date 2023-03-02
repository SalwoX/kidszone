import 'package:intl/intl.dart';

String stringEmpty(String? value, String def) {
  if (value == null || value.isEmpty) {
    return value = def;
  }
  return value;
}

double doubleEmpty(double? value, double def) {
  if (value == null || value == 0) {
    return value = def;
  }
  return value;
}

int intEmpty(int? value, int def) {
  if (value == null || value == 0) {
    return value = def;
  }
  return value;
}

int? intDefault({required Object source, int def = 0}) {
  return int.tryParse(source.toString(), radix: def);
}

// double doubleDefault(Object source, {double def = 0}) {
//   var res = double.tryParse(source.toString());
//   if (res == null) {
//     return def;
//   }
// }

extension OToBool on Object {
  bool parseBool() {
    if (toString() == "1") return true;
    if (toString() == "true") return true;
    if (toString().toLowerCase() == 'true') return true;
    return false;
  }
}

// ignore: camel_case_extensions
extension convertString on String {
  bool parseBool() {
    if (toString() == "1") return true;
    if (toString() == "true") return true;
    if (toString().toLowerCase() == 'true') return true;
    return false;
  }

  String stringEmpty({String def = ''}) {
    if (trim().isEmpty) {
      return def;
    }
    return this;
  }
}

extension DToBool on dynamic {
  bool parseBool() {
    if (toString() == "1") return true;
    if (toString() == "true") return true;
    if (toString().toLowerCase() == 'true') return true;
    return false;
  }
}

extension IToBool on int {
  bool parseBool() {
    if (toString() == "1") return true;
    if (toString() == "true") return true;
    if (toString().toLowerCase() == 'true') return true;
    return false;
  }
}

extension SToBool on String? {
  bool? parseBool() {
    if (toString() == "1") return true;
    if (toString() == "true") return true;
    if (toString().toLowerCase() == 'true') return true;
    return false;
  }
}

extension ConvertToString on DateTime {
  String toStringFormat({String format = "dd:mm:yyyy hh:mm"}) {
    if (isEmpty()) {
      return '';
    }
    final DateTime now = this;
    final DateFormat formatter = DateFormat(format);
    final String formatted = formatter.format(now);
    return formatted;
  }

  bool isEmpty() {
    if (toString().isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}

extension DateTimeFormat on DateTime {
  /// Supports the following, inspired by: https://linux.die.net/man/3/strptime
  /// %Y: The year, including century (for example, 1991).
  /// %m: The month number (1-12).
  /// %d: The day of month (1-31).
  /// %H: The hour (0-23).
  /// %M: The minute (0-59).
  /// %S: The second (0-59).
  String format({String formatString = "dd.MM.yyyy"}) {
    var hourString = hour.toString();
    var dayString = day.toString();
    var monthString = month.toString();
    var minuteString = minute.toString();
    var secondString = second.toString();
    var yearString = year.toString();

    var map = {
      '%H': hourString.padLeft(3 - hourString.length, '0'), // the pad values here are the desired length + 1
      '%d': dayString.padLeft(3 - dayString.length, '0'),
      '%m': monthString.padLeft(3 - monthString.length, '0'),
      '%M': minuteString.padLeft(3 - minuteString.length, '0'),
      '%S': secondString.padLeft(3 - secondString.length, '0'),
      '%Y': yearString.padLeft(5 - yearString.length, '0'),
    };
    return map.entries.fold(formatString, (acc, entry) => acc.replaceAll(entry.key, entry.value));
  }
}

extension DateTimeFormatTry on DateTime? {
  /// Supports the following, inspired by: https://linux.die.net/man/3/strptime
  /// %Y: The year, including century (for example, 1991).
  /// %m: The month number (1-12).
  /// %d: The day of month (1-31).
  /// %H: The hour (0-23).
  /// %M: The minute (0-59).
  /// %S: The second (0-59).
  String? format({String formatString = "dd.MM.yyyy"}) {
    if (this != null) {
      return DateFormat(formatString).format(this!);
    }
    return null;
  }
}

extension IntExtensions on int? {
  bool isEmpty({int def = 0}) {
    if (this == null) {
      return true;
    } else {
      return false;
    }
  }

  bool isNotEmpty({int def = 0}) {
    if (this == null) {
      return false;
    } else {
      return true;
    }
  }
}

extension NumExtension on num {
  String convertToPercentageString() {
    return ((this) * 10).toStringAsFixed(0) + ' %';
  }
}

extension StringExtension on String {
  String intelliTrim() {
    return length > 15 ? '${substring(0, 15)}...' : this;
  }

  DateTime? toDateTime() {
    if (isNotEmpty) {
      return DateTime.tryParse(this);
    }
    return null;
  }

  bool? toBool({bool defaultValue = false}) {
    return bool.fromEnvironment(this, defaultValue: defaultValue);
  }
}

/*
String? nameOf(dynamic o) {
  if (o == null) return "null";

  try {
    if (o is List) {
      var first = o.length > 0 ? o[0] : null;
      if (first != null) {
        var elementType = nameOf(first)!;
        Log.info("nameOf: List<$elementType>");
        //  if (!isMinified(elementType)) return "List<$elementType>";
      }
    } else {
      for (var v in o.declarations.values) {
        var name = v.simpleName;
      }
      Function? getTypeName = o.getTypeName;
      if (getTypeName != null) return getTypeName();
    }
  } catch (e, stackTrace) {
    Log.hata(
        "ignored nameOf error: $e, falling back to o.runtimeType: ${o.runtimeType}",
        {e, stackTrace});
  }

  return o.runtimeType.toString();
}
*/
