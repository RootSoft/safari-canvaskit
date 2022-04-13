import 'package:flutter/material.dart';
import 'package:safari_canvaskit/navigation/navigation_tab.dart';
import 'package:safari_canvaskit/pages/home_page.dart';
import 'package:safari_canvaskit/pages/seach_page.dart';

Map<NavigationTab, Widget> provideTabWidgets() => {
      NavigationTab.home: HomePage(),
      NavigationTab.search: SearchPage(),
      NavigationTab.store: Container(color: Colors.yellow),
      NavigationTab.explore: Container(color: Colors.green),
      NavigationTab.profile: Container(color: Colors.blue),
    };

List<NavigationTab> provideTabs() => provideTabWidgets().keys.toList();
