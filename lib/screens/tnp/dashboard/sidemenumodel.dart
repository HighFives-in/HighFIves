import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/tnpSideMenuItems.dart';

class SideMenuModel extends ChangeNotifier {
  SideMenuModel(this._selectedIndex) {
    _menuItem = TNPSIDEMENULIST[_selectedIndex];
  }
  String _menuItem;
  int _selectedIndex;

  get selectedItem => _menuItem;
  setSideMenuItem(String item) {
    _selectedIndex = TNPSIDEMENULIST.indexOf(item);
    if (_selectedIndex < 0) Error();
    _menuItem = item;
    notifyListeners();
  }
}
