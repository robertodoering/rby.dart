import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';

/// A convenience mixin to expose a [Logger] instance for classes named after
/// their type.
mixin LoggerMixin {
  Logger get log => Logger('$runtimeType');
}

void initializeLogger({
  Level level = Level.ALL,
}) {
  Logger.root.level = level;
  Logger.root.onRecord.listen(_printRecord);
}

void _printRecord(LogRecord record) {
  final message = record.message;
  final error = record.error;
  final stackTrace = record.stackTrace;

  final buffer = StringBuffer()
    ..write('[')
    ..write(DateFormat('HH:mm:s.S').format(DateTime.now()))
    ..write(' | ')
    ..write(record.level.name.padRight(7));

  if (record.loggerName.isNotEmpty) {
    buffer
      ..write(' | ')
      ..write(record.loggerName);
  }

  buffer
    ..write('] ')
    ..write(message);

  final color = _levelColor(record.level);

  _colorize('$buffer', color);

  if (error != null) {
    _printError(error, stackTrace);
  }
}

void _printError(Object error, StackTrace? stackTrace) {
  final buffer = StringBuffer()
    ..write('[ERROR]')
    ..write('\n');

  if (error is Response) {
    buffer
      ..write(error.statusCode)
      ..write('\n')
      ..write(error.body);
  } else {
    buffer.write(error);
  }

  _colorize('$buffer', '\x1B[31m');

  if (stackTrace != null) {
    final buffer = StringBuffer()
      ..write('[STACKTRACE]')
      ..write('\n')
      ..write(stackTrace);

    _colorize('$buffer', '\x1B[2;31m');
  }
}

String _levelColor(Level level) {
  switch (level) {
    case Level.FINEST:
    case Level.FINER:
    case Level.FINE:
      // white, faint
      return '\x1B[2;37m';
    case Level.CONFIG:
    case Level.INFO:
      // blue
      return '\x1B[34m';
    case Level.WARNING:
      // yellow
      return '\x1B[33m';
    case Level.SEVERE:
      // red
      return '\x1B[31m';
    case Level.SHOUT:
      // red, bold
      return '\x1B[1;31m';
    default:
      // cyan
      return '\x1B[36m';
  }
}

void _colorize(String message, String color) {
  for (final line in message.split('\n')) {
    debugPrint('$color$line\x1B[0m');
  }
}
