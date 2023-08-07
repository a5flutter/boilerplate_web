import 'package:flutter/material.dart';
import 'package:projects/navigation/app_pages.dart';
import 'package:projects/ui/accounts_page/accounts_screen.dart';
import 'package:projects/ui/dashboard_page/dashboard_screen.dart';
import 'package:projects/ui/profile_page/profile_screen.dart';
import 'package:projects/ui/responsive.dart';
import 'package:projects/ui/settings_page/settings_page.dart';
import 'package:projects/ui/some_page/some_page.dart';
import 'package:provider/provider.dart';
import 'package:side_navigation/side_navigation.dart';
import '../../models/models.dart';
import '../../theme/app_theme.dart';


class Home extends StatefulWidget {
  static MaterialPage page(int currentTab) {
    return MaterialPage(
      name: AppPages.home,
      key: ValueKey(AppPages.home),
      child: Home(
        currentTab: currentTab,
      ),
    );
  }

  const Home({
    Key? key,
    required this.currentTab,
  }) : super(key: key);

  final int currentTab;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Widget> pages = <Widget>[
    DashboardScreen(),
    AccountsScreen(),
    SomeScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<AppStateManager>(
      builder: (context, appStateManager, child) {
        return  Scaffold(
          backgroundColor: theme.backgroundColor,
            appBar: AppBar(
              title: Text(
                'Web app',
              ),
            ),
            drawer: !Responsive.isDesktop(context) ? SideMenu(appStateManager) : null,
            body: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (Responsive.isDesktop(context))
                    Expanded(
                      child: SideMenu(appStateManager),
                    ),
                  Expanded(
                    flex: 5,
                    child: IndexedStack(
                      index: widget.currentTab,
                      children: pages,
                    ),
                  ),
                ],
              ),
            ),
          );
      },
    );
  }

  Widget SideMenu (AppStateManager appStateManager) {
    return Consumer<ProfileManager>(
        builder: (context, profileManager, child) {
        return SideNavigationBar(
          theme: SideNavigationBarTheme(
            itemTheme: !profileManager.darkMode ? AppTheme.lightSideNavBar : AppTheme.darkSideNavBar,
           togglerTheme: SideNavigationBarTogglerTheme.standard(),
           dividerTheme: SideNavigationBarDividerTheme.standard(),
          ),
          header: SideNavigationBarHeader(
            image: Center(child: SizedBox(
                height: 120,
                width: 150,
                child: Image.asset("assets/images/flutter_logo.png"))),
            title: SizedBox(),
            subtitle: SizedBox(),
          ),
          selectedIndex: widget.currentTab,
          items: const [
            SideNavigationBarItem(
              icon: Icons.dashboard,
              label: 'Dashboard',
            ),
            SideNavigationBarItem(
              icon: Icons.account_balance,
              label: 'Accounts',
            ),
            SideNavigationBarItem(
              icon: Icons.money,
              label: 'Transactions',
            ),
            SideNavigationBarItem(
              icon: Icons.person,
              label: 'Profile',
            ),
            SideNavigationBarItem(
              icon: Icons.settings,
              label: 'Settings',
            ),
          ],
          onTap: (index) {
            appStateManager.goToPage(index);
          },
        );
      }
    );
  }
}