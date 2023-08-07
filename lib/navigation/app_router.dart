import 'package:flutter/material.dart';
import 'package:projects/management/app_state_manager.dart';
import 'package:projects/management/selected_manager.dart';
import 'package:projects/navigation/app_pages.dart';
import 'package:projects/ui/Item_page/item_screen.dart';
import 'package:projects/ui/home_page/home.dart';
import 'package:projects/ui/login_page/login_screen.dart';
import 'package:projects/ui/profile_page/profile_screen.dart';

import '../models/models.dart';
import '../ui/screens/onboarding_screen.dart';
import '../ui/screens/splash_screen.dart';
import 'app_link.dart';

class AppRouter extends RouterDelegate<AppLink>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppStateManager appStateManager;
  final SelectedManager selectedManager;
  final ProfileManager profileManager;

  AppRouter({
    required this.appStateManager,
    required this.selectedManager,
    required this.profileManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
    selectedManager.addListener(notifyListeners);
    profileManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    selectedManager.removeListener(notifyListeners);
    profileManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if (!appStateManager.isInitialized) ...[
          SplashScreen.page(),
        ] else if (!appStateManager.isLoggedIn) ...[
          LoginScreen.page(),
        ] else if (!appStateManager.isOnboardingComplete) ...[
          OnboardingScreen.page(),
        ] else ...[
          Home.page(appStateManager.getSelectedPage),
          if (selectedManager.selectedIndex != -1)
            ItemScreen.page(
                item: selectedManager.selectedSelectItem,
                index: selectedManager.selectedIndex,),
          if (profileManager.didSelectUser)  ProfileScreen.page(),
        ]
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    if (route.settings.name == AppPages.onboardingPath) {
      appStateManager.logout();
    }
    if (route.settings.name == AppPages.selectedItemDetails) {
      selectedManager.selectedItemTapped(-1);
    }
    if (route.settings.name == AppPages.profilePath) {
      profileManager.tapOnProfile(false);
    }
    return true;
  }

  @override
  AppLink get currentConfiguration => getCurrentPath();

  AppLink getCurrentPath() {
    if (!appStateManager.isLoggedIn) {
      return AppLink(location: AppPages.loginPath);
    } else if (!appStateManager.isOnboardingComplete) {
      return AppLink(location: AppPages.onboardingPath);
    } else if (profileManager.didSelectUser) {
      return AppLink(location: AppPages.profilePath);
    } else if (selectedManager.selectedSelectItem!= null) {
      final id = selectedManager.selectedSelectItem?.id;
      return AppLink(
        location: AppPages.selectedItemDetails,
        itemId: id,
      );
    } else {
      return AppLink(
          location: AppPages.home,
          currentTab: appStateManager.getSelectedPage);
    }
  }

  @override
  Future<void> setNewRoutePath(AppLink newLink) async {
    switch (newLink.location) {
      case AppPages.profilePath:
        profileManager.tapOnProfile(true);
        break;
      case AppPages.selectedItemDetails:
        final itemId = newLink.itemId;
        if (itemId != null) {
          selectedManager.setSelectedSelectItem(itemId);
        }
        profileManager.tapOnProfile(false);
        break;
      case AppPages.home:
        appStateManager.goToPage(newLink.currentTab ?? 0);
        profileManager.tapOnProfile(false);
        selectedManager.selectedItemTapped(-1);
        break;
      default:
        break;
    }
  }
}