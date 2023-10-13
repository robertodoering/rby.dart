import 'dart:async';

import 'package:flutter/foundation.dart';

class Debouncer {
  Debouncer(this.delay);

  final Duration delay;
  Timer? _timer;

  void call(VoidCallback callback) {
    _timer?.cancel();
    _timer = Timer(delay, callback);
  }

  void dispose() => _timer?.cancel();
}
