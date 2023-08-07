import 'package:flutter/material.dart';
import 'package:projects/models/accounts.dart';


class SelectedManager extends ChangeNotifier {
  final _selectedItems = demoMyAccounts;
  int _selectedIndex = -1;

  List<AccountInfo> get selectedItems => List.unmodifiable(_selectedItems);
  int get selectedIndex => _selectedIndex;

  AccountInfo? get selectedSelectItem =>
      _selectedIndex != -1 ? _selectedItems[_selectedIndex] : null;

  void selectedItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void setSelectedSelectItem(String id) {
    final index = selectedItems.indexWhere((element) => element.id == id);
    _selectedIndex = index;
    notifyListeners();
  }


}