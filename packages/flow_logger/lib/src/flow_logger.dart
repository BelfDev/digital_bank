import 'dart:convert';
import 'dart:isolate';

import 'package:logger/logger.dart';

class FlowLogger {
  FlowLogger._();

  static final Logger _logger = Logger(
    filter: DevelopmentFilter(),
    printer: PrefixPrinter(
      PrettyPrinter(
        colors: true,
        printTime: true,
        stackTraceBeginIndex: 1,
      ),
    ),
    output: ConsoleOutput(),
  );

  /// Log a message at level [Level.verbose].
  static void logVerbose(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    _logger.log(Level.verbose, message, error, stackTrace);
  }

  /// Log a message at level [Level.debug].
  ///
  /// With DEBUG, you are giving diagnostic information in a detailed manner.
  /// It is verbose and has more information than you would need when using the
  /// application. DEBUG logging level is used to fetch information needed to
  /// diagnose, troubleshoot, or test an application.
  static void logDebug(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    _logger.log(Level.debug, message, error, stackTrace);
  }

  /// Log a message at level [Level.info].
  ///
  /// INFO messages are like the normal behavior of applications. They state what
  /// happened.
  static void logInfo(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    _logger.log(Level.info, message, error, stackTrace);
  }

  /// Log a message at level [Level.warning].
  ///
  /// The WARNING log level is used when you have detected an unexpected application
  /// problem. This means you are not quite sure whether the problem will recur
  /// or remain.
  static void logWarning(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    _logger.log(Level.warning, message, error, stackTrace);
  }

  /// Log a message at level [Level.error].
  ///
  /// This log level is used when a severe issue is stopping functions within
  /// the application from operating efficiently. Most of the time, the application
  /// will continue to run, but eventually, it will need to be addressed.
  static void logError(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    _logger.log(Level.error, message, error, stackTrace);
  }

  /// Log a message at level [Level.wtf].
  ///
  /// WTF stands for "What a Terrible Failure", a condition that should
  /// never happen.
  static void logWTF(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    _logger.log(Level.wtf, message, error, stackTrace);
  }

  static Future<void> logJsonResponse({
    String? name,
    required Map<String, dynamic> Function()? payloadConverter,
    bool skip = false,
  }) async {
    if (skip) {
      logDebug('Skipped full log for: $name');
      return;
    }

    try {
      final payload = await Isolate.run(() async {
        return _parsePayload(payloadConverter);
      });

      if (payload == null) {
        return;
      }

      final message = await Isolate.run(() async {
        return _stringifyMessage(payload);
      });

      logDebug(message);
    } catch (e) {
      logError(e);
    }
  }
}

Map<String, dynamic>? _parsePayload(
  Map<String, dynamic> Function()? payloadConverter,
) {
  final payload = payloadConverter?.call();
  return payload;
}

String _stringifyMessage(dynamic message) {
  final finalMessage = message is Function ? message() : message;
  if (finalMessage is Map || finalMessage is Iterable) {
    var encoder = const JsonEncoder.withIndent('  ', _toEncodableFallback);
    return encoder.convert(finalMessage);
  } else {
    return finalMessage.toString();
  }
}

// Handles any object that is causing JsonEncoder() problems
Object _toEncodableFallback(dynamic object) {
  return object.toString();
}
