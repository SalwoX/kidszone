import 'package:intl/intl.dart';

extension DatetimeExtensions on DateTime? {
  String? get toDateTimeString => this?.toIso8601String();
  String? get toDateString => this?.toIso8601String().split('T').first;
  String? get toTimeString => this?.toIso8601String().split('T').last.split('.').first;
  String? get toDateTimeStringWithTimeZone => this?.toIso8601String();
  String? get toDateStringWithTimeZone => this?.toIso8601String().split('T').first;
  String? get toTimeStringWithTimeZone => this?.toIso8601String().split('T').last.split('.').first;
  String get toDate => this != null ? DateFormat('dd/MM/yyyy').format(this!) : '';
  static String timeFormat(DateTime? time) {
    if (time == null) return '';

    int msSecond = 1 * 1000;
    int msMinute = msSecond * 60;
    int msHour = msMinute * 60;
    int msDay = msHour * 24;
    int msWeek = msDay * 7;
    int msMonth = msDay * 30;
    int msYear = msDay * 365;
    int difference = DateTime.now().millisecondsSinceEpoch - time.millisecondsSinceEpoch;
    int weekday = time.weekday;

    if (difference <= msSecond * 3) {
      return 'Az önce';
    } else if (difference < msMinute) {
      return '${(difference / msSecond).round()} saniye önce';
    } else if (difference <= msMinute * 3) {
      return 'Birkaç dakika önce';
    } else if (difference < msHour) {
      return '${(difference / msMinute).round()} dakika önce';
    } else if (difference <= msHour * 3) {
      return 'Birkaç saat önce';
    } else if (difference < msDay) {
      return '${(difference / msHour).round()} saat önce';
    } else if (difference < msDay * 2) {
      return 'Dün';
    } else if (difference < msDay * 3) {
      return 'Evvelsi gün';
    } else if (difference < msDay * 4) {
      return 'Geçen ${dayFormat(weekday)}';
    } else if (difference < msDay * 5) {
      return 'Geçen ${dayFormat(weekday)}';
    } else if (difference < msDay * 6) {
      return 'Geçen ${dayFormat(weekday)}';
    } else if (difference < msDay * 7) {
      return 'Geçen ${dayFormat(weekday)}';
    } else if (difference < msWeek * 2) {
      return 'Geçen hafta';
    } else if (difference < msMonth) {
      return '${(difference / msWeek).round()} hafta önce';
    } else if (difference < msMonth * 2) {
      return 'Geçen ay';
    } else if (difference < msYear) {
      return '${(difference / msMonth).round()} ay önce';
    } else if (difference < msYear * 2) {
      return 'Geçen yıl';
    } else {
      return '${(difference / msYear).round()} yıl önce';
    }
  }

  static String dayFormat(int day) {
    switch (day) {
      case 1:
        return 'Pazartesi';
      case 2:
        return 'Salı';
      case 3:
        return 'Çarşamba';
      case 4:
        return 'Perşembe';
      case 5:
        return 'Cuma';
      case 6:
        return 'Cumartesi';
      case 7:
        return 'Pazar';
      default:
        return 'geçersiz kod';
    }
  }

  
}
