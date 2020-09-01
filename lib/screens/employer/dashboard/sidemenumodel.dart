import 'package:flutter/material.dart';
import 'package:highfives_ui/constants/const/employerSideMenuItems.dart';

class EmployerSideMenuModel extends ChangeNotifier {
  String _menuItem;
  int _selectedIndex;

  EmployerSideMenuModel(this._selectedIndex) {
    _menuItem = EMPLOYERSIDEMENULIST[_selectedIndex];
  }
  get selectedItem => _menuItem;
  setSideMenuItem(String item) {
    _selectedIndex = EMPLOYERSIDEMENULIST.indexOf(item);
    if (_selectedIndex < 0) Error();
    _menuItem = item;
    notifyListeners();
  }
}
