import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/tnpSideMenuItems.dart';

class SideMenuModel extends ChangeNotifier {
  String _menuItem;
  int _selectedIndex;

  get selectedItem => _menuItem != null ? _menuItem : TNPSIDEMENULIST[0];
  setSideMenuItem(String item) {
    _selectedIndex = TNPSIDEMENULIST.indexOf(item);
    if (_selectedIndex < 0) Error();
    _menuItem = item;
    notifyListeners();
  }
}
