import 'dart:async';

class Throttle {
  Throttle(this.duration);
  
  final Duration duration;
  Timer? _timer;

  void call(void Function() action) {
    if (_timer == null || !_timer!.isActive) {
      action();
      _timer = Timer(duration, () {});
    }
  }

  void dispose() {
    _timer?.cancel();
  }
}
