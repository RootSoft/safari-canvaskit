import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:safari_canvaskit/navigation/navigation_bloc.dart';
import 'package:safari_canvaskit/navigation/navigation_tab.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/';

  final List<NavigationTab> tabs;
  final Map<NavigationTab, Widget> tabWidgets;

  const MainScreen({
    Key? key,
    required this.tabs,
    required this.tabWidgets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Builder(
        builder: (_) {
          final navigation = context.watch<NavigationBloc>().state;
          return IndexedStack(
            index: tabs.indexOf(navigation),
            children: tabWidgets.values.toList(),
          );
        },
      ),
      bottomNavigationBar: Builder(
        builder: (_) {
          final navigation = context.watch<NavigationBloc>().state;
          return BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            currentIndex: tabs.indexOf(navigation),
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.red,
            items: tabs
                .map(
                  (tab) => BottomNavigationBarItem(
                    icon: HeroIcon(tab.heroIcon),
                    label: tab.label,
                  ),
                )
                .toList(),
            onTap: (index) {
              context.read<NavigationBloc>().changeTab(tabs[index]);
            },
          );
        },
      ),
    );
  }
}
