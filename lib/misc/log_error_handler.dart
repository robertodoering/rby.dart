import 'package:logging/logging.dart';

/// Does nothing with an error except logging it.
///
/// The [stackTrace] will be ignored and is only there to match common error
/// callback signatures.
void logErrorHandler(Object error, [StackTrace? stackTrace]) {
  Logger('error handler').info('ignoring error', error);
}
