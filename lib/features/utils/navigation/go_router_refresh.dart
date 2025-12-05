// utils/go_router_refresh.dart
import 'dart:async';
import 'package:flutter/foundation.dart';

/// Turns a Stream into a Listenable for GoRouter's `refreshListenable`.
/// Not present in some go_router versions, so we provide it.
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    // Use a broadcast stream so multiple listeners are safe.
    _subscription = stream.asBroadcastStream().listen((_) {
      notifyListeners();
    }, onError: (err) {
    
      notifyListeners();
    });
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
