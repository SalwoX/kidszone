import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';


class Log {
  static final log = Logger('Kidszone');
  static info(
    Object? message, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    if (!kReleaseMode) {
      log.info(message, {error, stackTrace});
      printLogs();
    }
  }

  static warning(
    Object? message, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    if (!kReleaseMode) {
      log.warning(message, {error, stackTrace});
      printLogs();
    }
  }

  static uyari(
    Object? message, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    if (!kReleaseMode) {
      log.shout(message, {error, stackTrace});
      printLogs();
    }
  }

  static error(
    Object? message, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    if (!kReleaseMode) {
      log.severe(message, {error, stackTrace});
      printLogs();
    }
  }

  static config(
    Object? message, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    if (!kReleaseMode) {
      log.config(message, {error, stackTrace});
      printLogs();
    }
  }

  static fine(
    Object? message, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    if (!kReleaseMode) {
      log.fine(message, {error, stackTrace});
      printLogs();
    }
  }

  static finer(
    Object? message, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    if (!kReleaseMode) {
      log.finer(message, {error, stackTrace});
      printLogs();
    }
  }

  static finest(
    Object? message, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    if (!kReleaseMode) {
      log.finest(message, {error, stackTrace});
      printLogs();
    }
  }

  static printLogs() {
    Logger.root.level = Level.ALL; // defaults to Level.INFO
    Logger.root.onRecord.listen((record) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
  }
}
