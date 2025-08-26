import 'package:flutter/material.dart';
import "package:flashy_tab_bar2/flashy_tab_bar2.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sarajevo_travel/screens/events_screen.dart';
import 'package:sarajevo_travel/features/objects/presentation/pages/objects_screen.dart';
import 'package:sarajevo_travel/screens/settings_screen.dart';

// Dodaj enum za tabove
enum TabItem { objects, events, settings }

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  // Svaki tab ima svoj Navigator
  final Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.objects: GlobalKey<NavigatorState>(),
    TabItem.events: GlobalKey<NavigatorState>(),
    TabItem.settings: GlobalKey<NavigatorState>(),
  };

  // Helper za dobijanje trenutnog TabItem-a
  TabItem get _currentTab => TabItem.values[_selectedIndex];

  // Widgeti za svaki tab
  Map<TabItem, Widget> get _tabScreens => {
    TabItem.objects: const ObjectsScreen(),
    TabItem.events: const EventsScreen(),
    TabItem.settings: const SettingsScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          final isFirstRouteInCurrentTab = !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
          if (isFirstRouteInCurrentTab) {
            Navigator.of(context).maybePop();
          }
        }
      },

      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children:
              TabItem.values.map((tabItem) {
                return Navigator(
                  key: _navigatorKeys[tabItem],
                  onGenerateRoute: (settings) {
                    return MaterialPageRoute(builder: (_) => _tabScreens[tabItem]!, settings: settings);
                  },
                );
              }).toList(),
        ),
        bottomNavigationBar: FlashyTabBar(
          shadows: [
            BoxShadow(
              color: Colors.grey.withAlpha(Theme.of(context).brightness == Brightness.dark ? 80 : 200),
              blurRadius: 1,
            ),
          ],
          backgroundColor: Theme.of(context).colorScheme.surface,
          selectedIndex: _selectedIndex,
          showElevation: true,
          onItemSelected: (index) => setState(() => _selectedIndex = index),
          items: [
            FlashyTabBarItem(
              icon: SvgPicture.asset(
                'assets/tab_icons/home.svg',
                height: 32,
                width: 32,
                colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onPrimary, BlendMode.srcIn),
              ),
              activeColor: Theme.of(context).colorScheme.primary,
              inactiveColor: Theme.of(context).colorScheme.onPrimary,
              title: Text('Objekti'),
            ),
            FlashyTabBarItem(
              icon: SvgPicture.asset(
                'assets/tab_icons/schedule.svg',
                height: 32,
                width: 32,
                colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onPrimary, BlendMode.srcIn),
              ),
              activeColor: Theme.of(context).colorScheme.primary,
              inactiveColor: Theme.of(context).colorScheme.onPrimary,
              title: Text('Događaji'),
            ),
            FlashyTabBarItem(
              icon: SvgPicture.asset(
                'assets/tab_icons/settings.svg',
                height: 32,
                width: 32,
                colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onPrimary, BlendMode.srcIn),
              ),
              activeColor: Theme.of(context).colorScheme.primary,
              title: Text('Postavke'),
            ),
          ],
        ),
      ),
    );
  }
}
