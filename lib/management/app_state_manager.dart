import 'dart:async';

import 'package:flutter/material.dart';

import '../utils/app_cache.dart';

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;
  bool _loggedIn = false;
  bool _onboardingComplete = false;
  int _selectedPage = 0;
  final _appCache = AppCache();

  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  bool get isOnboardingComplete => _onboardingComplete;
  int get getSelectedPage => _selectedPage;

  void initializeApp() async {
    _loggedIn = await _appCache.isUserLoggedIn();
    _onboardingComplete = await _appCache.didCompleteOnboarding();

    Timer(const Duration(milliseconds: 2000), () {
      _initialized = true;
      notifyListeners();
    });
  }

  void login(String username, String password) async {
    _loggedIn = true;
    await _appCache.cacheUser();
    notifyListeners();
  }

  void onboarded() async {
    _onboardingComplete = true;
    await _appCache.completeOnboarding();
    notifyListeners();
  }

  void goToPage(index) {
    _selectedPage = index;
    notifyListeners();
  }

  void logout() async {
    _initialized = false;
    _selectedPage = 0;
    await _appCache.invalidate();

    initializeApp();
    notifyListeners();
  }
}