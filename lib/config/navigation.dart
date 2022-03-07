import 'package:flutter/widgets.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static get key => _navigatorKey;

  static push(String route) {
    _navigatorKey.currentState!.pushNamed(route);
  }

  static replace(String route) {
    _navigatorKey.currentState!.pushReplacementNamed(route);
  }

  static goBack() {
    _navigatorKey.currentState!.pop();
  }
}
