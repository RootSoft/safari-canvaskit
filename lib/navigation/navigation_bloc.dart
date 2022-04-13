import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safari_canvaskit/navigation/navigation_tab.dart';

class NavigationBloc extends Cubit<NavigationTab> {
  NavigationBloc(NavigationTab initialState) : super(initialState);

  /// Change the tab.
  void changeTab(NavigationTab tab) => emit(tab);

  /// Get the current selected tab.
  NavigationTab get currentTab => state;
}
