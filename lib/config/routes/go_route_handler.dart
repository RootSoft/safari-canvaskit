import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

typedef GoRouterWidgetBuilder = Widget Function(
  BuildContext context,
  GoRouterState state,
);

class GoRouteHandler {
  final GoRouterWidgetBuilder builder;

  GoRouteHandler({required this.builder});
}
