import 'package:logging/logging.dart';

/// Does nothing with an error except logging it.
void logErrorHandler(Object error, [StackTrace? stackTrace]) {
  Logger('error handler').info(
    'silently ignoring error',
    error,
    stackTrace,
  );
}
