import 'package:heroicons/heroicons.dart';

enum NavigationTab {
  home,
  search,
  store,
  explore,
  profile,
}

const tabsEnumMap = <NavigationTab, int>{
  NavigationTab.home: 1,
  NavigationTab.search: 2,
  NavigationTab.store: 3,
  NavigationTab.explore: 4,
  NavigationTab.profile: 5,
};

extension NavigationTabExtension on NavigationTab {
  /// Get the label for this navigation tab.
  String get label {
    switch (this) {
      case NavigationTab.home:
        return 'Home';
      case NavigationTab.search:
        return 'Search';
      case NavigationTab.store:
        return 'Store';
      case NavigationTab.explore:
        return 'Explore';
      case NavigationTab.profile:
        return 'Profile';
    }
  }

  /// Get the icon for this navigation tab.
  HeroIcons get heroIcon {
    switch (this) {
      case NavigationTab.home:
        return HeroIcons.viewGrid;
      case NavigationTab.search:
        return HeroIcons.search;
      case NavigationTab.store:
        return HeroIcons.shoppingBag;
      case NavigationTab.explore:
        return HeroIcons.collection;
      case NavigationTab.profile:
        return HeroIcons.user;
    }
  }
}
