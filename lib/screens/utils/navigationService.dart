import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navitgateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  goBack() {
    return navigatorKey.currentState.pop();
  }
}
