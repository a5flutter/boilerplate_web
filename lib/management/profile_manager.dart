import 'package:flutter/material.dart';

import '../models/models.dart';

class ProfileManager extends ChangeNotifier {
  User get getUser => User(
      firstName: 'User',
      lastName: 'Name',
      role: 'Specialist',
      profileImageUrl: 'assets/images/person_stef.jpg',
      points: 100,
      darkMode: _darkMode);

  bool get didSelectUser => _didSelectUser;
  bool get darkMode => _darkMode;

  var _didSelectUser = false;
  var _darkMode = false;

  void set darkMode(bool darkMode) {
    _darkMode = darkMode;
    notifyListeners();
  }

  void tapOnProfile(bool selected) {
    _didSelectUser = selected;
    notifyListeners();
  }
}