import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safari_canvaskit/navigation/navigation_bloc.dart';
import 'package:safari_canvaskit/navigation/navigation_config.dart';
import 'package:safari_canvaskit/navigation/navigation_tab.dart';
import 'package:safari_canvaskit/screens/main_screen.dart';

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
