import 'package:flutter/material.dart';
import 'package:top_talent_agency/common/navBar/bottom_tab_item.dart';
import 'package:top_talent_agency/common/navBar/bottom_tabs.dart';
import 'package:top_talent_agency/common/navBar/custom_bottom_navbar.dart';
import 'package:top_talent_agency/core/roles.dart';
import 'package:top_talent_agency/features/alert/screen/alerts_screen.dart';
import 'package:top_talent_agency/features/home/screen/home_screen.dart';
import 'package:top_talent_agency/features/manager/screen/view_assign_creator_screen.dart';

class AppShell extends StatefulWidget {
  final UiUserRole role;

  const AppShell({super.key, required this.role});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int index = 2;

  late final List<GlobalKey<NavigatorState>> _navigatorKeys;

  List<BottomTabItem> get visibleTabs {
    return bottomTabs.where((tab) {
      if (widget.role == UiUserRole.admin) {
        return tab.admin;
      }
      return tab.manager;
    }).map((tab) {

      if (tab.isCenter) {
        return BottomTabItem(
          label: tab.label,
          icon: tab.icon,
          isCenter: true,
          admin: tab.admin,
          manager: tab.manager,
          page: HomeScreen(role: widget.role),
        );
      }

      if (tab.label == "Creators") {
        return BottomTabItem(
          label: tab.label,
          icon: tab.icon,
          admin: tab.admin,
          manager: tab.manager,
          page: ViewAssignCreatorsScreen(role: widget.role),
        );
      }

      if (tab.label == "Alerts") {
        return BottomTabItem(
          label: tab.label,
          icon: tab.icon,
          admin: tab.admin,
          manager: tab.manager,
          page: AlertsScreen(role: widget.role),
        );
      }

      return tab;
    }).toList();
  }


  @override
  void initState() {
    super.initState();
    _navigatorKeys = List.generate(6, (_) => GlobalKey<NavigatorState>());
  }

  @override
  Widget build(BuildContext context) {
    final tabs = visibleTabs;

    return Scaffold(
      body: IndexedStack(
        index: index,
        children: List.generate(tabs.length, (i) {
          return Navigator(
            key: _navigatorKeys[i],
            onGenerateRoute: (_) {
              return MaterialPageRoute(
                builder: (_) => tabs[i].page,
              );
            },
          );
        }),
      ),
      bottomNavigationBar: CustomBottomNav(
        tabs: tabs,
        currentIndex: index,
        onTap: (i) {
          if (i == index) {
            _navigatorKeys[i]
                .currentState
                ?.popUntil((route) => route.isFirst);
          } else {
            setState(() => index = i);
          }
        },
      ),
    );
  }
}
