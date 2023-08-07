import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:projects/management/selected_manager.dart';
import 'package:projects/navigation/app_route_parser.dart';
import 'package:projects/navigation/app_router.dart';
import 'package:projects/theme/app_theme.dart';
import 'package:provider/provider.dart';

import 'models/models.dart';
import 'management/profile_manager.dart';


extension DarkMode on BuildContext {
  bool get isDarkMode {
    final brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return brightness == Brightness.dark;
  }
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final _profileManager = ProfileManager();
  final _selectedManager = SelectedManager();
  final _appStateManager = AppStateManager();
  final routeParser = AppRouteParser();
  late AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
      selectedManager: _selectedManager,
      profileManager: _profileManager,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _appStateManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _selectedManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _profileManager,
        )
      ],
      child: Consumer<ProfileManager>(
        builder: (context, profileManager, child) {
          ThemeData theme;
          if (profileManager.darkMode) {
            theme = AppTheme.dark();
          } else {
            theme = AppTheme.light();
          }
          return MaterialApp.router(
            theme: theme,
            title: 'WebEmpty',
            backButtonDispatcher: RootBackButtonDispatcher(),
            routeInformationParser: routeParser,
            routerDelegate: _appRouter,
          );
        },
      ),
    );
  }

}