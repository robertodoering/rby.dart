extension HandleFutureError<R> on Future<R> {
  /// Extension on a future that will return the result of the future, or `null`
  /// if an exception occurred.
  Future<R?> handleError([
    void Function(Object error, StackTrace stackTrace)? onError,
  ]) async {
    try {
      return await this;
    } catch (e, st) {
      onError?.call(e, st);
      return null;
    }
  }
}
