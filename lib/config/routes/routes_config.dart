import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:safari_canvaskit/config/routes/go_navigator.dart';
import 'package:safari_canvaskit/config/routes/go_route_handler.dart';
import 'package:safari_canvaskit/navigation/navigation_bloc.dart';
import 'package:safari_canvaskit/navigation/navigation_config.dart';
import 'package:safari_canvaskit/navigation/navigation_tab.dart';
import 'package:safari_canvaskit/screens/main_screen.dart';

final router = GoNavigator();

GoRouter configureRoutes(String initialRoute) {
  final router2 = GoRouter(
    routes: [
      GoRoute(
        path: MainScreen.routeName,
        builder: mainHandler.builder,
      ),
    ],
    errorBuilder: (context, state) => Container(color: Colors.red),
    initialLocation: initialRoute,
    urlPathStrategy: UrlPathStrategy.path,
  );

  return router2;
}

final mainHandler = GoRouteHandler(
  builder: (context, state) {
    return provideMainScreen();
  },
);

Widget provideMainScreen() {
  final tabs = provideTabs();
  final tabWidgets = provideTabWidgets();

  return MultiBlocProvider(
    providers: [
      BlocProvider<NavigationBloc>(
        create: (_) => NavigationBloc(NavigationTab.home),
      )
    ],
    child: MainScreen(
      tabs: tabs,
      tabWidgets: tabWidgets,
    ),
  );
}
