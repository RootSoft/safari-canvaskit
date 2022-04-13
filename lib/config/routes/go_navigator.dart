import 'package:flutter/material.dart';

class GoNavigator {
  void navigateTo(
    BuildContext context,
    String route, {
    bool clearStack = false,
    bool replace = false,
    RouteSettings? routeSettings,
  }) {
    if (clearStack || replace) {
      GoRouter.of(context).go(route, extra: routeSettings);
    } else {
      GoRouter.of(context).push(route, extra: routeSettings);
    }
  }

  void pop(
    BuildContext context, {
    int pages = 1,
    bool rootNavigator = true,
  }) {
    for (int i = 0; i < pages; i++) {
      if (rootNavigator) {
        GoRouter.of(context).pop();
      } else {
        Navigator.of(context, rootNavigator: rootNavigator).pop();
      }
    }
  }
}
